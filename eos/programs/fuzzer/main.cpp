#include <iostream>
#include <fstream>
#include <chrono>
#include <ctime>
#include <unistd.h>

#include <fc/io/json.hpp>
#include <eosio/chain/abi_def.hpp>
#include <eosio/chain/asset.hpp>

#include "logger.hpp"
#include "data.hpp"
#include "type.hpp"
#include "tester.hpp"
#include "result.hpp"
#include "setting.hpp"
#include "pipe.hpp"
#include "wastparser.hpp"
#include "coverage.hpp"

using namespace fuzzer;

/**
 * @description: The entry point of fuzzer.
 * @param
 *      argc: the count of arguments, >= 4
 *      argv: the variables of arguments, including ABI file, contract, action, account
 * @return: The return value of fuzzer.
 */
int main(int argc, char** argv) {

    // Initialize a logger
    Logger logger;
    logger.addOstream(&std::cout);

    for(int i = 0; i < argc; ++i) logger.log(argv[i]);

    if(argc < 5) {
        logger.log("Invalid arguments, requiring abiFile, contract, function, account. ");
        return -1;
    }

    // some constant strings
    std::string logFileName = filePath + "fuzzer.log",
                abiFileName = argv[1],
                contractName = argv[2],
                functionName = argv[3],
                accountName = argv[4];

    int testKind = -1, nextKind = -1;
    if(argc >= 7) testKind = atol(argv[6]);

    // use WASM text to generate a string pool
    Pipe wastPipe;
    wastPipe.exe = "eosio-wasm2wast";
    wastPipe.args = abiFileName.substr(0, abiFileName.find_last_of(".")) + ".wasm";
    wastPipe.execute();
    WastParser wastParser(wastPipe.output);
    std::vector <std::string> stringPool = wastParser.getStringsInFunctionWithCertainParam("(param i32 i64 i64 i32 i32)");
    //std::vector <std::string> stringPool = wastParser.getAllStrings();
    setStringPoolPtr(&stringPool);

    logger.addLogFile(logFileName);

    // initialize an account pool
    Setting setting;
    setting.initAccountList(filePath + "accounts.conf");

    int maxPeriod = 100;
    if(argc >= 6) maxPeriod = atol(argv[5]);

    // Initialize a result recorder
    Results results(&logger, 3);
    bool acceptEOSToken = true;

    // get the origin balance of the contract
    Pipe pipeGetBalance;
    pipeGetBalance.exe = "cleos";
    pipeGetBalance.args = "get currency balance eosio.token " + contractName + " EOS";
    pipeGetBalance.execute();
    if(pipeGetBalance.output.size() != 1) {
        logger.log("Get currency balance " + contractName + " Failed");
        for(auto outLine : pipeGetBalance.output) {
            logger << outLine;
        }
        return 0;
    }
    eosio::chain::asset originBalance = eosio::chain::asset::from_string(pipeGetBalance.output[0]);
    logger.log("origin balance = " + originBalance.to_string());

    Coverage coverage;

    int invalidCount = 0;
    
    auto startTime = std::chrono::system_clock::now();

    // the loop for all test cases
    for(int iPeriod = 1; iPeriod <= maxPeriod; ++iPeriod) {
        // initalize the type analyzer
        Type ty;
        ty.pSetting = &setting;
        ty.activeAccount = accountName;

        // decide the next kind
        int kind = testKind;
        if(nextKind >= 0) {
            kind = nextKind;
            nextKind = -1;
        }
        else {
            if(iPeriod == 1) kind = 3;
            else {
                if(acceptEOSToken) {
                    if(kind < 0) kind = randomInt(0, 2);
                } 
                else kind = 0;
            }
        }

        if(!ty.readFromFile(abiFileName)) {
            logger.log("Open abiFile failed, which in: " + abiFileName);
            return -1;
        }

        // when no actions in list then only test fake and forged
        if(kind == 0 && ty.abi.actions.size() == 0) {
            if(acceptEOSToken) kind = randomInt(1, 2);
            else {
                logger.log("NOT accept EOS, also has NO actions");
                break;
            }
        }
        
        std::string realContractName, realFunctionName, realAccountName;
        if(kind == 0) {
            realContractName = contractName;
            realFunctionName = functionName;
            realAccountName = accountName;
        }
        else if(kind == 1) {
            realContractName = "eosio.token";
            realFunctionName = "transfer";
            realAccountName = ty.forgedNotificationTokenFromName;
        }
        else if(kind == 2) {
            realContractName = ty.fakeTransferAgentName;
            realFunctionName = "transfer";
            realAccountName = ty.fakeTransferAgentName;
        }
        else if(kind == 3) {
            realContractName = "eosio.token";
            realFunctionName = "transfer";
            realAccountName = ty.testEOSTokenFromName;
        }
        ty.contractName = realContractName;

        int seed = iPeriod * std::chrono::duration_cast<std::chrono::nanoseconds>(std::chrono::system_clock::now().time_since_epoch()).count();
        initRandomEngine(seed);
        logger.log("count: " + std::to_string(iPeriod));
        logger.log("kind: " + std::to_string(kind));
        logger.log("seed: " + std::to_string(seed));
        __attribute__((unused)) int _UNUSED_PASS_FIRST_RANDOM_NUMBER = randomInt(0, seed);

        if(functionName == ":ALL" && kind == 0) realFunctionName = ty.getRandomActionName();
        logger.log("action: " + realContractName + "::" + realFunctionName);
        logger.log("data: " + ty.generateNewData(realFunctionName, kind));
        if(ty.realActiveAccount.length()) realAccountName = ty.realActiveAccount;
        logger.log("account: " + realAccountName);

        /* clear instrumenting file */
        std::ofstream fOpClear(filePath + "op.txt", std::ios::out);
        fOpClear.close();
        std::ofstream fFuncClear(filePath + "func.txt", std::ios::out);
        fFuncClear.close();
        std::ofstream fLogfileClear(filePath + "logfile.txt", std::ios::out);
        fLogfileClear.close();
        Pipe pRmCovBin;
        pRmCovBin.exe = "rm";
        pRmCovBin.args = filePath + "cov_*.bin";
        pRmCovBin.execute();
        
        // use cleos to push an action
        Pipe pipe;
        pipe.exe = "cleos";
        pipe.args = "push action " + realContractName + " " + realFunctionName + " '" + ty.testArgument + "' -p " + realAccountName + "@active -f 2>&1";
        logger.log(pipe.exe + " " + pipe.args);
        pipe.execute();
        for(auto outLine : pipe.output) {
            logger << outLine;
        }
        logger.log("exitStatus = " + std::to_string(pipe.exitStatus));
        bool successExit = (pipe.exitStatus == 0);

        /*
        if(pipe.find("3080006: Transaction took too long")) logger.log("too long");
        else logger.log("not too long");
        */
        
        // initialze the tester
        Tester tester(&logger, &pipe);
        if(!tester.isValid) {
            logger.log("This test case is not valid\n");
            ++invalidCount;
            // use invalidCount to prevent all failed
            if(invalidCount < maxPeriod / 2) {
                if(kind == 3) nextKind = 3;
                continue;
            }
        }

        //if(kind != 3 && (tester.usedTaposBlockNum() || tester.usedTaposBlockPrefix())) {
        /*if(tester.usedTaposBlockNum() || tester.usedTaposBlockPrefix()) {
            std::string argument = ty.testArgument;
            if(tester.usedTaposBlockNum()) {
                argument += " tapos_block_num()";
                logger.log("Used tapos_block_num()");
            }
            if(tester.usedTaposBlockPrefix()) {
                argument += " tapos_block_prefix()";
                logger.log("Used tapos_block_prefix()");
            }
            if(tester.usedEosioTokenTransfer()) {
                argument += " eosio.token::transfer()";
                logger.log("Used eosio.token::transfer()");
            }
            results.add(true, successExit, realContractName == contractName ? realFunctionName : "transfer", 0, argument);
        }
        else results.add(false, successExit, realContractName == contractName ? realFunctionName : "transfer", 0);*/

        if(tester.usedTaposFunctionThenEosioTokenTransfer()) {
            results.add(true, successExit, realContractName == contractName ? realFunctionName : "transfer", 0, ty.testArgument);
        }
        else {
            results.add(false, successExit, realContractName == contractName ? realFunctionName : "transfer", 0);
        }

        if(kind == 1) {
            //if(tester.hasForgedNotificationBug(eosio::chain::string_to_name(ty.forgedNotificationAgentName.c_str()), eosio::chain::string_to_name(contractName.c_str()))) {
            int _magic = tester.checkForgedNotificationBug(eosio::chain::string_to_name(ty.forgedNotificationAgentName.c_str()), eosio::chain::string_to_name(contractName.c_str()));
            if(_magic == 1) {
                results.add(true, successExit, "transfer", kind, ty.testArgument);
                //logger.log("Has forged notification bug");
                logger.log("Check forged notification bug");
            }
            else if (_magic == 0) results.add(false, successExit, "transfer", kind);
        }  

        if(kind == 2) {
            if(tester.hasFakeTransferBug(eosio::chain::string_to_name(ty.fakeTransferAgentName.c_str()), eosio::chain::string_to_name(contractName.c_str()))) {
                results.add(true, successExit, "transfer", kind, ty.testArgument);
                logger.log("Has fake transfer bug");
            }
            else results.add(false, successExit, "transfer", kind);
        }

        if(kind == 3) {
            acceptEOSToken = tester.acceptEOSToken() || pipe.find("3080006: Transaction took too long");
            if(acceptEOSToken) logger.log("Accept EOS token");
            else logger.log("Not accept EOS token");
            pipe.exe = "cleos";
            pipe.args = "get currency balance eosio.token " + contractName + " EOS";
            pipe.execute();
            if(pipe.output.size() == 1) {
                originBalance = eosio::chain::asset::from_string(pipe.output[0]);
            }
        }

        // analyze the coverage, not being used
        pipe.exe = "ls";
        pipe.args = filePath + "cov_*.bin";
        pipe.execute();
        for(const std::string& covFileName : pipe.output) {
            std::size_t startOfLen = covFileName.find_last_of("cov_") + 4;
            int lenOfLen = -1;
            while(isdigit(covFileName[startOfLen + (++lenOfLen)]));
            if(coverage.isIgnored(std::stoull(covFileName.substr(startOfLen, lenOfLen)))) continue;
            std::ifstream ifsCov(covFileName.substr(0, covFileName.length() - 1), std::ios::binary);

            coverage.updatePcSet(ifsCov);
            ifsCov.close();
        }
        logger.log("Coverage: " + std::to_string(coverage.pcSet.size()));
        
        // get the curreny balance of the contract
        pipe.exe = "cleos";
        pipe.args = "get currency balance eosio.token " + contractName + " EOS";
        pipe.execute();
        eosio::chain::asset nowBalance = eosio::chain::asset::from_string("0.0000 EOS");
        if(pipe.output.size() == 1) {
            nowBalance = eosio::chain::asset::from_string(pipe.output[0]);
        }
        logger.log("now balance = " + nowBalance.to_string());
        if(nowBalance < originBalance) {
            logger.log("ATTACK SUCCEEDED");
        }

        logger.log("");
    }

    results.acceptEOSToken = acceptEOSToken;
    if(!results.toFileArticle(filePath + "article.txt")) return -1;

    auto endTime = std::chrono::system_clock::now();

    std::chrono::duration<double> loopTimeInSeconds = endTime-startTime;
    logger.log("\nLoop time: " + std::to_string(loopTimeInSeconds.count()));
    logger.log("\nCount of test cases: " + std::to_string(maxPeriod));

    return 0;
}

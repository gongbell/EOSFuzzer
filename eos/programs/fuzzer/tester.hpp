#pragma once

#include <cstdlib>
#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <stdexcept>

#include <eosio/chain/types.hpp>

#include "logger.hpp"
#include "pipe.hpp"

namespace fuzzer {

/**
 * @description: Generate a string with Eq or Ne instruct.
 * @param
 *      isEq: true means Eq, and false means Ne
 *      type: the type of instruct, like "uint64_t"
 *      a: an operand
 *      b: another operand
 * @return: The string generated, like "Eq<uint64_t>(0,0)(1)".
 */
std::string generateEqNeString(bool isEq, const std::string& type, const std::string& a, const std::string& b) {
    return std::string(isEq ? "Eq" : "Ne") 
        + "<" + type + ">(" 
        + a + "," + b + ")(" 
        + ((a == b ^ !isEq) ? "1" : "0") + ")";
}

/**
 * @description: A constant string of indirect call.
 */
std::string CALL_INDIRECT = "CallIndirect";
/**
 * @description: Length of the string above.
 */
int CALL_INDIRECT_LENGTH = 12;
/**
 * @description: Judge a string contains "CallIndirect".
 * @param
 *      str: the string
 * @return: Return true if it contains.
 */
bool isCallIndirect(const std::string& str) {
    if(str.size() <= CALL_INDIRECT_LENGTH) return false;
    for(int i = 0; i < CALL_INDIRECT_LENGTH; ++i) {
        if(str[i] != CALL_INDIRECT[i]) return false;
    }
    return true;
}

/**
 * @description: The struct of tester using log.
 */
struct Tester {
    /**
     * @description: A const string of EOSIO data directory.
     */
    std::string instrumentOutputDirectory = std::string(getenv("HOME")) + "/.local/share/eosio/";
    
    /**
     * @description: A pointer to the logger.
     */
    Logger* pLogger;
    /**
     * @description: A pointer to the pipe.
     */
    Pipe* pPipe;
    /**
     * @description: The operation list by instrument.
     */
    std::vector <std::string> op;
    /**
     * @description: The func list by instrument.
     */
    std::vector <std::string> func;
    /**
     * @description: The log by instrument.
     */
    std::vector <std::pair<uint64_t, std::string>> logfile;
    /**
     * @description: Check the test case if valid or not.
     */
    bool isValid;

    /**
     * @description: Read a file into an array of strings.
     * @param
     *      vec: the array of strings
     *      fileName: the name of the file
     * @return: - (may throw an exception)
     */
    void readFromFile(std::vector<std::string>& vec, const std::string& fileName) {
        std::ifstream ifs(instrumentOutputDirectory + fileName, std::ios::in);
        if(!ifs.good()) throw std::runtime_error("Tester::readFromFile open file failed: " + instrumentOutputDirectory + fileName);
        std::string readBuf;
        bool hasRunButNoEnd = false;
        while(std::getline(ifs, readBuf)) {
            if(readBuf.find("Run!") != std::string::npos) {
                if(!hasRunButNoEnd) hasRunButNoEnd = true;
                else throw std::runtime_error("Tester::readFromFile parallelized to serialized with two \"Run!\"");
            }
            else if(readBuf.find("End!") != std::string::npos) {
                if(hasRunButNoEnd) hasRunButNoEnd = false;
                else throw std::runtime_error("Tester::readFromFile parallelized to serialized with two \"End!\"");
            }
            vec.push_back(readBuf);
        }
    }
    /**
     * @description: A default construtor.
     * @param
     *      -
     * @return: Itself.
     */
    Tester() {}
    /**
     * @description: A useful construtor.
     * @param
     *      pLog: the pointer to logger
     *      pP: the pointer to pipe
     * @return: A Tester object.
     */
    Tester(Logger* pLog, Pipe* pP = nullptr) : pLogger(pLog), pPipe(pP), isValid(true) {
        try {
            readFromFile(op, "op.txt");
            readFromFile(func, "func.txt");
            std::vector <std::string> logfileStrings;
            readFromFile(logfileStrings, "logfile.txt");
            for(std::string logfileEachString : logfileStrings) {
                std::size_t blankPos = logfileEachString.find_first_of(' ');
                logfile.push_back(make_pair(
                    std::stoull(logfileEachString.substr(0, blankPos)),
                    logfileEachString.substr(blankPos + 1)
                ));
            }
            /* DEBUG */
            for(auto p : logfile) {
                std::cout << p.first << ' ' << p.second << std::endl;
            }
        }
        catch (const std::runtime_error& e){
            pLogger->log(e.what());
            isValid = false;
        }
    }

    /**
     * @description: Check the function list including "tapos_block_num()" or not.
     * @param
     *      -
     * @return: True if it includes.
     */
    bool usedTaposBlockNum() {
        for(const std::string& str : func) {
            if(str == "tapos_block_num()") return true;
        }
        return false;
    }
    /**
     * @description: Check the function list including "tapos_block_prefix()" or not.
     * @param
     *      -
     * @return: True if it includes.
     */
    bool usedTaposBlockPrefix() {
        for(const std::string& str : func) {
            if(str == "tapos_block_prefix()") return true;
        }
        return false;
    }

    /*bool hasForgedNotificationBug(eosio::chain::account_name attacker, eosio::chain::account_name attackee) {
        std::string attackerString = std::to_string(attacker.value),
                    attackeeString = std::to_string(attackee.value);
        std::vector <std::string> leadInStrings, requireStrings;

        int line = 0, opSize = op.size(), callIndirectCount = 0;
        bool hasLeadIn = false;

        for(; line < opSize; ++line) {
            if(isCallIndirect(op[line]) && (++callIndirectCount) == 3) {
                hasLeadIn = true;
                break;
            }
        }
        if(!hasLeadIn) return false;

        requireStrings.push_back(generateEqNeString(true, "uint64_t", attackerString, attackeeString));
        requireStrings.push_back(generateEqNeString(true, "uint64_t", attackeeString, attackerString));
        requireStrings.push_back(generateEqNeString(false, "uint64_t", attackerString, attackeeString));
        requireStrings.push_back(generateEqNeString(false, "uint64_t", attackeeString, attackerString));

        for(; line < opSize; ++line) {
            for(const std::string& requireString : requireStrings) {
                if(op[line] == requireString) return false;
            }
        }
        return true;
    }*/

    /**
     * @description: Check a operation list checking _self and to.
     * @param
     *      attacker: the string of attacker's account.
     *      attackee: the string of attackee's aacount.
     * @return: True if it checked.
     */
    int checkForgedNotificationBug(eosio::chain::account_name attacker, eosio::chain::account_name attackee) {
        std::string attackerString = std::to_string(attacker.value),
                    attackeeString = std::to_string(attackee.value);
        std::vector <std::string> requireStrings;
        int line = 0, opSize = op.size(), callIndirectCount = 0;
        bool hasLeadIn = false;
        for(; line < opSize; ++line) {
            if(isCallIndirect(op[line]) && (++callIndirectCount) == 3) {
                hasLeadIn = true;
                break;
            }
        }
        if(!hasLeadIn) return -1;
        requireStrings.push_back(generateEqNeString(true, "uint64_t", attackerString, attackeeString));
        requireStrings.push_back(generateEqNeString(true, "uint64_t", attackeeString, attackerString));
        requireStrings.push_back(generateEqNeString(false, "uint64_t", attackerString, attackeeString));
        requireStrings.push_back(generateEqNeString(false, "uint64_t", attackeeString, attackerString));
        for(; line < opSize; ++line) {
            for(const std::string& requireString : requireStrings) {
                if(op[line] == requireString) return 1;
            }
        }
        return 0;
    }

    /**
     * @description: Check a operation list having 2 "CallIndirect".
     * @param
     *      attacker: the string of attacker's account.
     *      attackee: the string of attackee's aacount.
     * @return: True if it has.
     */
    bool hasFakeTransferBug(eosio::chain::account_name attacker, eosio::chain::account_name attackee) {
        int opSize = op.size(), callIndirectCount = 0;
        for(int line = 0; line < opSize; ++line) {
            if(isCallIndirect(op[line]) && (++callIndirectCount) == 2) return true;
        }
        return false;
    }

    /**
     * @description: Check a operation list having 2 "CallIndirect".
     * @param
     *      -
     * @return: True if it has.
     */
    bool acceptEOSToken() {
        int opSize = op.size(), callIndirectCount = 0;
        for(int line = 0; line < opSize; ++line) {
            if(isCallIndirect(op[line]) && (++callIndirectCount) == 2) return true;
        }
        return false;
    }

    /**
     * @description: Check a log including "eosio.token::transfer()".
     * @param
     *      -
     * @return: True if it includes.
     */
    bool usedEosioTokenTransfer() {
        // deleted [ET:TS] from pipe
        /*if(!pPipe) return false;
        if(pPipe->find("[ET:TS]")) return true;
        else return false;*/
        int sizeOfLogfile = logfile.size();
        for(int i = 0; i < sizeOfLogfile; ++i) {
            if(logfile[i].second == "eosio.token::transfer()") return true;
        }
        return false;
    }

    /**
     * @description: Check a log including tapos functions then "eosio.token::transfer()".
     * @param
     *      -
     * @return: True if it includes.
     */
    bool usedTaposFunctionThenEosioTokenTransfer() {
        int lineOfTaposFunction = -1, sizeOfLogfile = logfile.size();
        for(int i = 0; i < sizeOfLogfile; ++i) {
            if(logfile[i].second == "tapos_block_num()" || logfile[i].second == "tapos_block_prefix()") {
                lineOfTaposFunction = i;
                break;
            }
        }
        if(lineOfTaposFunction < 0) return false;
        for(int i = lineOfTaposFunction + 1; i < sizeOfLogfile; ++i) {
            if(logfile[i].second == "eosio.token::transfer()") return true;
        }
        return false;
    }
};

}   // end of namespace fuzzer
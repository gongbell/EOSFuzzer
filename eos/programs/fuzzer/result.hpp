#pragma once

#include <string>
#include <map>
#include <vector>
#include <iostream>
#include <fstream>

#include "logger.hpp"

namespace fuzzer {

/**
 * Kind list:
 *      0: Block Dependency
 *      1: Forged Transfer Notification
 *      2: Fake EOS Transfer
 */

/**
 * @description: An empty string.
 */
const std::string EMPTY_STRING = "";

/**
 * @description: A struct to record results for specific kind.
 */
struct EachKindResult {
    /**
     * @description: The number of test cases.
     */
    unsigned int testCount;
    /**
     * @description: The number of test cases when cleos returns 0.
     */
    unsigned int successRunCount;
    /**
     * @description: An array to record arguments when positive.
     */
    std::vector <std::string> positiveArguments;
};

/**
 * @description: A struct to record results for certain action, including results of some kinds.
 */
using EachActionResult = std::vector <EachKindResult>;

/**
 * @description: A struct to record the entire result.
 */
struct Results : public std::map <std::string, EachActionResult>{
    /**
     * @description: A pointer to the logger.
     */
    Logger* pLogger;
    /**
     * @description: The number of kinds.
     */
    int kindCount;
    /**
     * @description: Whether the contract acceptd EOS.
     */
    bool acceptEOSToken;
    /**
     * @description: Instructor.
     * @param 
     *      p: the logger's pointer
     *      c: count of kinds
     * @return: A Results object.
     */
    Results(Logger* p, int c) : pLogger(p), kindCount(c) {}
    /**
     * @description: Insert a record.
     * @param
     *      isPositive: whether the record is positive
     *      isSuccessRun: whether the record ran successfully
     *      actionName: the name of action
     *      kind: the kind of test case
     *      argument: the argument when running the test case
     * @return: -
     */
    void add(bool isPositive, bool isSuccessRun, const std::string& actionName, int kind, const std::string& argument = EMPTY_STRING) {
        auto it = find(actionName);
        if(it == end()) it = emplace(std::make_pair(actionName, EachActionResult(kindCount))).first;
        auto& eachKind = it->second[kind];
        ++eachKind.testCount;
        if(isSuccessRun) ++eachKind.successRunCount;
        if(isPositive) eachKind.positiveArguments.push_back(argument);
    }
    /**
     * @description: Generate an article file.
     * @param
     *      fileName: the name of article file
     * @return: Whether the process is successful.
     */
    bool toFileArticle(const std::string& fileName) {
        std::ofstream ofs(fileName, std::ios::out);
        if(!ofs.good()) {
            pLogger->log("Results::toFileArticle open file failed: " + fileName);
            return false;
        }
        for(const auto& eachAction : (*this)) {
            ofs << eachAction.first << std::endl;
            int vecSize = eachAction.second.size();
            for(int i = 0; i < vecSize; ++i) {
                switch(i) {
                    case 0: ofs << "BlockDependency: "; break;
                    case 1: ofs << "ForgedNotification: "; break;
                    case 2: ofs << "FakeEOSTransfer: "; break;
                    default: ofs << "--UNKNOWN-- ";
                }
                const auto& eachKind = eachAction.second[i];
                //if((eachKind.testCount > 1 && eachKind.positiveArguments.size() * 100 / eachKind.testCount >= 2) 
                //    || (eachKind.testCount == 1 && eachKind.positiveArguments.size() == 1)) ofs << "YES";
                if((i != 1 && eachKind.positiveArguments.size())
                    || (i == 1 && eachKind.testCount && eachKind.positiveArguments.size() == 0)) ofs << "YES";
                else ofs << "no";
                ofs << " " << eachKind.positiveArguments.size() << "/" << eachKind.successRunCount << "/" << eachKind.testCount << std::endl;
            }
        }

        ofs << std::endl;

        for(const auto& eachAction : (*this)) {
            ofs << eachAction.first << std::endl << std::endl;
            int vecSize = eachAction.second.size();
            for(int i = 0; i < vecSize; ++i) {
                switch(i) {
                    case 0: ofs << "BlockDependency: "; break;
                    case 1: ofs << "ForgedNotification: "; break;
                    case 2: ofs << "FakeEOSTransfer: "; break;
                    default: ofs << "--UNKNOWN-- ";
                }
                ofs << std::endl;
                const auto& eachKind = eachAction.second[i];
                for(const auto& arg : eachKind.positiveArguments) ofs << arg << std::endl;
                ofs << std::endl;
            }
            ofs << std::endl;
        }
        return true;
    }
};

}   // namespace fuzzer
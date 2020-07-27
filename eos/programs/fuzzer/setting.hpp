#pragma once

#include <iostream>
#include <fstream>
#include <string>
#include <vector>

namespace fuzzer {

/**
 * @description: The path where EOSIO store data.
 */
std::string filePath = std::string(getenv("HOME")) + "/.local/share/eosio/";

/**
 * @description: The path of HOME
 */
std::string homePath = std::string(getenv("HOME")) + "/";

/**
 * @description: A struct to store account detail, including the name of account and its public key.
 */
using AccountDetail = std::pair <std::string, std::string>;

/**
 * @description: A struct to store setting.
 */
struct Setting {
    /**
     * @description: A list of accounts.
     */
    std::vector <AccountDetail> accountList;
    /**
     * @description: Initialze the list of accounts from file.
     * @param
     *      fileName: the filename of the list
     * @return: -
     */
    void initAccountList(const std::string& fileName) {
        accountList.clear();
        std::ifstream ifs(fileName, std::ios::in);
        if(!ifs.good()) {
            return;
        }
        std::string accountName, publicKey;
        /**
         * The file should consists of several lines.
         * Each line contains the name of account and its public key, seperated by a blank.
         */
        while(ifs >> accountName >> publicKey) {
            accountList.push_back(AccountDetail(accountName, publicKey));
        }
        ifs.close();
    }
};

} // namespace fuzzer
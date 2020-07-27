#pragma once

#include <fc/io/json.hpp>
#include <eosio/chain/abi_def.hpp>

#include "data.hpp"
#include "setting.hpp"

namespace fuzzer {

/**
 * @description: A struct to parse types.
 */
struct Type {
    /**
     * @description: Some account names.
     */
    std::string forgedNotificationAgentName = "atkforg",
                forgedNotificationTokenFromName = "atkforgfrom",
                fakeTransferAgentName = "atknoti",
                testEOSTokenFromName = "testeosfrom";

    /**
     * @description: ABI.
     */
    eosio::chain::abi_def abi;

    /**
     * @description: Some strings to parse type.
     */
    std::string testArgument;
    std::string contractName;
    std::string activeAccount;
    std::string realActiveAccount;

    /**
     * @description: A pointer to setting.
     */
    Setting* pSetting = nullptr;

    /**
     * @description: Settings about data range.
     */
    DataRange dataRange = DataRange::random;
    bool autoChangeDataRange = true;
    
    /**
     * @description: Initialize ABI from file.
     * @param
     *      abiFileName: the filename of ABI
     * @return: False if it can't open the file.
     */
    bool readFromFile(const std::string& abiFileName) {
        std::ifstream abiFile(abiFileName);
        if(!abiFile.good()) {
            return false;
        }
        char* abiJsonString = new char[abiFile.rdbuf()->in_avail() + 1];
        abiFile.readsome(abiJsonString, abiFile.rdbuf()->in_avail());
        abi = fc::json::from_string(abiJsonString).template as<eosio::chain::abi_def>();
        delete[] abiJsonString;
        return true;
    }

    /**
     * @description: Return the fields of struct.
     * @param
     *      structName: the name of struct
     * @return: The fields.
     */
    std::vector<eosio::chain::field_def> getStructFields(const std::string& structName) {
        for(const auto& structDetail : abi.structs) {
            if(structDetail.name == structName) {
                return structDetail.fields;
            }
        }
        // if cannot find, return an empty array
        return std::vector<eosio::chain::field_def>();
    }

    /**
     * @description: Return the detail of struct.
     * @param
     *      structName: the name of struct
     * @return: The detail.
     */
    eosio::chain::struct_def getStructDetail(const std::string& structName) {
        // just a typedef
        for(const auto& typeDetail : abi.types) {
            if(typeDetail.new_type_name == structName) {
                return getStructDetail(typeDetail.type);
            }
        }
        for(const auto& structDetail : abi.structs) {
            if(structDetail.name == structName) {
                return structDetail;
            }
        }
        // if nothing found
        eosio::chain::struct_def noStructDetail;
        noStructDetail.name = "~";
        noStructDetail.base = structName;
        return noStructDetail;
    }

    /**
     * @description: Return the original tyoe of struct.
     * @param
     *      typeName: the name of type
     * @return: The original type.
     */
    eosio::chain::type_name getOriginalType(const std::string& typeName) {
        for(const auto& typeDetail : abi.types) {
            if(typeDetail.new_type_name == typeName) {
                return typeDetail.type;
            }
        }
        // if nothing found
        return std::string("");
    }

    /**
     * @description: Return a data string of a simple type.
     * @param
     *      structName: the name of the type
     * @return: The data.
     */
    std::string generateDataForSimpleType(const std::string& structName) {
        // ref: libraries/chain/abi_serializer.cpp: abi_serializer::configure_built_in_types()
        if(autoChangeDataRange) dataRange = (DataRange)randomInt(0, 4);

        #define GET_SIMPLE_TYPE_DATA_STRING_2(abiStructName, codeStructName) if(structName == #abiStructName) return getDataString<codeStructName>(dataRange, (codeStructName*)0)

        #define GET_SIMPLE_TYPE_DATA_STRING(simple) GET_SIMPLE_TYPE_DATA_STRING_2(simple, simple##_t)
        GET_SIMPLE_TYPE_DATA_STRING(int8);
        GET_SIMPLE_TYPE_DATA_STRING(uint8);
        GET_SIMPLE_TYPE_DATA_STRING(int16);
        GET_SIMPLE_TYPE_DATA_STRING(uint16);
        GET_SIMPLE_TYPE_DATA_STRING(int32);
        GET_SIMPLE_TYPE_DATA_STRING(uint32);
        GET_SIMPLE_TYPE_DATA_STRING(int64);
        GET_SIMPLE_TYPE_DATA_STRING(uint64);
        #undef GET_SIMPLE_TYPE_DATA_STRING

        GET_SIMPLE_TYPE_DATA_STRING_2(int128, __int128_t);
        GET_SIMPLE_TYPE_DATA_STRING_2(uint128, __uint128_t);
        GET_SIMPLE_TYPE_DATA_STRING_2(varint32, int32_t);
        GET_SIMPLE_TYPE_DATA_STRING_2(varuint32, uint32_t);
        GET_SIMPLE_TYPE_DATA_STRING_2(float32, float);
        GET_SIMPLE_TYPE_DATA_STRING_2(float64, double);
        GET_SIMPLE_TYPE_DATA_STRING_2(float128, __uint128_t);
        GET_SIMPLE_TYPE_DATA_STRING_2(bool, bool);
        GET_SIMPLE_TYPE_DATA_STRING_2(string, std::string);
        //GET_SIMPLE_TYPE_DATA_STRING_2(time, int32_t);
        #undef GET_SIMPLE_TYPE_DATA_STRING_2

        if(structName == "asset") {
            int assetValue = randomInt(1, 10000000);
            char secondString[5];
            sprintf(secondString, "%04d", assetValue % 10000);
            return "\"" + std::to_string(assetValue / 10000) + "." + secondString + " EOS\"";
        }
        if(structName == "symbol") return "\"4,EOS\"";
        if(structName == "name") {
            std::string nameReturnValue;
            if(dataRange == random || !pSetting || pSetting->accountList.size() == 0) nameReturnValue = activeAccount; 
            else {
                int accountPosition = randomInt(0UL, pSetting->accountList.size() - 1);
                nameReturnValue =  pSetting->accountList[accountPosition].first;
            }
            if(randomInt(0, 1)) realActiveAccount = nameReturnValue;
            return nameReturnValue;
        }
        if(structName == "public_key") {
            if(dataRange == random || !pSetting || pSetting->accountList.size() == 0) return "EOS7jxeJjHurnzUnkhCQVk9Sr9SiuJAQC5xTZGxCbrk6u9ywsV4Bv"; 
            else {
                int accountPosition = randomInt(0UL, pSetting->accountList.size() - 1);
                return pSetting->accountList[accountPosition].second;
            }
        }

        return "{}";
    }

    /**
     * @description: Return a data string of a struct.
     * @param
     *      structName: the name of the struct
     *      isBase: whether the struct is a base class
     * @return: The data.
     */
    void generateData(const eosio::chain::struct_def structDetail, bool isBase = false) {
        if(structDetail.name == "~") {
            testArgument.append(generateDataForSimpleType(structDetail.base));
            return;
        }
        if(!isBase) testArgument.append("{");
        if(structDetail.base != "") {
            generateData(getStructDetail(structDetail.base), true);
            testArgument.append(", ");
        }
        int fieldsSize = structDetail.fields.size();
        for(int i = 0; i < fieldsSize; ++i) {
            const eosio::chain::field_def& fieldDetail = structDetail.fields[i];
            testArgument.append("\"" + fieldDetail.name + "\": ");
            if(fieldDetail.type.back() == ']') {
                int arrayLength = randomInt(0, 10);
                testArgument.append("[");
                eosio::chain::type_name elementTypename = fieldDetail.type.substr(0, fieldDetail.type.length() - 2);
                eosio::chain::struct_def elementStructDetail = getStructDetail(elementTypename);
                for(int j = 0; j < arrayLength; ++j) {
                    generateData(elementStructDetail);
                    if(j < arrayLength - 1) testArgument.append(", ");
                }
                testArgument.append("]");
            }
            else generateData(getStructDetail(fieldDetail.type));
            if(i < fieldsSize - 1) testArgument.append(", ");
        }
        if(!isBase) testArgument.append("}");
    }

    /**
     * @description: Return a data string for an action.
     * @param
     *      functionName: the name of the action
     *      kind: the kind of test
     * @return: The data.
     */
    std::string generateNewData(const std::string& functionName, int kind = 0) {
        testArgument.clear();
        realActiveAccount.clear();
        if(contractName == "eosio.token") {
            if(kind == 3) {
                testArgument = "[\"" + testEOSTokenFromName + "\", \"" + activeAccount + "\", " + generateDataForSimpleType("asset") + ", " + generateDataForSimpleType("string") + "]";
            }
            else {
                testArgument = "[\"" + forgedNotificationTokenFromName + "\", \"" + forgedNotificationAgentName + "\", " + generateDataForSimpleType("asset") + ", " + generateDataForSimpleType("string") +  "]"; 
            }
        }
        else if(contractName == fakeTransferAgentName) {
            testArgument = "[\"" + (randomInt(0, 1) ? fakeTransferAgentName : activeAccount)  + "\", \"" + activeAccount + "\", " + generateDataForSimpleType("asset") + ", " + generateDataForSimpleType("string") + "]";
        }
        else {
            generateData(getStructDetail(getActionType(functionName)));
        }
        return testArgument;
    }

    /**
     * @description: Return a random action's name.
     * @param
     *      -
     * @return: An action's name.
     */
    std::string getRandomActionName() {
        auto& actions = abi.actions;
        if(!actions.size()) return "";
        else return actions[randomInt(0UL, actions.size() - 1)].name.to_string();
    }

    /**
     * @description: Return an action's type.
     * @param
     *      actionName: the name of action
     * @return: The type.
     */
    eosio::chain::type_name getActionType(const std::string& actionName) {
        auto& actions = abi.actions;
        for(const auto& action : actions) {
            if(action.name == actionName) return action.type;
        }
        return "";
    }
};

} // namespace fuzzer
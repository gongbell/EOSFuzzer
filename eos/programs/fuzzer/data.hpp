#pragma once

#include <iostream>
#include <string>
#include <sstream>
#include <random>
#include <limits>

namespace fuzzer {

/**
 * @description: Standard random engine.
 */
static std::default_random_engine randomEngine;

/**
 * @description: Jan 1, 1970
 */
static std::chrono::system_clock::time_point p0 = std::chrono::time_point<std::chrono::system_clock>{};

/**
 * @description: Initialize the random engine with a certain seed. 
 * @param
 *      seed: the seed used for engine
 * @return: -
 */
template <typename Sseq> void initRandomEngine(Sseq& seed) {
    randomEngine.seed(seed);
}

/**
 * @description: Generate a random integer.
 * @param
 *      l: the smallest integer possible
 *      r: the largest integer possible
 * @return: An integer in [l, r].
 */
template <typename T> inline T randomInt(T l, T r) {
    return std::uniform_int_distribution<T>(l, r)(randomEngine);
}

/**
 * @description: Generate a random integer for certain type.
 * @param
 *      type: ONLY USED FOR TEMPLATE, NOT USED IN FUNCTION
 * @return: An integer.
 */
template <typename T, typename std::enable_if<std::is_integral<T>::value, int>::type n = 0> T getRandom(T* type = nullptr) {
    return std::uniform_int_distribution<T>(
        std::numeric_limits<T>::min(),
        std::numeric_limits<T>::max()
    )(randomEngine);
}

/**
 * @description: Generate a random real number for certain type.
 * @param
 *      type: ONLY USED FOR TEMPLATE, NOT USED IN FUNCTION
 * @return: A real number.
 */
template <typename T, typename std::enable_if<std::is_floating_point<T>::value, int>::type n = 0> T getRandom(T* type = nullptr) {
    return (randomInt(0, 1) == 1 ? 1.0 : -1.0) * std::uniform_real_distribution<T>(
        std::numeric_limits<T>::min(),
        std::numeric_limits<T>::max()
    )(randomEngine);
}

/**
 * @description: An enumeration about the data to be generated.
 * @param
 *      random: just random
 *      min, lowest, max, epsilon: referring std::numeric_limits
 */
enum DataRange {
    random,
    min,
    lowest,
    max,
    epsilon
};

/**
 * @description: Generate a data string for certain range and type.
 * @param
 *      dataRange: an enumeration of range
 *      type: ONLY USED FOR TEMPLATE, NOT USED IN FUNCTION
 * @return: A data string.
 */
template <typename T> std::string getDataString(DataRange dataRange, T* type = nullptr) {
    switch (dataRange) {
        case min:       return std::to_string(std::numeric_limits<T>::min());
        case lowest:    return std::to_string(std::numeric_limits<T>::lowest());
        case max:       return std::to_string(std::numeric_limits<T>::max());
        case epsilon:   return std::to_string(std::numeric_limits<T>::epsilon());
        default:        return std::to_string(getRandom<T>(type));
    }
}

/**
 * @description: A pointer to the string pool. Should NOT be directly used.
 */
static std::vector <std::string> * stringPoolPtr = nullptr;

/**
 * @description: Set the pointer to the string pool.
 * @param
 *      p: the pointer
 * @return: -
 */
void setStringPoolPtr(std::vector <std::string> * p) {
    stringPoolPtr = p;
}

/**
 * @description: Generate a std::string type data string for certain range.
 * @param
 *      dataRange: use string pool or not
 *      type: ONLY USED FOR TEMPLATE, NOT USED IN FUNCTION
 * @return: A std::string type data string.
 */
template <typename T> std::string getDataString(DataRange dataRange, std::string* type = nullptr) {
    std::string dataString = "\"";
    // just generate a string
    if(dataRange == random || stringPoolPtr == nullptr || stringPoolPtr->empty()) {
        int len = randomInt(0, 100);
        while(len--) {
            char newChar = randomInt(40, 126);
            if(newChar == '\\') dataString += "\\\\";
            else dataString += newChar;
        }
    }
    // get a string in the string pool
    else {
        dataString += (*stringPoolPtr)[randomInt(0UL, stringPoolPtr->size() - 1)];
    }
    dataString += "\"";
    return dataString;
}

/**
 * @description: Generate a 128-bit integer data string for certain range. NOT implemented yet.
 * @param
 *      dataRange: -
 *      type: -
 * @return: -
 */
template <typename T> std::string getDataString(DataRange dataRange, __int128_t* type = nullptr) {
    return "-128";
}

/**
 * @description: Generate a unsigned 128-bit integer data string for certain range. NOT implemented yet.
 * @param
 *      dataRange: -
 *      type: -
 * @return: -
 */
template <typename T> std::string getDataString(DataRange dataRange, __uint128_t* type = nullptr) {
    return "128";
}

/**
 * @description: Generate "0" or "1".
 * @param
 *      dataRange: decided for zero or one
 *      type: ONLY USED FOR TEMPLATE, NOT USED IN FUNCTION
 * @return: "0" or "1".
 */
template <typename T> std::string getDataString(DataRange dataRange, bool* type = nullptr) {
    switch(dataRange) {
        case random: return randomInt(0, 1) ? "1" : "0";
        case min: return "0";
        case lowest: return "0";
        case max: return "1";
        case epsilon: return "1";
        default: return "0";
    }
}

} // namespace fuzzer
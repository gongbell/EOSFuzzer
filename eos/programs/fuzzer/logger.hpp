#pragma once

#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <vector>

namespace fuzzer {

struct Logger {
    /**
     * @description: An array of logger's output stream
     */
    std::vector<std::ostream*> ostreamPointers;

    /**
     * @description: Log the message in a line.
     * @param
     *      message: the message to be logged
     * @return: -
     */
    void log(const std::string& message);

    /**
     * @description: Add an output stream.
     * @param
     *      anOstream: the stream added
     * @return: -
     */
    void addOstream(std::ostream* anOstream);

    /**
     * @description: Add a log file to the array of output stream.
     * @param
     *      logFileName: the file name of log
     * @return: Successful or not.
     */
    bool addLogFile(const std::string& logFileName);

    /**
     * @description: Log the message.
     * @param
     *      message: the message to be logged
     * @return: The logger itself.
     */
    Logger& operator << (const std::string& message);
};

void Logger::log(const std::string& message) {
    for (auto pOstream : ostreamPointers) {
        *pOstream << message << std::endl;
    }
}

void Logger::addOstream(std::ostream* pOstream) {
    if (!pOstream) {
        log("Null Pointer by Logger::addOstream(std::ostream*)");
        return;
    }
    ostreamPointers.push_back(pOstream);
}

bool Logger::addLogFile(const std::string& logFileName) {
    std::ofstream* f = new std::ofstream(logFileName);
    if (!f->good()) {
        log("addLogFile(" + logFileName + ") Failed");
        return false;
    }
    addOstream(f);
    return true;
}

Logger& Logger::operator << (const std::string& message) {
    for (auto pOstream : ostreamPointers) {
        *pOstream << message;
    }
    return *this;
}

} // namespace fuzzer
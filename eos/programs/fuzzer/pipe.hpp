#pragma once

#include <unistd.h>
#include <string>
#include <vector>

namespace fuzzer {

/**
 * @description: A buffer for pipe.
 */
char pipeBuffer[3000];

/**
 * @description: A specific class for pipe.
 */
struct Pipe {
    /**
     * @description: Program.
     */
    std::string exe;
    /**
     * @description: Arguments.
     */
    std::string args;
    /**
     * @description: stdout.
     */
    std::vector <std::string> output;
    /**
     * @description: An integer logging the return value
     */
    int exitStatus;
    /**
     * @description: Run the program using pipe.
     * @param -
     * @return: The file pointer is valid or not.
     */
    bool execute() {
        std::string cmd = exe + ' ' + args;
        FILE* fp = popen(cmd.c_str(), "r");
        if(fp == NULL) {
            return false;
        }
        output.clear();
        while(fgets(pipeBuffer, 3000 - 1, fp) != NULL) {
            output.push_back(std::string(pipeBuffer));
        }
        exitStatus = WEXITSTATUS(pclose(fp));
        return true;
    }
    /**
     * @description: Find a pattern in output.
     * @param
     *      str: the pattern
     * @return: Found or not.
     */
    bool find(const std::string& str) {
        for(const auto& outLine : output) {
            if(outLine.find(str) != std::string::npos) {
                return true;
            }
        }
        return false;
    }
};

} // namespace fuzzer
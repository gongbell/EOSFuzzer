#pragma once

#include <vector>
#include <set>
#include <string>

namespace fuzzer {

/**
 * @description: A struct to parse WASM text format.
 */
struct WastParser {
    /**
     * @description: The WASM text.
     */
    std::vector<std::string> wast;

    /**
     * @description: The constructor.
     * @param
     *      input: the WASM text
     * @return: The object itself.
     */
    WastParser(const std::vector <std::string> & input) : wast(input) {
        for(std::string& p : wast) {
            p = p.substr(0, p.length() - 1);
        }
    }

    /**
     * @description: Find a line number contains a string from the last line.
     * @param
     *      substr: the string to be found
     * @return: -1 if not found, or the line number.
     */
    int findLineNumberBackward(std::string substr) {
        int n = wast.size();
        for(int i = n - 1; i >= 0; --i) {
            if(wast[i].find(substr) != std::string::npos) {
                return i;
            }
        }
        return -1;
    }

    /**
     * @description: Find the first line with specific count of space indent.
     * @param
     *      i: the starting line
     *      space: the count of space indent
     * @return: -1 if not found, or the line number.
     */
    int findFirstIndent(int i, int space) {
        int n = wast.size();
        for(; i < n; ++i) {
            if(wast[i].length() <= space) {
                continue;
            }
            bool allSpace = true;
            for(int j = 0; j < space; ++j) {
                if(wast[i][j] != ' ') {
                    allSpace = false;
                    break;
                }
            }
            if(allSpace && wast[i][space] != ' ') {
                return i;
            }
        }
        return -1;
    }

    /**
     * @description: Get a string from a certain line.
     * @param
     *      i: the line number
     * @return: Empty string if not found, or the string in the line.
     */
    std::string getOnlyString(int i) {
        int p1 = wast[i].find_first_of('"');
        if(p1 == std::string::npos) {
            return "";
        }
        int p2 = wast[i].find_last_of('"');
        if(p1 == p2) {
            return "";
        }
        return wast[i].substr(p1 + 1, p2 - p1 - 1);
    }

    /**
     * @description: Generate a string pool with data used in functions with certain param list.
     * @param
     *      param: the param string
     * @return: The pool.
     */
    std::vector <std::string> getStringsInFunctionWithCertainParam(std::string param) {
        if(wast.size() == 0) {
            return std::vector <std::string> ();
        }
        std::set <std::string> stringNumbers;
        int line = findFirstIndent(0, 2);
        do {
            if(wast[line].find("func (;") != std::string::npos
                && wast[line].find(param) != std::string::npos
            ) {
                int endOfFunc = findFirstIndent(line + 1, 2);
                for(int i = line + 1; i < endOfFunc; ++i) {
                    if(wast[i].find("i32.const") != std::string::npos) {
                        int j = wast[i].length() - 1;
                        while(isdigit(wast[i][j])) {
                            --j;
                        }
                        stringNumbers.insert(wast[i].substr(j + 1));
                    }
                }
            }
            line = findFirstIndent(line + 1, 2);
        } while(line != -1);
        std::set <std::string> strings;
        for(std::set<std::string>::iterator it = stringNumbers.begin(); it != stringNumbers.end(); ++it) {
            int lineNumber = findLineNumberBackward(*it);
            if(wast[lineNumber].find("data (i32.const") == std::string::npos) {
                continue;
            }
            strings.insert(getOnlyString(lineNumber));
        }
        std::vector <std::string> res;
        for(const std::string & str : strings) {
            res.push_back(str.substr(0, str.length() - 3));
        }
        return res;
    }

    /**
     * @description: Generate a string pool of all strings in WASM.
     * @param
     *      -
     * @return: The pool.
     */
    std::vector <std::string> getAllStrings() {
        int line = wast.size() - 1;
        while(true) {
            if(line < 0) return std::vector <std::string>();
            if(wast[line].find("data (i32.const") != std::string::npos) {
                break;
            }
            --line;
        }
        std::vector <std::string> res;
        while(line >= 0 && wast[line].find("data (i32.const") != std::string::npos) {
            std::string dataWithQuotes = getOnlyString(line);
            std::string data;
            for(const char charInData : dataWithQuotes) {
                if(charInData == '\'' || charInData == '"' || charInData == '\\') data += "\\";
                data += charInData;
            }
            std::size_t pos;
            while((pos = data.find("\\\\00")) != std::string::npos) {
                res.push_back(data.substr(0, pos));
                data = data.substr(pos + 4);
            }
            if(data.length()) res.push_back(data);
            --line;
        }
        return res;
    }
};


}   // namespace fuzzer
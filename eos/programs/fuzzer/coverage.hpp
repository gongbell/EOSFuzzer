#pragma once

#include <iostream>
#include <fstream>
#include <set>

/*
    length of fixed wasm file istream
    23668   atkforg
    91968   eos(main), eosio.token
    35012   atknoti
*/

namespace fuzzer {
/**
 * @description: Runtime coverage parser. NOT used.
 */
struct Coverage {
    std::set<uint64_t> ignoreWasmIstreamLength;
    std::set<uint64_t> pcSet;
    Coverage() {
        ignoreWasmIstreamLength.insert(23668);
        ignoreWasmIstreamLength.insert(35012);
        ignoreWasmIstreamLength.insert(91968);
    }
    std::size_t updatePcSet(std::ifstream& ifs) {
        uint64_t buf/*, lastBuf = std::numeric_limits<uint64_t>::max()*/;
        while(!ifs.eof()) {
            ifs.read(static_cast<char*>(static_cast<void*>(&buf)), sizeof(buf));
            pcSet.insert(buf);
            //if(buf == lastBuf) break;
            //else lastBuf = buf;
        }
        return pcSet.size();
    }
    bool isIgnored(uint64_t len) {
        //if(ignoreWasmIstreamLength.find(len) == ignoreWasmIstreamLength.end()) return false;
        //else return true;
        return !(ignoreWasmIstreamLength.find(len) == ignoreWasmIstreamLength.end());
    }
};

} // namespace fuzzer
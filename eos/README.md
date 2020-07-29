# eos

```
eos The patch with EOSFuzzer for a specific version of eos
|- contracts
   |- eosio.token The instrumented contract of EOS token
   |- eosiolib Including a function to log in contracts
|- libraries
   |- chain Including some instrumented functions
   |- wabt Including the instrumented WebAssembly interpreter
|- programs/fuzzer The files of EOSFuzzer itself
   |- base58.hpp IGNORED
   |- coverage.hpp IGNORED
   |- data.hpp Generating data for specific types
   |- logger.hpp A logger for EOSFuzzer
   |- main.cpp The entrance of EOSFuzzer
   |- pipe.hpp Running programs by pipes
   |- result.hpp Recording test results
   |- setting.hpp Settings for EOSFuzzer
   |- tester.hpp Some functions to judge positive or negative
   |- type.hpp An ABI analyzer
   |- wastparser.hpp A parser for WebAssembly text format
```
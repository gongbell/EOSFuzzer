# EOSFuzzer
A fuzzer for vulnerability detection of EOSIO smart contracts.

## Quick Start

Import docker (named `eosfuzzer.docker.tar`) then run its terminal:
```
docker import eosfuzzer.docker.tar eosfuzzer
docker run -it eosfuzzer /bin/bash
```

To prepare a dataset, put the contracts in `~/EOSFuzzer/dataset/contracts`. Let's assume the contract is called `mycontract`, then it's like:
```
~/EOSFuzzer/dataset/contracts
|-mycontract
  |-mycontract.wasm
  |-mycontract.abi
```

If you want to use the default dataset with source code:
```
cd ~/EOSFuzzer/dataset
mv source contracts
```

Run EOSFuzzer:
```
cd ~/EOSFuzzer/dataset
rm -rf articles/*
rm *.txt
python3 fuzz.py
```

The file of results is:
```
~/EOSFuzzer/dataset/analyze.txt
```

Settings of EOSFuzzer:
```
~/EOSFuzzer/dataset/setting.py
```

## Folders

### dataset

This folder includes agent contracts, sample contracts and a fuzzing script.

### eos

This folder is a patch with EOSFuzzer for a specific version of eos.
https://github.com/EOSIO/eos/tree/ced8d7db063371aabe8deadb4120767a1d2406a0

### eosio.cdt

This folder is a patch for a specific version of eosio.cdt.
https://github.com/EOSIO/eosio.cdt/commit/6ee842b07a6860b912344806d05a4d7f3bd8e27c
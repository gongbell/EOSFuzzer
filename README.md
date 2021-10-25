# EOSFuzzer
A fuzzer for vulnerability detection of EOSIO smart contracts.

For technical details, please also check our paper at arxiv: 

https://arxiv.org/abs/2007.14903 

EOSFuzzer: Fuzzing EOSIO Smart Contracts for Vulnerability Detection

by Yuhe Huang, Bo Jiang, W.K. Chan

Contact Dr. Bo Jiang (gongbell@gmail.com) if you have any questions.

## Quick Start

Docker: https://bhpan.buaa.edu.cn:443/link/46B7AD48F87E481511F788415A9AC9A0



Import docker (if named `eosfuzzer.docker.tar`) then run its terminal:
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

Run EOSFuzzer with dataset:
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

If you need to re-generate the file above, edit `~/EOSFuzzer/dataset/fuzz.py` to call the `analyze` function.

Settings to run EOSFuzzer:
```
~/EOSFuzzer/dataset/setting.py
```

If you need to change settings, the comments in the file could help you.

To compile, make sure the version of `libssl-dev` is `1.1.0g-2ubuntu4`, then execute:
```
cd ~/EOSFuzzer/eos
./eosio_build.sh -o Debug
```

## Folders

### agents

This folder includes agent contracts.

### dataset

This folder includes agent sample contracts and a fuzzing script.

### eos

This folder is a patch with EOSFuzzer for a specific version of eos.

https://github.com/EOSIO/eos/tree/ced8d7db063371aabe8deadb4120767a1d2406a0

### eosio.cdt

This folder is a patch for a specific version of eosio.cdt. This patch adds a function to log in a file.

https://github.com/EOSIO/eosio.cdt/commit/6ee842b07a6860b912344806d05a4d7f3bd8e27c

## Where is EOSFuzzer?

In `~/eos`, should be merged with original files of eos. Those files are listed here:

https://github.com/gongbell/EOSFuzzer/tree/master/eos

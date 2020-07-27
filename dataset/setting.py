import os

eosFilePath = os.getenv('HOME') + '/.local/share/eosio/'

eosProgramsDirectory = os.getenv('HOME') + '/eos/build/programs/'
cleosExecutable = eosProgramsDirectory + 'cleos/cleos'
fuzzerExecutable = eosProgramsDirectory + 'fuzzer/fuzzer'
nodeosExecutable = eosProgramsDirectory + 'nodeos/nodeos'

eosioTokenContract = os.getenv('HOME') + '/eos/build/contracts/eosio.token'
atkforgContract = './agents/atkforg'
atknotiContract = './agents/atknoti'
atkreroContract = './agents/atkrero'

atkforgContractSource = './agents/atkforg/atkforg.cpp'
atkforgContractBinary = './agents/atkforg/atkforg.wasm'

eosioTokenPublicKey = 'EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV'
aPublicKey = 'EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV'
aPasswordToKeosd = 'PW5JqSTQ1WDcm3mUWJ9omDuTtg6M7eNG3ffuYPgGfobAaGr3m6E8e'

timeoutSeconds = 300
fuzzCount = 500
roundCount = 1
useAccountPool = False


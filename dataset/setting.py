import os

# The location of the blockchain
eosFilePath = os.getenv('HOME') + '/.local/share/eosio/'

# The locations of programs in EOS projects
eosProgramsDirectory = os.getenv('HOME') + '/eos/build/programs/'
cleosExecutable = eosProgramsDirectory + 'cleos/cleos'
fuzzerExecutable = eosProgramsDirectory + 'fuzzer/fuzzer'
nodeosExecutable = eosProgramsDirectory + 'nodeos/nodeos'

# The locations of the token contracts and agent contracts
eosioTokenContract = os.getenv('HOME') + '/eos/build/contracts/eosio.token'
atkforgContract = '../agents/atkforg'
atknotiContract = '../agents/atknoti'
atkreroContract = '../agents/atkrero'

# The specific files of agent for forged transfer notification, to support re-compiling
atkforgContractSource = '../agents/atkforg/atkforg.cpp'
atkforgContractBinary = '../agents/atkforg/atkforg.wasm'

# The default private key for all accounts: 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3

# The public key for eosio.token
eosioTokenPublicKey = 'EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV'
# The public key for other accounts
aPublicKey = 'EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV'
# The password to unlock wallet
# TODO: CHANGE THIS AFTER CONFIGURATIONS OF keosd
aPasswordToKeosd = 'PW5JqSTQ1WDcm3mUWJ9omDuTtg6M7eNG3ffuYPgGfobAaGr3m6E8e'

# The time limit for specific functions in the script
timeoutSeconds = 300
# The number of function calls in one execution of EOSFuzzer
fuzzCount = 500
# EXPERIMENTAL: The number of EOSFuzzer executions
roundCount = 1
# EXPERIMENTAL: True to enable an account pool to support EOSFuzzer
useAccountPool = False


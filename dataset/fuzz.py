import os
import subprocess
import time
import timeout_decorator

from setting import *

def executeCommand(arguments, mustExecute = False):
    if mustExecute:
        while True:
            #returnValue = os.system(arguments)
            returnValue = subprocess.call(arguments)
            #print('returnValue = ', returnValue)
            if returnValue == 0:
                return
    else:
        #os.system(arguments)
        subprocess.call(arguments)

def createAccount(name, publicKey, mustExecute = False):
    #executeCommand(cleosExecutable + ' create account eosio ' + name + ' ' + publicKey, mustExecute)
    executeCommand([cleosExecutable, 'create', 'account', 'eosio', name, publicKey], mustExecute)

def setContract(name, contractAddress, mustExecute = False):
    #executeCommand(cleosExecutable + ' set contract ' + name + ' ' + contractAddress, mustExecute)
    executeCommand([cleosExecutable, 'set', 'contract', name, contractAddress], mustExecute)

def pushAction(contract, action, arguments, permission, mustExecute = False):
    #executeCommand(cleosExecutable + ' push action ' + contract + ' ' + action + ' \'' + arguments + '\' -p ' + permission + '@active', mustExecute)
    executeCommand([cleosExecutable, 'push', 'action', contract, action, arguments, '-p', permission], mustExecute)

def addCodePermission(name, mustExecute = False):
    #executeCommand(cleosExecutable + ' set account permission ' + name + ' active --add-code', mustExecute)
    executeCommand([cleosExecutable, 'set', 'account', 'permission', name, 'active', '--add-code'], mustExecute)

@timeout_decorator.timeout(60, timeout_exception=StopIteration)
def init(contractName = ""):
    os.system('killall nodeos')
    #subprocess.call(['killcall', 'nodeos'])
    os.system('rm -rf ' + os.getenv('HOME') + '/.local/share/eosio/')
    #subprocess.call(['rm', '-rf', '/home/huangyuhe/.local/share/eosio/'])
    os.system('rm ./nodeos.log')
    #subprocess.call(['rm', './nodeos.log'])

    os.system('echo ' + aPasswordToKeosd + ' | ' + cleosExecutable + ' wallet unlock')
    #subprocess.call(['echo', aPasswordToKeosd, '|', cleosExecutable, 'wallet', 'unlock'])

    os.system(nodeosExecutable + ' -e -p eosio --plugin eosio::producer_plugin --plugin eosio::chain_api_plugin --plugin eosio::http_plugin --plugin eosio::history_plugin --plugin eosio::history_api_plugin --access-control-allow-origin=\'*\' --contracts-console --http-validate-host=false --verbose-http-errors --max-transaction-time=1000 >> nodeos.log 2>&1 &')

    os.system('eosio-cpp -o ' + atkforgContractBinary + ' ' + atkforgContractSource + ' -DCONTRACT_NAME=\\"' + contractName + '\\"')

    createAccount('eosio.token', eosioTokenPublicKey, True)
    setContract('eosio.token', eosioTokenContract, True)
    pushAction('eosio.token', 'create', '["eosio","1000000000.0000 EOS"]', 'eosio.token', True)

    createAccount('testeosfrom', aPublicKey, True)
    pushAction('eosio.token', 'issue', '["testeosfrom","10000000.0000 EOS","FUZZER"]', 'eosio', True)

    createAccount('atkforgfrom', aPublicKey, True)
    pushAction('eosio.token', 'issue', '["atkforgfrom","10000000.0000 EOS","FUZZER"]', 'eosio', True)

    createAccount('atkforg', aPublicKey, True)
    setContract('atkforg', atkforgContract, True)
    addCodePermission('atkforg', True)

    createAccount('atknoti', aPublicKey, True)
    setContract('atknoti', atknotiContract, True)
    addCodePermission('atknoti', True)

    createAccount('atkrero', aPublicKey, True)
    setContract('atkrero', atkreroContract, True)
    addCodePermission('atkrero', True)

    if useAccountPool:
        createAccount('fuzzacc1', aPublicKey, True)
        createAccount('fuzzacc2', aPublicKey, True)
        createAccount('fuzzacc3', aPublicKey, True)
        os.system('cp ./accounts.conf ' + os.getenv('HOME') + '/.local/share/eosio/')

@timeout_decorator.timeout(timeoutSeconds, timeout_exception=StopIteration)
def fuzz(contractName, actionName = ':ALL', useAnotherAccountName = False, accountName = '', count = 10):
    # os.system(cleosExecutable + ' create account eosio ' + contractName + ' EOS7jxeJjHurnzUnkhCQVk9Sr9SiuJAQC5xTZGxCbrk6u9ywsV4Bv')
    # os.system(cleosExecutable + ' set contract ' + contractName + ' ./contracts/' + contractName)
    # os.system(cleosExecutable + ' set account permission ' + contractName + ' active --add-code')
    if not useAnotherAccountName:
        accountName = contractName
    createAccount(contractName, aPublicKey)
    pushAction('eosio.token', 'issue', '["' + contractName + '","10000000.0000 EOS","FUZZER"]', 'eosio', True)
    setContract(contractName, './contracts/' + contractName)
    addCodePermission(contractName)
    #os.system(fuzzerExecutable + ' ./contracts/' + contractName + '/' + contractName + '.abi ' + contractName + ' :ALL ' + contractName + ' 10')
    if count > 0:
        subprocess.call([fuzzerExecutable, './contracts/' + contractName + '/' + contractName + '.abi', contractName, actionName, accountName, str(count)])

def fuzzAll():
    contracts = os.listdir('./contracts/')
    #contracts = open('analyzedif.txt').readlines()
    #for i in range(len(contracts)):
    #    contracts[i] = contracts[i][:-1]
    contractsList = []
    try:
        os.mkdir('./articles/')
    except:
        print('articles folder already exists')
    for contract in contracts:
        contractFiles = os.listdir('./contracts/' + contract)
        hasAbi = False
        hasCode = False
        for contractFile in contractFiles:
            if contractFile == contract + '.abi':
                hasAbi = True
            if contractFile == contract + '.wasm':
                hasCode = True
        if hasAbi and hasCode:
            contractsList.append(contract)
            try:
                os.mkdir('./articles/' + contract)
            except:
                print(contract, '\'s folder already exists')

    timeRecordFile = open('timeRecord.txt', 'w')
    for testCount in range(roundCount):
        for contract in contractsList:
            timeRecordFile.write(str(testCount) + '\t' + contract + '\t' + str(os.path.getsize('./contracts/' + contract + '/' + contract + '.wasm')) + '\t')
            timeRecordString = 'FAILED'
            for failedCount in range(0, 3):
                try:
                    init(contract)
                    beforeFuzzTime = time.time()
                    fuzz(contract, count = fuzzCount)
                    afterFuzzTime = time.time()
                    timeRecordString = str(afterFuzzTime - beforeFuzzTime)
                except StopIteration:
                    print('re-init')
                    #init()
                else:
                    break
            timeRecordFile.write(timeRecordString + '\n')
            os.system('cp ' + eosFilePath + 'article.txt ./articles/' + contract + '/' + str(testCount) + '.article.txt')
            os.system('cp ' + eosFilePath + 'fuzzer.log ./articles/' + contract + '/' + str(testCount) + '.fuzzer.log')
    timeRecordFile.close()

def analyze():
    testResult = [[], [], [], []]
    testCount = roundCount

    loopTimeFile = open('looptime.txt', 'w')
    coverageFile = open('coverage.txt', 'w')

    contractNames = os.listdir('./articles')
    for contractName in contractNames:

        loopTimeFile.write(contractName)
        coverageFile.write(contractName)

        # print(contractName)
        hasAlreadyRecorded = [False, False, False]
        failCount = 0
        for articleCount in range(testCount):
            try:
                articleFile = open('./articles/' + contractName + '/' + str(articleCount) + '.article.txt', 'r')
                article = articleFile.readlines()
                articleFile.close()
                line = 0
                while(line < len(article) and (line == 0 or article[line] != "\n")):
                    for i in range(3):
                        if(article[line + i + 1].find("YES") != -1 and not hasAlreadyRecorded[i]):
                            logFile = open('./articles/' + contractName + '/' + str(articleCount) + '.fuzzer.log', 'r')
                            log = logFile.readlines()
                            logFile.close()
                            attackSucceeded = False
                            for logLine in log:
                                if logLine.find("SUCCEEDED") != -1:
                                    attackSucceeded = True
                                    break
                            if attackSucceeded:
                                testResult[i].append(contractName + "(ATTACK SUCCEEDED)")
                            else:
                                testResult[i].append(contractName)
                            hasAlreadyRecorded[i] = True
                    line += 4
                logFile = open('./articles/' + contractName + '/' + str(articleCount) + '.fuzzer.log', 'r', errors = 'replace')
                log = logFile.readlines()
                logFile.close()
                coverageString = ''
                for logLine in log:
                    if logLine.find('Loop time: ') != -1:
                        loopTimeFile.write('\t' + logLine[11:-1])
                    if logLine.find('Coverage: ') != -1:
                        coverageString = logLine[10:-1]
                coverageFile.write('\t' + coverageString + '\t')
                try:
                    wastFile = open('./contracts/' + contractName + '/' + contractName + '.wast', 'r')
                    wast = wastFile.readlines()
                    wastFile.close()
                    instructionCount = 0
                    for wastLine in wast:
                        if wastLine.find('    ') == 0 and wastLine[4] != '(':
                            instructionCount = instructionCount + 1
                    coverageFile.write(str(instructionCount))
                except:
                    coverageFile.write('N/A')
            except:
                failCount += 1
        if(failCount == testCount):
            testResult[3].append(contractName)

        loopTimeFile.write('\n')
        coverageFile.write('\n')

    analyzeFile = open('analyze.txt', 'w')
    for i in range(4):
        analyzeFile.write(str(len(testResult[i])) + '\n')
    for i in range(4):
        analyzeFile.write('\n')
        for contractName in testResult[i]:
            analyzeFile.write(contractName + '\n')

def main():
    #init()
    startTime = time.time()
    print(time.asctime(time.localtime(startTime)))
    fuzzAll()
    endTime = time.time()
    print(time.asctime(time.localtime(endTime)))
    print(endTime - startTime)
    analyze()
    os.system('rm ' + atkforgContractBinary)

if __name__ == "__main__":
    main()


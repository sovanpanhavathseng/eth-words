npm install solc web3

pragma solidity ^0.8.0;

contract SimpleStorage {
    uint256 storedData;

    function set(uint256 x) public {
        storedData = x;
    }

    function get() public view returns (uint256) {
        return storedData;
    }
}

const Web3 = require('web3');
const solc = require('solc');

// Connect to the local Ethereum blockchain using ganache-cli
const web3 = new Web3('http://localhost:8545');

// Read the contract source code from file
const sourceCode = fs.readFileSync('SimpleStorage.sol', 'utf8');

// Compile the contract using the Solidity compiler
const compiledCode = solc.compile(sourceCode);

// Extract the bytecode and ABI (Application Binary Interface) from the compiled code
const bytecode = compiledCode.contracts[':SimpleStorage'].bytecode;
const abi = JSON.parse(compiledCode.contracts[':SimpleStorage'].interface);

// Deploy the contract to the blockchain using web3.js
const Contract = new web3.eth.Contract(abi);
Contract.deploy({ data: bytecode }).send({ from: web3.eth.accounts[0], gas: 1500000, gasPrice: '30000000000000' })
  .then((contract) => {
    console.log('Contract deployed at address: ' + contract.options.address);
  })
  .catch((error) => {
    console.error('Failed to deploy contract: ' + error);
  });

// Import the necessary libraries
const Web3 = require('web3');
const solc = require('solc');

// Create a new Web3 instance
const web3 = new Web3('http://localhost:8545');

// Define the Solidity code
const contractCode = `
  pragma solidity ^0.8.0;

  contract MyContract {
    uint256 public myNumber;

    function setNumber(uint256 _number) public {
      myNumber = _number;
    }
  }
`;

// Compile the Solidity code using the Solidity compiler
const compiledCode = solc.compile(contractCode);

// Get the bytecode and ABI from the compiled code
const bytecode = compiledCode.contracts[':MyContract'].bytecode;
const abi = JSON.parse(compiledCode.contracts[':MyContract'].interface);

// Deploy the contract using Web3
const MyContract = new web3.eth.Contract(abi);
MyContract.deploy({
  data: bytecode
}).send({
  from: '0x0123456789012345678901234567890123456789', // Use your own Ethereum address here
  gas: 1500000,
  gasPrice: '30000000000'
}).then((newContractInstance) => {
  console.log(newContractInstance.options.address); // Log the address of the newly deployed contract
});

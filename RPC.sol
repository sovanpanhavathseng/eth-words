pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

contract MyContract {
    IERC20 public token;

    constructor(address _tokenAddress) {
        token = IERC20(_tokenAddress);
    }

    function getBalance(address _account) public view returns (uint) {
        return token.balanceOf(_account);
    }
}

const Web3 = require('web3');
const abi = require('MyContractABI.json'); // ABI of MyContract
const contractAddress = '0x1234567890123456789012345678901234567890'; // Address of MyContract
const accountAddress = '0x1234567890123456789012345678901234567890'; // Address of account to query

const web3 = new Web3('http://localhost:8545'); // HTTP provider URL
const contract = new web3.eth.Contract(abi, contractAddress);

contract.methods.getBalance(accountAddress).call((err, balance) => {
  if (err) {
    console.error(err);
  } else {
    console.log(`Account balance: ${balance}`);
  }
});

pragma solidity ^0.8.0;

contract MyContract {
  uint256 public myVariable;

  constructor(uint256 initialValue) {
    myVariable = initialValue;
  }

  function updateVariable(uint256 newValue) public {
    myVariable = newValue;
  }
}

gasPrice: web3.utils.toWei('10', 'gwei')

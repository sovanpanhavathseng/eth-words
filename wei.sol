pragma solidity ^0.8.0;

contract MyContract {
  uint256 public myNumber;

  function setNumber(uint256 _number) public payable {
    require(msg.value >= 1 wei, "Minimum 1 wei required to set number"); // Require a minimum of 1 wei to set the number
    myNumber = _number;
  }

  function withdraw() public {
    require(address(this).balance > 0, "Contract balance is 0"); // Require that the contract has a positive balance
    msg.sender.transfer(address(this).balance); // Transfer the entire contract balance to the caller
  }
}

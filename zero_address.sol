pragma solidity ^0.8.0;

contract MyContract {
  address payable public owner;

  constructor() {
    owner = payable(address(0)); // Set the owner to the zero address initially
  }

  function transferOwnership(address payable _newOwner) public {
    require(msg.sender == owner, "Only the owner can transfer ownership"); // Only the current owner can transfer ownership
    owner = _newOwner;
  }

  function destroy() public {
    require(msg.sender == owner, "Only the owner can destroy the contract"); // Only the owner can destroy the contract
    selfdestruct(owner); // Destroy the contract and transfer any remaining funds to the owner's address (which is the zero address in this case)
  }
}

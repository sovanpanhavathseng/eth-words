pragma solidity ^0.8.0;

contract MyContract {
  function getDifficulty() public view returns (uint) {
    return block.difficulty;
  }
}

pragma solidity ^0.8.0;

contract EntropyGenerator {
  function generateEntropy() public view returns (bytes32) {
    return blockhash(block.number - 1);
  }
}

contract ForkChoice {
  mapping(bytes32 => uint256) blockWeights;
  bytes32[] blockHashes;
  uint256 public maxWeight = 0;
  bytes32 public head;

  function addBlock(bytes32 blockHash, uint256 weight) public {
    require(blockWeights[blockHash] == 0, "Block already added");
    blockWeights[blockHash] = weight;
    blockHashes.push(blockHash);
    if (weight > maxWeight) {
      maxWeight = weight;
      head = blockHash;
    }
  }

  function getHead() public view returns (bytes32) {
    return head;
  }

  function getBlockWeight(bytes32 blockHash) public view returns (uint256) {
    return blockWeights[blockHash];
  }

  function getBlockHashes() public view returns (bytes32[] memory) {
    return blockHashes;
  }
}

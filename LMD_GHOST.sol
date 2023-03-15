function validateBlock(bytes32[] memory blockHashes, bytes32[] memory parentHashes, uint[] memory blockWeights) public view returns (bool) {
    uint maxWeight = 0;
    bytes32 heaviestBlock = blockHashes[0];

    for (uint i = 0; i < blockHashes.length; i++) {
        bytes32 parentHash = parentHashes[i];
        uint weight = blockWeights[i];

        if (blockHashes[i] == keccak256(abi.encodePacked(parentHash, blockWeights))) {
            if (weight > maxWeight) {
                maxWeight = weight;
                heaviestBlock = blockHashes[i];
            }
        }
    }

    return (heaviestBlock == blockHashes[blockHashes.length-1]);
}

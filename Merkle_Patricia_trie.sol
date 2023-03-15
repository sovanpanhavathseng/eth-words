pragma solidity ^0.8.0;

import "github.com/ethereum/solidity/.../MerklePatriciaProof.sol";

contract MyContract {
    mapping(bytes32 => bytes32) data;

    function insert(bytes memory key, bytes memory value) public {
        bytes32 keyHash = keccak256(key);
        bytes32 valueHash = keccak256(value);
        bytes32 trieRoot = MerklePatriciaProof.update(dataRoot, key, value);
        data[keyHash] = valueHash;
    }

    function get(bytes memory key) public view returns (bytes memory) {
        bytes32 keyHash = keccak256(key);
        bytes32 valueHash = data[keyHash];
        return valueHash;
    }

    function proof(bytes memory key) public view returns (bytes memory) {
        bytes32 keyHash = keccak256(key);
        bytes32 valueHash = data[keyHash];
        bytes32 trieRoot = MerklePatriciaProof.update(dataRoot, key, value);
        return MerklePatriciaProof.getProof(trieRoot, key);
    }
}

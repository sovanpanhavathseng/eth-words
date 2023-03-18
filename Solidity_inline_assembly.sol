pragma solidity ^0.8.0;

contract HashExample {
    function keccak256Hash(bytes memory data) public pure returns (bytes32) {
        bytes32 hash;
        assembly {
            hash := keccak256(add(data, 32), mload(data))
        }
        return hash;
    }
}

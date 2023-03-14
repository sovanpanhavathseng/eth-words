pragma solidity ^0.8.0;

contract HashExample {
    function hashString(string memory input) public pure returns (bytes32) {
        return keccak256(bytes(input));
    }
}

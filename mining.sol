pragma solidity ^0.8.0;

contract MiningContract {
    uint public difficulty = 2;
    uint public nonce;
    uint public target;

    constructor() public {
        target = 2**(256 - difficulty);
    }

    function mine() public returns (bytes32) {
        bytes32 solution;
        while (uint(solution) > target) {
            nonce++;
            solution = keccak256(abi.encodePacked(nonce));
        }
        return solution;
    }

    function setDifficulty(uint newDifficulty) public {
        difficulty = newDifficulty;
        target = 2**(256 - difficulty);
    }
}

pragma solidity ^0.8.0;

contract TotalDifficulty {
    uint256 public totalDifficulty;
    
    constructor() {
        totalDifficulty = block.difficulty;
    }
}

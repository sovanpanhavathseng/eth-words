pragma solidity ^0.8.0;

contract TotalDifficulty {
    uint256 public totalDifficulty;
    
    constructor() {
        totalDifficulty = block.difficulty;
    }
}

pragma solidity ^0.8.0;

contract TotalDifficulty {
    function getBlockDifficulty(uint256 blockNumber) public view returns (uint256) {
        return block.difficulty;
    }
}

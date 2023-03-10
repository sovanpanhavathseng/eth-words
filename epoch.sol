pragma solidity ^0.8.0;

contract EpochTime {
    uint256 private startTime;

    constructor() {
        startTime = block.timestamp;
    }

    function getElapsedTime() public view returns (uint256) {
        return block.timestamp - startTime;
    }
}

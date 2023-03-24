pragma solidity ^0.8.0;

contract BlockTime {
    function getCurrentBlockTime() public view returns (uint256) {
        return block.timestamp;
    }
}

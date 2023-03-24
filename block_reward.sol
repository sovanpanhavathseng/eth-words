pragma solidity ^0.8.0;

contract BlockReward {
    uint256 constant BLOCK_REWARD = 2 ether;

    function getBlockReward() public view returns (uint256) {
        return BLOCK_REWARD;
    }
}

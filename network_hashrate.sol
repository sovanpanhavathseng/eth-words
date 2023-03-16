pragma solidity ^0.8.0;

contract HashrateIncentive {
    mapping(address => uint256) public hashrate;
    uint256 public totalHashrate;

    function contributeHashrate(uint256 amount) public {
        require(amount > 0, "Amount must be greater than 0");
        hashrate[msg.sender] += amount;
        totalHashrate += amount;
    }

    function rewardMiners(uint256 rewardAmount) public {
        require(rewardAmount > 0, "Reward amount must be greater than 0");
        require(totalHashrate > 0, "No hashrate contributed yet");
        uint256 rewardPerHashrate = rewardAmount / totalHashrate;
        for (uint i = 0; i < miners.length; i++) {
            address miner = miners[i];
            uint256 minerReward = rewardPerHashrate * hashrate[miner];
            payable(miner).transfer(minerReward);
        }
    }
}

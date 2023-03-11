pragma solidity ^0.8.0;

contract MiningRewards {
    mapping(address => uint256) public balances;
    uint256 public rewardAmount;

    constructor(uint256 _rewardAmount) {
        rewardAmount = _rewardAmount;
    }

    function distributeRewards(address[] memory miners) public {
        uint256 totalReward = rewardAmount * miners.length;
        require(totalReward <= address(this).balance, "Insufficient funds");
        
        for (uint256 i = 0; i < miners.length; i++) {
            balances[miners[i]] += rewardAmount;
        }
    }

    function withdrawRewards() public {
        uint256 reward = balances[msg.sender];
        balances[msg.sender] = 0;
        payable(msg.sender).transfer(reward);
    }
}

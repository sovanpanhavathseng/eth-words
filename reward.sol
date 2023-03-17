contract RewardSystem {
    mapping(address => uint) public rewards;

    function distributeRewards(address[] memory recipients, uint[] memory amounts) public {
        require(recipients.length == amounts.length);

        for (uint i = 0; i < recipients.length; i++) {
            rewards[recipients[i]] += amounts[i];
        }
    }

    function claimReward() public {
        uint reward = rewards[msg.sender];
        require(reward > 0);

        rewards[msg.sender] = 0;
        msg.sender.transfer(reward);
    }
}

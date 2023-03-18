pragma solidity ^0.8.0;

contract StakingPool {
    struct Staker {
        uint256 balance;
        uint256 rewardPerToken;
        uint256 rewardEarned;
    }
    
    address public stakingToken;
    uint256 public totalStaked;
    uint256 public rewardRate;
    uint256 public lastUpdate;
    mapping(address => Staker) public stakers;
    
    constructor(address _stakingToken, uint256 _rewardRate) {
        stakingToken = _stakingToken;
        rewardRate = _rewardRate;
        lastUpdate = block.timestamp;
    }
    
    function stake(uint256 _amount) external {
        require(_amount > 0, "Cannot stake 0 tokens");
        updateRewards();
        require(ERC20(stakingToken).transferFrom(msg.sender, address(this), _amount), "Token transfer failed");
        Staker storage staker = stakers[msg.sender];
        staker.balance += _amount;
        staker.rewardPerToken = totalStaked == 0 ? 0 : staker.rewardPerToken + (_amount * rewardRate) / totalStaked;
        totalStaked += _amount;
    }
    
    function unstake(uint256 _amount) external {
        require(_amount > 0, "Cannot unstake 0 tokens");
        updateRewards();
        Staker storage staker = stakers[msg.sender];
        require(staker.balance >= _amount, "Insufficient balance");
        staker.balance -= _amount;
        staker.rewardPerToken = totalStaked == 0 ? 0 : staker.rewardPerToken - (_amount * rewardRate) / totalStaked;
        totalStaked -= _amount;
        require(ERC20(stakingToken).transfer(msg.sender, _amount), "Token transfer failed");
    }
    
    function updateRewards() public {
        uint256 timePassed = block.timestamp - lastUpdate;
        uint256 totalRewards = timePassed * rewardRate;
        if (totalStaked > 0) {
            for (address stakerAddress : getStakers()) {
                Staker storage staker = stakers[stakerAddress];
                staker.rewardEarned += staker.balance * (totalRewards * (10**18)) / totalStaked;
                staker.rewardPerToken += (totalRewards * (10**18)) / totalStaked;
            }
        }
        lastUpdate = block.timestamp;
    }
    
    function claimReward() external {
        updateRewards();
        Staker storage staker = stakers[msg.sender];
        uint256 reward = staker.rewardEarned;
        staker.rewardEarned = 0;
        require(ERC20(rewardToken).transfer(msg.sender, reward), "Token transfer failed");
    }
    
    function getStakers() public view returns (address[] memory) {
        address[] memory stakerAddresses = new address[](totalStaked);
        uint256 index = 0;
        for (address stakerAddress : stakers) {
            stakerAddresses[index] = stakerAddress;
            index++;
        }
        return stakerAddresses;
    }
}

pragma solidity ^0.8.0;

interface IToken {
    function balanceOf(address account) external view returns (uint256);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function transfer(address recipient, uint256 amount) external returns (bool);
}

contract Staking {
    IToken public token;
    mapping(address => uint256) public staked;
    mapping(address => uint256) public rewards;
    uint256 public totalStaked;
    uint256 public rewardRate = 100; // 100 tokens per block
    uint256 public lastBlockNumber;
    
    event Staked(address indexed account, uint256 amount);
    event Unstaked(address indexed account, uint256 amount);
    event Claimed(address indexed account, uint256 amount);
    
    constructor(address _token) {
        token = IToken(_token);
        lastBlockNumber = block.number;
    }
    
    function stake(uint256 _amount) public {
        require(_amount > 0, "Cannot stake 0 tokens");
        require(token.transferFrom(msg.sender, address(this), _amount), "Token transfer failed");
        staked[msg.sender] += _amount;
        totalStaked += _amount;
        emit Staked(msg.sender, _amount);
    }
    
    function unstake(uint256 _amount) public {
        require(_amount > 0, "Cannot unstake 0 tokens");
        require(staked[msg.sender] >= _amount, "Insufficient staked tokens");
        uint256 claimed = claimRewards();
        staked[msg.sender] -= _amount;
        totalStaked -= _amount;
        require(token.transfer(msg.sender, _amount), "Token transfer failed");
        emit Unstaked(msg.sender, _amount);
    }
    
    function claimRewards() public returns (uint256) {
        uint256 blocksPassed = block.number - lastBlockNumber;
        uint256 rewardAmount = staked[msg.sender] * blocksPassed * rewardRate;
        rewards[msg.sender] += rewardAmount;
        lastBlockNumber = block.number;
        emit Claimed(msg.sender, rewardAmount);
        return rewardAmount;
    }
    
    function getStakedBalance() public view returns (uint256) {
        return staked[msg.sender];
    }
    
    function getRewardBalance() public view returns (uint256) {
        uint256 blocksPassed = block.number - lastBlockNumber;
        uint256 rewardAmount = staked[msg.sender] * blocksPassed * rewardRate;
        return rewards[msg.sender] + rewardAmount;
    }
}

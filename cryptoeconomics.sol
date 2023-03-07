pragma solidity ^0.8.0;

contract Token {
    mapping(address => uint256) public balances;
    uint256 public totalSupply;

    constructor(uint256 _initialSupply) {
        balances[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
    }

    function transfer(address _to, uint256 _amount) public returns (bool) {
        require(balances[msg.sender] >= _amount);
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
        return true;
    }
}

contract Crowdsale {
    address public beneficiary;
    uint256 public fundingGoal;
    uint256 public amountRaised;
    uint256 public deadline;
    Token public tokenReward;
    mapping(address => uint256) public balanceOf;
    bool public fundingGoalReached = false;
    bool public crowdsaleClosed = false;

    event GoalReached(address recipient, uint256 totalAmountRaised);
    event FundTransfer(address backer, uint256 amount, bool isContribution);

    constructor(
        address _beneficiary,
        uint256 _fundingGoal,
        uint256 _durationInDays,
        Token _tokenReward
    ) {
        beneficiary = _beneficiary;
        fundingGoal = _fundingGoal * 1 ether;
        deadline = block.timestamp + (_durationInDays * 1 days);
        tokenReward = Token(_tokenReward);
    }

    function () public payable {
        require(!crowdsaleClosed);
        uint256 amount = msg.value;
        balanceOf[msg.sender] += amount;
        amountRaised += amount;
        tokenReward.transfer(msg.sender, amount / 10);
        emit FundTransfer(msg.sender, amount, true);
    }

    function checkGoalReached() public {
        require(block.timestamp >= deadline);
        if (amountRaised >= fundingGoal) {
            fundingGoalReached = true;
            emit GoalReached(beneficiary, amountRaised);
        }
        crowdsaleClosed = true;
    }

    function safeWithdrawal() public {
        require(block.timestamp >= deadline && !fundingGoalReached);
        uint256 amount = balanceOf[msg.sender];
        balanceOf[msg.sender] = 0;
        if (amount > 0) {
            if (msg.sender.send(amount)) {
                emit FundTransfer(msg.sender, amount, false);
            } else {
                balanceOf[msg.sender] = amount;
            }
        }
    }
}

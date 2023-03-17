pragma solidity ^0.8.0;

contract Rollup {
    mapping(address => uint) public balances;

    event Deposit(address indexed account, uint amount);
    event Withdrawal(address indexed account, uint amount);

    function deposit() public payable {
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        emit Withdrawal(msg.sender, amount);
    }

    function commitStateChange(address account, uint amount) external {
        // TODO: Verify that the state change is valid
        balances[account] += amount;
    }

    function revertStateChange(address account, uint amount) external {
        // TODO: Revert the state change
        balances[account] -= amount;
    }
}

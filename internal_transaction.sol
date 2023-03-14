pragma solidity ^0.8.0;

contract MyContract {
    uint256 public balance;
    mapping(address => uint256) public balances;
    
    function deposit(uint256 amount) public {
        balance += amount;
        balances[msg.sender] += amount;
    }
    
    function withdraw(uint256 amount) public {
        require(amount <= balances[msg.sender], "Insufficient balance");
        balance -= amount;
        balances[msg.sender] -= amount;
    }
}

pragma solidity ^0.8.0;

contract MyAccount {
    address public owner;
    uint public balance;

    constructor() {
        owner = msg.sender;
        balance = 0;
    }

    function deposit() public payable {
        balance += msg.value;
    }

    function withdraw(uint amount) public {
        require(msg.sender == owner, "Only the owner can withdraw funds");
        require(amount <= balance, "Insufficient balance");
        payable(msg.sender).transfer(amount);
        balance -= amount;
    }
}

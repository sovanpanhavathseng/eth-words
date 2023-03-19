pragma solidity ^0.8.0;

contract MyWallet {
    address private owner;

    event Deposit(address indexed sender, uint256 amount);
    event Withdraw(address indexed recipient, uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
        require(msg.value > 0, "Amount must be greater than 0");
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(address payable recipient, uint256 amount) public {
        require(msg.sender == owner, "Only owner can withdraw funds");
        require(address(this).balance >= amount, "Insufficient balance");
        recipient.transfer(amount);
        emit Withdraw(recipient, amount);
    }
}

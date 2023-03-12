pragma solidity ^0.8.0;

interface ERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
}

contract Faucet {
    address public owner;
    mapping(address => uint) public lastRequestTime;

    constructor() {
        owner = msg.sender;
    }

    function requestToken(ERC20 token, uint256 amount) public {
        require(amount > 0 && amount <= 100, "Amount must be between 1 and 100 tokens.");
        require(lastRequestTime[msg.sender] + 1 minutes < block.timestamp, "You can only request tokens once per minute.");
        
        lastRequestTime[msg.sender] = block.timestamp;
        token.transfer(msg.sender, amount);
    }

    function withdraw(ERC20 token, uint256 amount) public {
        require(msg.sender == owner, "Only the contract owner can withdraw tokens.");
        token.transfer(msg.sender, amount);
    }
}

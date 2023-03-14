pragma solidity ^0.8.0;

contract HDWallet {
    mapping (address => uint256) public balances;
    mapping (address => bool) public accounts;
    
    function createAccount() public {
        // Generate a new key pair from the HD wallet
        // and associate it with the user's Ethereum address
        accounts[msg.sender] = true;
    }
    
    function deposit() public payable {
        // Add the deposited Ether to the user's balance
        balances[msg.sender] += msg.value;
    }
    
    function withdraw(uint256 amount) public {
        // Subtract the requested amount from the user's balance
        balances[msg.sender] -= amount;
        
        // Transfer the requested amount to the user's Ethereum address
        payable(msg.sender).transfer(amount);
    }
}

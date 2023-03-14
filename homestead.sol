pragma solidity ^0.8.0;

contract Example {
    mapping (address => uint256) public balances;

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        
        if (!payable(msg.sender).send(amount)) {
            // Use the throw keyword to revert the transaction
            // if the transfer fails
            throw;
        }
    }
}

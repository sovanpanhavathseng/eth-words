pragma solidity ^0.8.0;

contract MyToken {
    mapping(address => uint256) private _balances;

    function transfer(address recipient, uint256 amount) public {
        require(_balances[msg.sender] >= amount, "Insufficient balance");

        _balances[msg.sender] -= amount;
        _balances[recipient] += amount;
    }
}

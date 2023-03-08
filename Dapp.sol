pragma solidity ^0.8.0;

contract DigitalAsset {

    address public owner;
    mapping(address => uint) public balances;

    event Transfer(address indexed from, address indexed to, uint value);

    constructor() {
        owner = msg.sender;
    }

    function mint(address recipient, uint value) public {
        require(msg.sender == owner, "Only the owner can mint new tokens.");
        balances[recipient] += value;
    }

    function transfer(address recipient, uint value) public {
        require(balances[msg.sender] >= value, "Insufficient balance.");
        balances[msg.sender] -= value;
        balances[recipient] += value;
        emit Transfer(msg.sender, recipient, value);
    }

}

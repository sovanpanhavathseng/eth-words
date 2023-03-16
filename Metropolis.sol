pragma solidity ^0.8.0;

contract MyContract {
    uint public myValue;
    mapping(address => uint) public balances;

    function setValue(uint newValue) public {
        myValue = newValue;
    }

    function withdraw(uint amount) public {
        require(amount <= balances[msg.sender], "Insufficient balance");
        require(address(this).balance >= amount, "Insufficient contract balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}

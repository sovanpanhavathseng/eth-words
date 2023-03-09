pragma solidity ^0.8.0;

contract DepositContract {
    address public depositor;
    uint public amount;
    
    constructor() payable {
        depositor = msg.sender;
        amount = msg.value;
    }
    
    function deposit() public payable {
        require(msg.sender == depositor, "Only depositor can deposit");
        amount += msg.value;
    }
    
    function withdraw() public {
        require(msg.sender == depositor, "Only depositor can withdraw");
        payable(depositor).transfer(address(this).balance);
    }
}

pragma solidity ^0.8.0;

contract MyDapp {
    address public owner;
    uint public myNumber;

    constructor() {
        owner = msg.sender;
        myNumber = 0;
    }

    function setNumber(uint _number) public {
        require(msg.sender == owner, "Only the owner can set the number");
        myNumber = _number;
    }

    function getNumber() public view returns (uint) {
        return myNumber;
    }
}

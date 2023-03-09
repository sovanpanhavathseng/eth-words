pragma solidity ^0.8.0;

contract Deed {
    address public owner;
    address public lawyer;
    uint public value;
    uint public earliest;

    constructor(address _owner, address _lawyer, uint _value, uint _earliest) {
        owner = _owner;
        lawyer = _lawyer;
        value = _value;
        earliest = _earliest;
    }

    function balance() public view returns (uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        require(msg.value == value);
    }

    function withdraw() public {
        require(msg.sender == owner);
        require(block.timestamp >= earliest);
        payable(owner).transfer(address(this).balance);
    }

    function abort() public {
        require(msg.sender == lawyer);
        payable(owner).transfer(address(this).balance);
    }
}

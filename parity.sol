pragma solidity ^0.8.0;

contract MyContract {
    string private myString;
    uint256 private myNumber;

    constructor(string memory _string, uint256 _number) {
        myString = _string;
        myNumber = _number;
    }

    function getString() public view returns (string memory) {
        return myString;
    }

    function getNumber() public view returns (uint256) {
        return myNumber;
    }

    function setString(string memory _newString) public {
        myString = _newString;
    }

    function setNumber(uint256 _newNumber) public {
        myNumber = _newNumber;
    }
}

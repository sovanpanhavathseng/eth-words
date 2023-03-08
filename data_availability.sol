pragma solidity ^0.8.0;

contract MyContract {
    string public myString;

    function setString(string memory _string) public {
        myString = _string;
    }

    function getString() public view returns (string memory) {
        return myString;
    }
}

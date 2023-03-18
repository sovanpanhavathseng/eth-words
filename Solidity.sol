pragma solidity ^0.8.0;

contract MyContract {
    uint256 myVariable;

    function setMyVariable(uint256 newValue) public {
        myVariable = newValue;
    }

    function getMyVariable() public view returns (uint256) {
        return myVariable;
    }
}

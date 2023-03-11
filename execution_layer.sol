pragma solidity ^0.8.0;

contract MyContract {
    uint256 private myVariable;

    function set(uint256 x) public {
        myVariable = x;
    }

    function get() public view returns (uint256) {
        return myVariable;
    }
}

pragma solidity ^0.8.0;

contract GasExample {
    uint256 public total;

    function addNumbers(uint256 a, uint256 b) public {
        uint256 sum = a + b;
        total += sum;
    }
}

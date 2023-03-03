pragma solidity ^0.8.0;

contract LargeArray {
  uint[] public myArray;

  function addValue(uint value) public {
    myArray.push(value);
  }

  function getSum() public view returns (uint) {
    uint sum = 0;
    for (uint i = 0; i < myArray.length; i++) {
      sum += myArray[i];
    }
    return sum;
  }
}

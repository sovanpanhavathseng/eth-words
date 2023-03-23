pragma solidity ^0.8.0;

contract MyContract {
  address public myAddress;

  function setAddress(address _address) public {
    myAddress = _address;
  }
}

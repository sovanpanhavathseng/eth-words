pragma solidity ^0.8.0;

contract MyContract {
  mapping(address => bytes32) private encryptedData;

  function storeData(bytes32 _encryptedData) public {
    encryptedData[msg.sender] = _encryptedData;
  }

  function getData() public view returns (bytes32) {
    require(encryptedData[msg.sender] != 0, "No data stored for this address");
    return encryptedData[msg.sender];
  }
}

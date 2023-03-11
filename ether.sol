pragma solidity ^0.8.0;

contract EtherStorage {
    uint256 public storedEther;

    function depositEther() public payable {
        storedEther += msg.value;
    }
}

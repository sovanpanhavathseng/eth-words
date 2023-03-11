pragma solidity ^0.8.0;

contract MyContract {
    uint256 public totalReceived;

    receive() external payable {
        totalReceived += msg.value;
    }
}

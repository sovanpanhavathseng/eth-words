// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Receipt {
    
    event Received(address sender, uint256 amount);
    
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }
    
}

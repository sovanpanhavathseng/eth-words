pragma solidity ^0.8.0;

contract MyContract {
    // Fallback function
    fallback () external payable {
        // Log sender address and amount of ether sent
        emit FallbackCalled(msg.sender, msg.value);
    }
    
    // Event to log fallback function calls
    event FallbackCalled(address sender, uint256 amount);
}

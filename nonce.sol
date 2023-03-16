pragma solidity ^0.8.0;

contract NonceExample {
    uint256 public nonce;

    function sendTransaction() public {
        nonce = nonce + 1;
        address recipient = 0x1234567890123456789012345678901234567890;
        uint256 amount = 1 ether;
        uint256 gasLimit = 21000;
        uint256 gasPrice = 1000000000;
        bytes memory data = "";
        address payable sender = payable(msg.sender);
        sender.sendTransaction{nonce: nonce, value: amount, gas: gasLimit, gasPrice: gasPrice, data: data}(recipient);
    }
}

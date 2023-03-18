pragma solidity ^0.8.0;

contract SigningExample {
    function signMessage(bytes32 message, uint8 v, bytes32 r, bytes32 s) public pure returns (address) {
        bytes32 messageHash = keccak256(abi.encodePacked(message));
        address signer = ecrecover(messageHash, v, r, s);
        return signer;
    }
}

pragma solidity ^0.8.0;

contract VerifySignature {
    function verify(bytes32 _message, uint8 _v, bytes32 _r, bytes32 _s, address _address) public pure returns (bool) {
        bytes32 prefixedHash = keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", _message));
        address signer = ecrecover(prefixedHash, _v, _r, _s);
        return signer == _address;
    }
}

pragma solidity ^0.8.0;

contract ECDSA {
    function ecdsaSign(bytes32 message, uint256[2] memory privateKey) public pure returns (uint256[2] memory signature) {
        bytes32 r;
        bytes32 s;
        uint8 v;
        (r, s, v) = ecdsaRecover(message, privateKey);
        signature[0] = uint256(r);
        signature[1] = uint256(s);
    }

    function ecdsaVerify(bytes32 message, uint256[2] memory publicKey, uint256[2] memory signature) public pure returns (bool) {
        bytes32 r = bytes32(signature[0]);
        bytes32 s = bytes32(signature[1]);
        uint8 v = uint8(signature[1] >> 8);

        bytes32 prefixedHash = keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", message));
        address signer = ecrecover(prefixedHash, v, r, s);
        return ecrecoverToPubKey(message, v, r, s) == publicKey;
    }

    function ecdsaRecover(bytes32 message, uint256[2] memory privateKey) internal pure returns (bytes32 r, bytes32 s, uint8 v) {
        uint256[2] memory publicKey = ecdsaGetPublicKey(privateKey);
        r = bytes32(0);
        s = bytes32(0);
        v = 0;
        while (v < 27) {
            bytes32 prefixedHash = keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", message));
            address signer = ecrecover(prefixedHash, v, r, s);
            if (signer == addressFromPublicKey(publicKey)) {
                return (r, s, v);
            }
            v += 1;
        }
        revert("Failed to recover ECDSA signature");
    }

    function ecdsaGetPublicKey(uint256[2] memory privateKey) internal pure returns (uint256[2] memory publicKey) {
        bytes32 hash = keccak256(abi.encodePacked(privateKey));
        uint256 x = uint256(hash);
        while (x >= secp256k1n()) {
            hash = keccak256(abi.encodePacked(hash));
            x = uint256(hash);
        }
        uint256 y = secp256k1y(x);
        publicKey[0] = x;
        publicKey[1] = y;
    }

    function ecrecoverToPubKey(bytes32 message, uint8 v, bytes32 r, bytes32 s) internal pure returns (uint256[2] memory publicKey) {
        address signer = ecrecover(message, v, r, s);
        publicKey = publicKeyFromAddress(signer);
    }

    function publicKeyFromAddress(address a) internal pure returns (uint256[2] memory publicKey) {
        uint256 x = uint256(a);
        uint256 y = secp256k1y(x);
        publicKey[0] = x;
        publicKey[1] = y;
    }

    function addressFromPublicKey(uint256[2] memory publicKey) internal pure returns (address a) {
        bytes memory prefix = "\x04";
        bytes32 hash = keccak256(abi.encodePacked(prefix, publicKey[0], publicKey[1]));

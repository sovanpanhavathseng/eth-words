pragma solidity ^0.8.0;

contract SignatureVerification {
    function verifySignature(
        bytes32 hash,
        bytes memory signature,
        address signer
    ) public pure returns (bool) {
        bytes32 messageHash = keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));
        (uint8 v, bytes32 r, bytes32 s) = splitSignature(signature);
        address recoveredSigner = ecrecover(messageHash, v, r, s);
        return signer == recoveredSigner;
    }

    function splitSignature(bytes memory sig) internal pure returns (uint8, bytes32, bytes32) {
        require(sig.length == 65, "Invalid signature length");
        bytes32 r;
        bytes32 s;
        uint8 v;
        assembly {
            r := mload(add(sig, 32))
            s := mload(add(sig, 64))
            v := and(mload(add(sig, 65)), 255)
        }
        if (v < 27) {
            v += 27;
        }
        return (v, r, s);
    }
}

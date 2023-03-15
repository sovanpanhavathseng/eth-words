pragma solidity ^0.8.0;

import "sodium/contracts/Sodium.sol";

contract PasswordHasher {
    Sodium private sodium;

    constructor() {
        sodium = new Sodium();
    }

    function hashPassword(bytes memory password, bytes memory salt, uint256 iterations, uint256 memoryLimit) public view returns (bytes memory) {
        return sodium.crypto_pwhash_argon2id(
            sodium.crypto_secretbox_KEYBYTES(),
            password,
            salt,
            iterations,
            memoryLimit,
            Sodium.CRYPTO_PWHASH_ALG_ARGON2ID13
        );
    }
}

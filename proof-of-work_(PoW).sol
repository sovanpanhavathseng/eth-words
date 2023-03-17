contract ProofOfWork {
    uint public difficulty = 2;
    uint public nonce;

    function mine(uint nonceAttempt) public returns (bytes32) {
        bytes32 hash = sha256(abi.encodePacked(nonceAttempt));
        while (hash >> difficulty != 0) {
            nonceAttempt++;
            hash = sha256(abi.encodePacked(nonceAttempt));
        }
        nonce = nonceAttempt;
        return hash;
    }
}

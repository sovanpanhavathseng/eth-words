contract ProofOfWork {
    uint public difficulty;
    uint public nonce;

    function mine() public {
        while (hash(uint256(nonce)) > difficulty) {
            nonce++;
        }
    }

    function hash(uint256 nonce) public view returns (uint256) {
        return uint256(sha256(abi.encodePacked(nonce)));
    }
}

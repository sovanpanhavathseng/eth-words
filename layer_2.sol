pragma solidity ^0.8.0;

interface IToken {
    function transfer(address recipient, uint256 amount) external returns (bool);
}

interface IVerifier {
    function verify(bytes calldata proof, bytes calldata inputs) external returns (bool);
}

contract MyRollup {
    struct Transaction {
        address from;
        address to;
        uint256 amount;
    }

    mapping(bytes32 => bool) public usedCommits;

    function commit(bytes32 hash) public {
        require(!usedCommits[hash], "Commitment already used");
        usedCommits[hash] = true;
    }

    function submitTransaction(
        bytes calldata proof,
        bytes calldata inputs,
        bytes32 rootHash,
        bytes32 commitment
    ) public {
        require(verifyProof(proof, inputs, rootHash), "Invalid proof");
        require(!usedCommits[commitment], "Commitment already used");

        (address from, address to, uint256 amount) = abi.decode(inputs, (address, address, uint256));
        IToken token = IToken(0x123...); // address of the token contract
        require(token.transfer(to, amount), "Token transfer failed");

        usedCommits[commitment] = true;
    }

    function verifyProof(bytes calldata proof, bytes calldata inputs, bytes32 rootHash) internal returns (bool) {
        IVerifier verifier = IVerifier(0x456...); // address of the verifier contract
        bytes32 hash = keccak256(abi.encodePacked(inputs));
        bytes32 commitment = keccak256(abi.encodePacked(proof, hash));
        commit(commitment);
        return verifier.verify(proof, abi.encode(rootHash, hash));
    }
}

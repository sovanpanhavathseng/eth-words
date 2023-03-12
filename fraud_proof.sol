pragma solidity ^0.8.0;

contract FraudProof {
    mapping(bytes32 => bool) public proofs;

    function submitProof(bytes32 proof) public {
        proofs[proof] = true;
    }

    function verifyProof(bytes32 proof) public view returns (bool) {
        return proofs[proof];
    }
}

contract Payment {
    FraudProof fraudProof;
    mapping(address => uint256) public balances;

    constructor(address _fraudProof) {
        fraudProof = FraudProof(_fraudProof);
    }

    function transfer(address recipient, uint256 amount, bytes32 proof) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        require(fraudProof.verifyProof(proof), "Invalid proof");
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
    }

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}

pragma solidity ^0.8.0;

contract Attestation {
    mapping(address => bool) public verified;

    function attest() public {
        require(!verified[msg.sender], "Already verified");
        verified[msg.sender] = true;
    }
}

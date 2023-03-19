pragma solidity ^0.8.0;

contract ZKPExample {
  function proveEquality(uint256 _a, uint256 _b) public view returns (bool) {
    // Generate a random number
    uint256 r = uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty)));

    // Calculate the commitment hashes
    bytes32 ha = keccak256(abi.encodePacked(_a, r));
    bytes32 hb = keccak256(abi.encodePacked(_b, r));

    // The prover sends ha and hb to the verifier
    // ...

    // The verifier generates a random challenge value
    uint256 c = uint256(keccak256(abi.encodePacked(ha, hb, blockhash(block.number - 1))));

    // The prover sends the response value to the verifier
    uint256 s = r + c * (_a - _b);

    // The verifier checks that the proof is valid
    if (ha == keccak256(abi.encodePacked(_a, s)) && hb == keccak256(abi.encodePacked(_b, s))) {
      return true;
    } else {
      return false;
    }
  }
}

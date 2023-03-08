pragma solidity ^0.5.0;

// Importing the ZoKrates library
import "github.com/Zokrates/ZoKrates/contracts/Verifier.sol";

contract MyContract {
  // Initializing a Verifier contract
  Verifier public verifier;

  // Constructor that sets the Verifier contract address
  constructor(address _verifierAddress) public {
    verifier = Verifier(_verifierAddress);
  }

  // Function that uses the zk-SNARK protocol to verify a proof
  function verifyProof(uint[2] memory a, uint[2][2] memory b, uint[2] memory c, uint[2] memory input) public view returns (bool) {
    return verifier.verifyTx(a, b, c, input);
  }
}

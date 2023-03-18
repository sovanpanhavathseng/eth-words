pragma solidity ^0.8.0;
import "https://github.com/Zokrates/ZoKrates/blob/master/contracts/ZokratesVerifier.sol";

contract MyContract {
    ZokratesVerifier public verifier;

    constructor(address _verifierAddress) {
        verifier = ZokratesVerifier(_verifierAddress);
    }

    function verifyProof(
        uint256[2] memory _proofA,
        uint256[2][2] memory _proofB,
        uint256[2] memory _proofC,
        uint256[1] memory _inputs
    ) public returns (bool) {
        return verifier.verifyTx(_proofA, _proofB, _proofC, _inputs);
    }
}

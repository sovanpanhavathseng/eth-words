pragma solidity ^0.8.0;

interface ILightClient {
    function verifyTransaction(bytes32 transactionHash, uint256 blockNumber, bytes32[] memory proof) external view returns (bool);
}

contract MyContract {
    ILightClient lightClient;

    constructor(address lightClientAddress) {
        lightClient = ILightClient(lightClientAddress);
    }

    function processTransaction(bytes32 transactionHash, uint256 blockNumber, bytes32[] memory proof) public view returns (string memory) {
        if (lightClient.verifyTransaction(transactionHash, blockNumber, proof)) {
            return "Transaction is valid";
        } else {
            return "Transaction is not valid";
        }
    }
}

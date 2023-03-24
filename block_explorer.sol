pragma solidity ^0.8.0;

interface IBlockExplorer {
    function getLatestBlock() external view returns (uint256 blockNumber, bytes32 blockHash, uint256 blockTimestamp);
}

contract BlockExplorer is IBlockExplorer {
    function getLatestBlock() external view override returns (uint256 blockNumber, bytes32 blockHash, uint256 blockTimestamp) {
        blockNumber = block.number;
        blockHash = blockhash(blockNumber);
        blockTimestamp = block.timestamp;
    }
}

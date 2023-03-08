pragma solidity ^0.8.0;

contract MyContract {
    
    function getData(bytes32 blockHash, uint256 index) public view returns (bytes memory) {
        bytes memory data = blockhash(blockHash);
        bytes32 node = keccak256(data);
        
        for (uint256 i = 0; i < index; i++) {
            node = keccak256(abi.encode(node));
        }
        
        return node;
    }
}

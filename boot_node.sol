// This is just a sample implementation for illustration purposes, and is not a recommended approach for bootnodes

pragma solidity ^0.8.0;

contract Bootnode {
    address[] public nodes;
    
    function addNode(address node) public {
        // Add the new node to the list of nodes
        nodes.push(node);
    }
    
    function getNodes() public view returns (address[] memory) {
        // Return the list of nodes
        return nodes;
    }
}

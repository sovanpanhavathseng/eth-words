pragma solidity ^0.8.0;

contract DistributedHashTable {
    mapping (bytes32 => bytes32) public data;
    mapping (address => bool) public nodes;

    function setValue(bytes32 key, bytes32 value) public {
        require(nodes[msg.sender], "Only nodes can set values");
        data[key] = value;
    }

    function getValue(bytes32 key) public view returns (bytes32) {
        return data[key];
    }

    function addNode(address node) public {
        nodes[node] = true;
    }

    function removeNode(address node) public {
        nodes[node] = false;
    }
}

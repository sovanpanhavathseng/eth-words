pragma solidity ^0.8.0;

contract HashExample {
    function hashString(string memory data) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(data));
    }
}

pragma solidity ^0.8.0;

contract HashExample {
    function hashString(string memory data) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(data));
    }
}

contract MyContract {
    HashExample hashExample = new HashExample();
    
    function verifyHash(string memory data, bytes32 hash) public view returns (bool) {
        return hashExample.hashString(data) == hash;
    }
}

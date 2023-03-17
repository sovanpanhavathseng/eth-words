pragma solidity ^0.8.0;

contract SHA256 {
    
    function sha256(bytes memory data) public pure returns(bytes32) {
        return sha256(abi.encodePacked(data));
    }
    
    function sha256(bytes memory data, uint256 times) public pure returns(bytes32) {
        bytes32 hash = sha256(data);
        for(uint256 i = 0; i < times; i++) {
            hash = sha256(abi.encodePacked(hash));
        }
        return hash;
    }
    
    function sha256(bytes memory data1, bytes memory data2) public pure returns(bytes32) {
        return sha256(abi.encodePacked(data1, data2));
    }
    
    function sha256(bytes memory data1, bytes memory data2, uint256 times) public pure returns(bytes32) {
        bytes32 hash = sha256(data1, data2);
        for(uint256 i = 0; i < times; i++) {
            hash = sha256(abi.encodePacked(hash));
        }
        return hash;
    }
    
}

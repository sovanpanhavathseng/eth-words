pragma solidity ^0.8.0;

contract MyNFT {
    uint256 public totalTokens;
    mapping(uint256 => address) public tokenOwner;
    
    event NewToken(uint256 tokenId, address owner);
    
    function createToken() public returns (uint256) {
        totalTokens++;
        tokenOwner[totalTokens] = msg.sender;
        emit NewToken(totalTokens, msg.sender);
        return totalTokens;
    }
}

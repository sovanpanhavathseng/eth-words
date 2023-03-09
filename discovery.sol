pragma solidity ^0.8.0;

contract MyContract {
    string public contractName;
    address public contractOwner;
    uint public contractVersion;
    
    constructor(string memory _name, uint _version) {
        contractName = _name;
        contractOwner = msg.sender;
        contractVersion = _version;
    }
    
    function getVersion() public view returns (uint) {
        return contractVersion;
    }
    
    function setVersion(uint _newVersion) public {
        require(msg.sender == contractOwner, "Only contract owner can set version");
        contractVersion = _newVersion;
    }
}

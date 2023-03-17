pragma solidity ^0.8.0;

contract FileSharingProtocol {
    struct File {
        bytes32 name;
        uint256 size;
        address owner;
    }

    mapping (bytes32 => File) private files;

    function addFile(bytes32 _name, uint256 _size) public {
        require(files[_name].owner == address(0), "File already exists");
        files[_name] = File(_name, _size, msg.sender);
    }

    function getFile(bytes32 _name) public view returns (bytes32, uint256, address) {
        require(files[_name].owner != address(0), "File does not exist");
        return (files[_name].name, files[_name].size, files[_name].owner);
    }
}

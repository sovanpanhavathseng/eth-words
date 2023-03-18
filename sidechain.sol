pragma solidity ^0.8.0;

contract SidechainStorage {
    mapping (address => string) private _data;

    function store(string memory data) public {
        _data[msg.sender] = data;
    }

    function retrieve() public view returns (string memory) {
        return _data[msg.sender];
    }
}

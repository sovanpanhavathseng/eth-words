pragma solidity ^0.8.0;

contract MyContract {
    address private db;

    constructor(address _db) {
        db = _db;
    }

    function set(string memory key, string memory value) public {
        bytes memory keyBytes = bytes(key);
        bytes memory valueBytes = bytes(value);
        bytes memory data = abi.encodePacked(keyBytes, valueBytes);
        (bool success, bytes memory returnData) = db.call(abi.encodeWithSignature("Put(bytes)", data));
        require(success, "Failed to set data");
    }

    function get(string memory key) public view returns (string memory) {
        bytes memory keyBytes = bytes(key);
        (bool success, bytes memory returnData) = db.call(abi.encodeWithSignature("Get(bytes)", keyBytes));
        if (success) {
            return string(returnData);
        } else {
            return "";
        }
    }
}

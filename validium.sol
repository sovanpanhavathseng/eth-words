// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract MyValidiumContract {
    address private immutable _bridge;

    constructor(address bridge) {
        _bridge = bridge;
    }

    function setValue(string memory value) public {
        bytes memory data = abi.encodeWithSignature("setValue(string)", value);
        (bool success, ) = _bridge.call(data);
        require(success, "Failed to set value on Validium");
    }

    function getValue() public view returns (string memory) {
        bytes memory data = abi.encodeWithSignature("getValue()");
        (bool success, bytes memory result) = _bridge.staticcall(data);
        require(success, "Failed to get value from Validium");
        return abi.decode(result, (string));
    }
}

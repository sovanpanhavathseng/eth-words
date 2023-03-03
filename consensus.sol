// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    uint public myValue;

    function setValue(uint _value) public {
        myValue = _value;
    }
}

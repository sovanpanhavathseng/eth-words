pragma solidity ^0.8.0;

contract BigEndian {
    function encodeUint(uint value) public pure returns (bytes memory) {
        bytes memory result = new bytes(32);
        for (uint i = 0; i < 32; i++) {
            result[i] = byte(uint8(value >> ((31 - i) * 8)));
        }
        return result;
    }
}

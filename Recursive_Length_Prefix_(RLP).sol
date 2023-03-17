pragma solidity ^0.8.0;

library RLP {
    function encodeList(uint[] memory values) internal pure returns (bytes memory) {
        bytes[] memory encodedValues = new bytes[](values.length);

        for (uint i = 0; i < values.length; i++) {
            encodedValues[i] = encodeElement(values[i]);
        }

        return encodeElements(encodedValues);
    }

    function encodeElement(uint value) internal pure returns (bytes memory) {
        if (value == 0) {
            return new bytes(0);
        }

        bytes memory data = new bytes(32);
        assembly { mstore(add(data, 32), value) }
        uint256 length = 32;
        while (length > 0 && data[length - 1] == 0) {
            length--;
        }
        return abi.encodePacked(new bytes1(uint8(0x80 + length)), data[0:length]);
    }

    function encodeElements(bytes[] memory elements) internal pure returns (bytes memory) {
        uint totalLength = 0;
        for (uint i = 0; i < elements.length; i++) {
            totalLength += elements[i].length;
        }

        bytes memory data = new bytes(totalLength);
        uint offset = 0;

        for (uint i = 0; i < elements.length; i++) {
            bytes memory element = elements[i];
            assembly { 
                let encodedLength := mload(add(element, 0x20))
                let encodedOffset := add(add(element, 0x21), encodedLength)
                let encodedData := add(element, 0x21)
                let encodedSize := sub(encodedLength, 1)
                mstore(add(data, add(offset, 1)), encodedSize)
                mstore(add(data, add(offset, 2)), encodedData)
                offset := add(offset, encodedOffset)
            }
        }

        return abi.encodePacked(new bytes1(uint8(0xf7 + elements.length)), data);
    }
}

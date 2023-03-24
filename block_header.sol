pragma solidity ^0.8.0;

contract BlockHeader {
    function getBlockHeader(uint256 blockNumber) external view returns (bytes memory) {
        bytes memory header = new bytes(80);
        assembly {
            // Load the header data from the specified block number
            let blockData := mload(0x40)
            let success := call(
                gas(),
                blockNumber,
                0,
                0,
                0,
                blockData,
                80
            )

            // Copy the header data into the output bytes array
            if success {
                for { let i := 0 } lt(i, 80) { i := add(i, 1) } {
                    mstore(add(header, add(32, i)), mload(add(blockData, add(32, i))))
                }
            }
        }
        return header;
    }
}

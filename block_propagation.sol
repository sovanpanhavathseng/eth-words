pragma solidity ^0.8.0;

contract BlockPropagator {
    function getLatestBlock() public view returns (uint256 number, bytes32 hash, uint256 timestamp) {
        (bool success, bytes memory result) = address(0).call(abi.encodeWithSignature("eth_getBlockByNumber(uint256,bool)", block.number, false));
        require(success, "RPC call failed");

        (number, hash, timestamp) = abi.decode(result, (uint256, bytes32, uint256));
    }
}

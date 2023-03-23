pragma solidity ^0.8.0;

contract TransactionFee {
    function calculateFee(uint256 gasPrice, uint256 gasLimit) public pure returns (uint256) {
        uint256 baseFee = block.basefee;
        uint256 fee = gasPrice * gasLimit * (baseFee + 1) / 1e9;
        return fee;
    }
}

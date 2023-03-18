pragma solidity ^0.4.16;

contract SpuriousDragonExample {
    function bitwiseAnd(uint256 a, uint256 b) public pure returns (uint256) {
        uint256 result;
        assembly {
            result := and(a, b)
        }
        return result;
    }
}

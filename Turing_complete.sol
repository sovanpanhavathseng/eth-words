pragma solidity ^0.8.0;

contract MyTuringCompleteContract {
    
    function factorial(uint256 n) public pure returns (uint256) {
        if (n == 0) {
            return 1;
        } else {
            return n * factorial(n - 1);
        }
    }
}

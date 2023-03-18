pragma solidity ^0.8.0;

contract SyncExample {
    uint public currentBlock;

    function getCurrentBlock() public {
        currentBlock = block.number;
    }
}

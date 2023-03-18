pragma solidity ^0.8.0;

contract SlasherGame {
    uint256 public playerScore;
    
    function defeatMonster() public {
        playerScore += 10;
    }
}

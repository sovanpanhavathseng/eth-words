pragma solidity ^0.8.0;

contract Voting {
    mapping (bytes32 => uint256) public votes;

    function vote(bytes32 candidate) public {
        votes[candidate]++;
    }

    function getVotes(bytes32 candidate) public view returns (uint256) {
        return votes[candidate];
    }
}

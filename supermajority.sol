pragma solidity ^0.8.0;

contract SupermajorityVote {
    uint public votesFor;
    uint public votesAgainst;
    uint public threshold;
    bool public isPassed;

    constructor(uint _threshold) {
        threshold = _threshold;
    }

    function vote(bool _isFor) public {
        require(!isPassed, "The vote has already been passed.");
        if (_isFor) {
            votesFor++;
        } else {
            votesAgainst++;
        }
        if (votesFor >= threshold) {
            isPassed = true;
        }
    }
}

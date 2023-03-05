pragma solidity ^0.8.0;

contract VotingSystem {
    uint256 public numProposals;
    uint256 public numVoters;
    address public admin;
    mapping(address => bool) public voters;
    mapping(uint256 => Proposal) public proposals;

    struct Proposal {
        string name;
        uint256 voteCount;
    }

    constructor(string[] memory proposalNames) {
        admin = msg.sender;
        numProposals = proposalNames.length;
        for (uint256 i = 0; i < proposalNames.length; i++) {
            proposals[i] = Proposal({
                name: proposalNames[i],
                voteCount: 0
            });
        }
    }

    function registerVoter() public {
        require(msg.sender != admin, "Admin cannot register as a voter");
        require(!voters[msg.sender], "Voter has already registered");
        voters[msg.sender] = true;
        numVoters++;
    }

    function vote(uint256 proposalId) public {
        require(voters[msg.sender], "Voter has not registered");
        require(proposalId < numProposals, "Invalid proposal ID");
        Proposal storage proposal = proposals[proposalId];
        proposal.voteCount++;
    }

    function winningProposal() public view returns (string memory) {
        uint256 winningVoteCount = 0;
        uint256 winningProposalId;
        for (uint256 i = 0; i < numProposals; i++) {
            if (proposals[i].voteCount > winningVoteCount) {
                winningVoteCount = proposals[i].voteCount;
                winningProposalId = i;
            }
        }
        return proposals[winningProposalId].name;
    }
}

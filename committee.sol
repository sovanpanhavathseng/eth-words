pragma solidity ^0.8.0;

contract Committee {
    address[] public members;
    mapping (address => bool) public isMember;
    uint256 public proposalCount;
    mapping (uint256 => Proposal) public proposals;

    struct Proposal {
        uint256 id;
        string description;
        uint256 voteCount;
        mapping (address => bool) votes;
    }

    constructor(address[] memory _members) {
        for (uint256 i = 0; i < _members.length; i++) {
            members.push(_members[i]);
            isMember[_members[i]] = true;
        }
    }

    function createProposal(string memory _description) public {
        require(isMember[msg.sender], "Only committee members can create proposals");
        proposalCount++;
        proposals[proposalCount] = Proposal(proposalCount, _description, 0);
    }

    function vote(uint256 _proposalId) public {
        require(isMember[msg.sender], "Only committee members can vote");
        require(_proposalId <= proposalCount, "Invalid proposal ID");

        Proposal storage proposal = proposals[_proposalId];
        require(!proposal.votes[msg.sender], "You have already voted for this proposal");

        proposal.votes[msg.sender] = true;
        proposal.voteCount++;
    }

    function getProposal(uint256 _proposalId) public view returns (string memory description, uint256 voteCount) {
        require(_proposalId <= proposalCount, "Invalid proposal ID");

        Proposal storage proposal = proposals[_proposalId];
        return (proposal.description, proposal.voteCount);
    }
}

pragma solidity ^0.8.0;

contract DAO {
    mapping(address => uint) public shares;
    uint public totalShares;
    uint public proposalCount;
    struct Proposal {
        string description;
        uint votes;
        bool executed;
    }
    mapping(uint => Proposal) public proposals;

    function contribute(uint _shares) external {
        shares[msg.sender] += _shares;
        totalShares += _shares;
    }

    function vote(uint _proposalId) external {
        Proposal storage proposal = proposals[_proposalId];
        require(shares[msg.sender] > 0, "You have no shares to vote.");
        require(!proposal.executed, "This proposal has already been executed.");
        proposal.votes += shares[msg.sender];
    }

    function executeProposal(uint _proposalId) external {
        Proposal storage proposal = proposals[_proposalId];
        require(!proposal.executed, "This proposal has already been executed.");
        require(proposal.votes > (totalShares / 2), "The proposal did not pass.");

        proposal.executed = true;

        // execute proposal code here
    }

    function createProposal(string memory _description) external {
        proposals[proposalCount] = Proposal(_description, 0, false);
        proposalCount++;
    }
}

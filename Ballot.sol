// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.4.22;

contract Ballot {

    struct Voter {
        uint weight;
        bool voted;
        uint8 vote;
        address delegate;
    }
    struct Proposal {
        uint voteCount;
    }

    address public chairperson;
    mapping(address => Voter) public voters;
    Proposal[] public proposals;

    constructor(uint8 _numProposals) public {
        chairperson = msg.sender;
        voters[chairperson].weight = 1;
        proposals.length = _numProposals;
    }

    function giveRightToVote(address _voter) public {
        require(msg.sender == chairperson && !voters[_voter].voted && voters[_voter].weight == 0);
        voters[_voter].weight = 1;
    }

    function delegate(address _to) public {
        Voter storage sender = voters[msg.sender];
        require(!sender.voted);
        require(_to != msg.sender);

        while(voters[_to].delegate != address(0)) {
            _to = voters[_to].delegate;
            require(_to != msg.sender);
        }

        sender.voted = true;
        sender.delegate = _to;
        Voter storage delegate_ = voters[_to];
        if(delegate_.voted) {
            proposals[delegate_.vote].voteCount += sender.weight;
        } else {
            delegate_.weight += sender.weight;
        }
    }

    function vote(uint8 _proposal) public {
        Voter storage sender = voters[msg.sender];
        require(!sender.voted);
        sender.voted = true;
        sender.vote = _proposal;
        proposals[_proposal].voteCount += sender.weight;
    }

    function winningProposal() public view returns(uint8 _winningProposal) {
        uint256 winningVoteCount = 0;
        for(uint8 prop = 0; prop < proposals.length; prop++) {
            if(proposals[prop].voteCount > winningVoteCount) {
                winningVoteCount = proposals[prop].voteCount;
                _winningProposal = prop;
            }
        }
    }

    function winnerName() public view returns(bytes32 _winnerName) {
        _winnerName = bytes32(winningProposal());
    }
}

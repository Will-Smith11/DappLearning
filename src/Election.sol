// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

contract Election
{

    uint private duration;
    Canidate[] private canidates;
    string private election_name;
    uint private canidate_count;

    event NewElection(string _name, uint _duration);
    event NewVote(address _canidate, address _voter);
    event NewCanidate(address _canidate, string _name);

    mapping(address => bool) public hasVoted;
    mapping(address => uint) private getCanidateIndex;

    struct ElectionInfo
    {
        string election_identifier;
        uint duration; 
    }
    struct Canidate
    {
        string name;
        uint vote_count;
        address canidate_address;
    }

    modifier isNotCompleted()
    {
        require(block.timestamp < duration);
        _;
    }
    modifier canVote()
    {
        require(hasVoted[msg.sender] == false);
        _;
    }

    constructor(ElectionInfo memory _eInfo)
    {
        duration = _eInfo.duration;
        election_name = _eInfo.election_identifier;
        canidate_count = 0;
        emit NewElection(_eInfo.election_identifier,  _eInfo.duration);
    }

    function registerAsCanidate(string calldata _name) public isNotCompleted()
    {
        canidates.push(Canidate({
            name: _name,
            vote_count: 0,
            canidate_address: msg.sender
        }));
        getCanidateIndex[msg.sender] = canidate_count;

        canidate_count++;
        emit NewCanidate(msg.sender, _name);
    }

    function voteForCanidate(address _canidateAddr) public canVote() isNotCompleted()
    {
        Canidate storage canidate = canidates[getCanidateIndex[_canidateAddr]];
        canidate.vote_count++;
        emit NewVote(_canidateAddr, msg.sender);
    }

    function getAllCanidates() public view returns(Canidate[] memory)
    {
        return canidates;
    }


}
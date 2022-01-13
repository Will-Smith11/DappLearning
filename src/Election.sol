// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

contract Election
{

    event NewElection(string _name, uint _duration);

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

    uint private duration;
    Canidate[] private canidates;
    string private election_name;

    constructor(ElectionInfo memory _eInfo)
    {
        duration = _eInfo.duration;
        election_name = _eInfo.election_identifier;
        emit NewElection(_eInfo.election_identifier,  _eInfo.duration);
    }
}
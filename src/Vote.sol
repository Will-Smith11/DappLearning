// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

contract Vote
{
    struct Canidate
    {
        string name;
        uint vote_count;
        address canidate_address;
    }

    mapping(address => Canidate) public canidates;

    function getCanidates() external view returns(Canidate memory)
    {
        return canidates[msg.sender];
    }

    function registerAsCanidate(string calldata name) public
    {
        canidates[msg.sender] = Canidate({
            name: name,
            vote_count: 0,
            canidate_address: msg.sender
        });
    }
}
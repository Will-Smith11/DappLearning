// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "./Election.sol";

contract ElectionFactory
{
    function createElection(uint _duration, string calldata _name) public returns(Election)
    {
        return new Election(Election.ElectionInfo({
            election_identifier: _name,
            duration: block.timestamp + _duration
        }));
    }
}
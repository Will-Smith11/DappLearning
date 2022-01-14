// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "ds-test/test.sol";
import "./ElectionFactory.sol";
import "./Election.sol";

contract ElectionFactoryTest is DSTest 
{
    ElectionFactory electionFactory;

    function setUp() public 
    {
        electionFactory = new ElectionFactory();
    }

    function test_createElection() public
    {
        uint duration = uint(69);
        Election election = electionFactory.createElection(duration, "who's mom is the hottest");
        election.registerAsCanidate("tylers mom");

        assertEq(election.getAllCanidates().length, 1);
    }
}


// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "ds-test/test.sol";
import "./Vote.sol";

contract VoteTest is DSTest 
{
    Vote vote;
    
    function setUp() public {
        vote = new Vote();
    }

    function test_registerAsCanidate() public
    {
        string memory baseName = "Will Smith"; 
        vote.registerAsCanidate(baseName);
        string memory registedName = vote.getCanidates().name; 
        assertEq(registedName, baseName);
    }

}
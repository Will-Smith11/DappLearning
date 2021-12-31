// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "ds-test/test.sol";

import "./Dapp.sol";

contract DappTest is DSTest {
    Dapp dapp;

    function setUp() public {
        dapp = new Dapp();
    }

    function prove_sendEthToAddr(address testAddress) public 
    {
        payable(address(dapp)).transfer(69 ether);
        uint prebal = payable(testAddress).balance;
        dapp.sendFundsToAddress(testAddress, 30);
        uint postbal = payable(testAddress).balance;
        AssertEq(prebal+30, postbal);                
    }
}
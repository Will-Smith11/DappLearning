// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "ds-test/test.sol";

import "./Dapp.sol";

contract DappTest is DSTest {
    Dapp dapp;

    function setUp() public {
        dapp = new Dapp();
        payable(address(dapp)).transfer(69 ether);
    }

    function test_sendFundsToAddress() public 
    {
        uint prebal = payable(address(this)).balance;
        dapp.sendFundsToAddress(address(this), 30);
        uint postbal = payable(address(this)).balance;
        assertEq(prebal+30, postbal);                
    }

    function test_getBalance() public
    {
        assertEq(payable(address(dapp)).balance, dapp.getBalance());
    }
}
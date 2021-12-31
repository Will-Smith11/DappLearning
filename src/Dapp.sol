// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;


contract Dapp
{
    string ContractPassword;
    address owner;
    
    constructor()
    {
        owner = msg.sender;
    }
    
    modifier isOwner()
    {
        require(owner == msg.sender);
        _;
    }

    function getBalance() external view returns (uint)
    {
        return address(this).balance;
    }



}

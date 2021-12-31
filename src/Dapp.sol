// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;


contract Dapp
{
    string ContractPassword;
    address owner;
    
    event SentFunds(address, uint);
    constructor()
    {
        owner = msg.sender;
    }
    
    modifier isOwner()
    {
        require(owner == msg.sender);
        _;
    }
    receive() external payable{}

    function getBalance() external view returns (uint)
    {
        return address(this).balance;
    }

    function sendFundsToAddress(address _address, uint amount) external payable isOwner
    {
        require(address(this).balance >= amount); 
        payable(address(_address)).transfer(amount); 
        emit SentFunds(_address, amount);
    }
}

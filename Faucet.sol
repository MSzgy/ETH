// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Faucet {

    //Give out ether to anyone who asks
    function withdraw(uint withdraw_amount) public {
        
        // Limit withdrawal amout 
        require(withdraw_amount <= 10000000000000000000);

        // send the amount to the address that requested it
        payable(msg.sender).transfer(withdraw_amount);
    }
}

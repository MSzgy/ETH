pragma solidity ^0.4.22;

contract Coin{
    mapping(address=> uint) public balances;

    constructor(unit initialSupply) public{
        balances[msg.sender] = initialSupply;
    }

    function send(address receiver, unit amount) public returns(bool sufficient){
        require(balances[msg.sender] >= amount);
        require(balances[receiver] + amount >= balances[receiver]);
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        return true;
    }
}
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.4.22;

contract Honeypot {
    constructor() public payable{

    }

    uint luckyNum = 52;
    uint public last;
    struct Guess {
        address guesser;
        uint guess;
    }
    Guess[] public guesses;
    function guess(uint n) public payable {
        require(msg.value > 1 ether);
        guesses.push(Guess(msg.sender, n));
        if (n == luckyNum) {
            msg.sender.transfer(msg.value * 2);
        }
        last = now;
    }
}

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.4.0;

contract TestModifier {
    address public seller;
    constructor() public {
        seller = msg.sender;
    }
    modifier onlySeller() {
        require(msg.sender == seller, "Only seller can call this.");
        _;
    }
    function f() public view onlySeller returns (uint) {
        return 200;
    }
}

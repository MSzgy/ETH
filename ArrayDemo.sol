// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.4.22;

contract ArrayDemo {
    constructor(){
    }

    function f(uint len) public pure returns(bytes) {
        uint[] memory a = new uint[](7);
        bytes memory b = new bytes(len);
        assert(a.length == 7);
        assert(b.length == len);
        a[6] = 8;
        return b;
    }
}

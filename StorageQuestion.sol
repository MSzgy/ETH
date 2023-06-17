// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.4.0;

contract StorageQuestion {

    uint[] x;
    function f(uint[] memoryArray) public {
        x = memoryArray;
        uint[] y = x;
        y[7];
        y.length = 2;
        delete x;
        y = memoryArray;
        delete y;
        g(x);
        h(x);

    }
    function g(uint[] storage storageArray) internal {}
    function h(uint[] memoryArray) public {}
}

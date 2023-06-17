// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.4.0;

contract TestStorage {

    uint[] public data1;
    uint[] public data2;
    function append1() public {
        append(data1);
    }
    function append2() public {
        append(data2);
    }
    function append(uint[] storage data) internal {
        data.push(23);
    }
}

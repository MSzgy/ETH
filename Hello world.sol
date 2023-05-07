// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.4.22;



contract HelloWorld {
    uint256 public storedData;
    function set(uint256 data) public {
        storedData = data;
    }
    function get() public view returns (uint256) {
        return storedData;
    }
    
}

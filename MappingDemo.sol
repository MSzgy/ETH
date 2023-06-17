// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.0 <0.6.0;

contract MappingDemo {
    mapping(address => uint) public balances;
    function update(uint newBalance) public {
        balances[msg.sender] = newBalance;
    }
}

contract MappingUser {
    function f() public returns (uint) {
        MappingDemo m = new MappingDemo();
        m.update(100);
        return m.balances(address(this));
    }
}

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.5.0;

contract TestFallback {
    constructor() public payable {}
    address payable public testPayable;
    function callTest(Test test) public returns (bool) {
        (bool success, bytes memory data) = address(test).call(abi.encodeWithSignature("nonExistingFunction()"));
        require(success);
        testPayable = address(uint160(address(test)));
        return testPayable.send(2 ether);
    }
}

 contract Test {
     constructor() public payable {}
     function() external {x = 1;}
     uint public x;
 }


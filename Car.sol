pragma solidity ^0.4.22;

contract Car {
    string brand;
    uint public price;
    enum Weekday { Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday }
    constructor() public {
        brand = "Toyota";
        price = 10000000000000000000;
    }
    function setBrand(string _brand) public {
        brand = _brand;
    }
    function getBrand() public view returns (string) {
        return brand;
    }
    function setPrice(uint _price) public {
        price = _price;
    }
    function getPrice() public view returns (uint) {
        return price;
    }
    function test() public pure returns (uint) {
        bytes17 a;
        return a.length;
    }
    function testEnum() public pure returns (uint) {
        return uint(Weekday.Tuesday);
    }

}
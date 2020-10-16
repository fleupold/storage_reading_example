pragma solidity ^0.5.2;

contract ExampleExtension {
    // Needs same storage layout as ExampleContract
    uint private foo;
    function getFoo() public view returns (uint) {
         return foo;
    }
    function setAndGetFoo(uint256 foo_) public returns (uint) {
        foo = foo_;
        return foo;
    }
}
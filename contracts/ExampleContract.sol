pragma solidity ^0.5.2;

import "@gnosis.pm/util-contracts/contracts/StorageAccessible.sol";

contract ExampleContract is StorageAccessible {
    uint private foo;
    constructor(uint _foo) public {
        foo = _foo;
    }
}
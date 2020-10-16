pragma solidity ^0.5.2;

import "./ExampleContract.sol";
import "./ExampleExtension.sol";

contract ExternalReaderContract {
    ExampleContract public instance;
    ExampleExtension public extension;
    constructor(ExampleContract _instance, ExampleExtension _extension) public {
        instance = _instance;
        extension = _extension;
    }

    function invokeExtension() public returns (uint) {
        uint result = abi.decode(
            instance.simulateDelegatecall(
                address(extension), 
                abi.encodeWithSignature("getFoo()")
            ), (uint));
        return result;
    }
}
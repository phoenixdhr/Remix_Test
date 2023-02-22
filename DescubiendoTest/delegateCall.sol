// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// NOTE: Deploy this contract first
contract B {
    // NOTE: storage layout must be the same as contract A
    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract A {
    uint public num;
    address public sender;
    uint public value;

    function setVars(address _contract, uint _num) public payable returns(bytes memory) {
        // A's storage is set, B is not modified.
        bytes memory data = abi.encodeWithSignature("setVars(uint256)", _num);
        (bool success, bytes memory res) = _contract.delegatecall(data);
        require(success,"fail delegatecall");

        return res;
    }
}
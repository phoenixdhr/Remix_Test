// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.10;

contract call {
    constructor() payable {
        
    }
    function EthCALL(address _to, uint _value) payable public returns (bool, bytes memory) {
        
        (bool ok, bytes memory res) = _to.call{value:_value}("");

        return (ok, res);
        
    }


}

// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.10;



contract Counter {
    uint public count;

    function inc() public  returns(uint) {
        count+=1;
        return count;
    }
    
    receive() external payable{
    }
}



contract inputOutputFallback {

    address immutable addressCounter;

    constructor(address _addressCounter) {
        addressCounter = _addressCounter;
    }

    fallback(bytes calldata req) external payable returns(bytes memory) {
            
            (bool ok, bytes memory res)= addressCounter.call{value: msg.value}(req);
            require(ok, "call failed");

            return res;
    }
}




contract TestFallbackInputOutput {
    
    function singFuncInc() public pure returns (bytes memory ) {
        bytes memory firmaFunInc = abi.encodeCall(Counter.inc, ());
        return firmaFunInc;
    }

    function sendCall(address _to, bytes calldata firmaFunInc) public returns(bytes memory) {
        bytes memory req = firmaFunInc;
        (bool ok, bytes memory res) = _to.call(req);
        require(ok, "call failed");
        return res;
    }
}
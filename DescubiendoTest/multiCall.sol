// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.10;

contract main {
    
    function get1() public view returns (uint, uint) {
        return (1, block.timestamp);
    }

    function get2() public view returns (uint, uint) {
        return (2, block.timestamp);
    }


    function selectorGet1() public pure  returns (bytes memory data) {
        data = abi.encodeWithSelector(this.get1.selector,1);
    }

    function selectorGet2() public pure  returns (bytes memory data) {
    data = abi.encodeWithSelector(this.get2.selector,1);
    }

}



contract Multicall {
    
    function fMulticall(address[] calldata _target, bytes[] calldata _selector)  public returns (bytes[] memory) {
        
        require(_target.length==_selector.length);
        bytes[] memory results= new bytes[](_selector.length);

// En este ejemplo se uso call, pero se pudo usar staticcall. staticcall se usa cuando las funciones que llama son pure o view,
// osea no cambia el estado, eso incluye no enviar eth.

        for(uint i=0; i<_target.length; i++){
            (bool ok, bytes memory res)=_target[i].call(_selector[i]);
            require(ok, "call failed");
            results[i]=res;
        }
        return results;

    }

}




// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract main {
    
    uint public numero;
    address public remitente;
    uint public weis;

    function get(uint _numero) payable public {
        numero =_numero;
        remitente=msg.sender;
        weis=msg.value;        
    }

}


contract inputOutputFallback {
    uint public numero;
    address public remitente;
    uint public weis;
    
    address immutable contrato;

    constructor(address _contrato) {
       contrato  = _contrato;
    }
    

    fallback(bytes calldata req )external payable returns(bytes memory) {
        (bool ok, bytes memory res) = contrato.delegatecall(req);
        require(ok, "delegateCall Fail");
        return res;
    }

    receive()external payable{

    }

}



contract delegate_to_inputOutputFallback {
    uint public numero;
    address public remitente;
    uint public weis;
    bytes public firma;

    function delegateGet(address contrato, uint _numero) payable public returns(bytes memory) {
        firma = abi.encodeWithSelector(main.get.selector, _numero);
        (bool ok, bytes memory res) = contrato.delegatecall(firma);
        require(ok, "delegateCall Fail");
        return res;
    }

}
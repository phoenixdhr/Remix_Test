// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0;


interface IERC20 {
    function transfer(address, uint256) external;
}

contract Token {
    function transfer(address, uint256) external {}
}


contract AbiEncodedCall {

    function sendData(address _contract, bytes calldata data) external returns(bool,bytes memory) {
        
        (bool ok, bytes memory res) =_contract.call(data);   
        require(ok, "call failed");

        return (ok, res);
    }

    function encodeWithSignature(address to, uint amount)  external pure returns (bytes memory){
        bytes memory data = abi.encodeWithSignature("transfer(address,uint256)",to, amount);
        //el primer item admite error de tipeo y el compilador continuara compilando
        return data;
    }

    function encodeWithSelector(address to, uint amount)  external pure returns (bytes memory){
        bytes memory data = abi.encodeWithSelector(IERC20.transfer.selector, to, amount);
        // el primer item no admite errores de tipeo, pero se puede omitir el "to" o el "amount" y el programa continuará compilando
        return data;    
    }

    function encodeCall (address to, uint amount)external pure returns(bytes memory){
        bytes memory data = abi.encodeCall(IERC20.transfer, (to, amount));
        return data;

    }




}
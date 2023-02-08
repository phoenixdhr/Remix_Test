// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.10;

contract Helper {

    function selectorFun1(uint x, uint y)  public pure returns (bytes memory) {
        bytes memory selector1 = abi.encodeWithSelector(Main.fun1.selector,x,y);
        return selector1;
    }

    function selectorFun2()  public pure returns (bytes memory) {
        bytes memory selector2 = abi.encodeWithSelector(Main.fun2.selector);
        return selector2;
    }
}


contract Delegate_Itselft {


    function delegate( bytes[] calldata selectores ) public returns (bytes[] memory) {
        
        bytes[] memory resultados=new bytes[](selectores.length);
        for (uint i = 0; i < selectores.length; i++) {
            (bool ok, bytes memory res) = address(this).delegatecall(selectores[i]);
            require(ok, "call failed");
            resultados[i]=res;

        }

        return resultados;
    }



}


contract Main is Delegate_Itselft{
    
    event fun(uint number, string strin, address caller );
    
    function fun1(uint x, uint y) public  {
        emit fun(x+y, "chi", msg.sender);
    }

    function fun2( ) public  {
        emit fun(2, "no",msg.sender);
    }
}
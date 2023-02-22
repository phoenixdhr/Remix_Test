// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.10;

// Contrato que realiza un CALL a una funcion del contrato RECEPTOR
contract callFunction {

    function callF(address _to, uint _x) public  returns (bool, bytes memory) {

        bytes memory data = abi.encodeCall(RECEPTOR.set,(_x));
        (bool ok, bytes memory res) = _to.call(data);
        return (ok, res);
    }

}



// Funcion que rea
contract RECEPTOR {    
    uint  x;

    function get() public view returns (uint) {
        return x;        
    }

    function set(uint _x) public {
        x=_x;
    }
}
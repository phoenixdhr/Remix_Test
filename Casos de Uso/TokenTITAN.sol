// SPDX-License-Identifier: MIT
pragma solidity  >=0.7.0  <=0.9.0 ;

contract TokenTITAN {

    string public name;
    string public simbolo;
    uint public   totalSupply;

    mapping (address=>uint) balance;
    mapping (address=>mapping (address=>uint)) allowed;

    constructor(uint _totalSupply) {
        name="Titan200";
        simbolo="TTN";
        totalSupply=_totalSupply;
        balance[msg.sender]=_totalSupply;
    }

    function decimals() public pure returns (uint8) {
        return 2;
    }

    function getTotalSupply() public view returns (uint)  {
        return totalSupply;
    }

    function balanceOf(address walletUser) public view returns (uint) {
        return balance[walletUser];
    }

        event trasfetencia1(string menssage, uint value);

    function transfer(address _to, uint _value) public returns (bool success) {
        require(balance[msg.sender]>=   _value, "fondos insuficientes");
        balance[_to]=balance[_to]+_value;
        balance[msg.sender]=balance[msg.sender]-_value;
        emit trasfetencia1("se tranfirio tokens TTN", _value);
        success =true;
    }


        event aprove1(address _to, uint _value, string message);

    function aprove(address _to, uint _value) public returns (bool success) {
        allowed[msg.sender][_to]=_value;
        emit  aprove1( _to,  _value,  "Se asignaron token a otra wallet");
        success=true;
    }

    function Allowance(address _owner, address _spender) view public returns (uint) {
        return  allowed[_owner][_spender];
    }


        event transferFrom1(address _from, address _to, uint _value, string message);

    function transferFrom(address _from, address _to, uint _value) public  returns (bool success){
        require(_value <= balance[_from], "fondos insuficientes");
        require(_value <=allowed[_from][msg.sender], "fondos asignados insuficientes");
        

        allowed[_from][msg.sender] = allowed[_from][msg.sender]-_value;
        balance[_from] = balance[_from] - _value;
        balance[_to] = balance[_to] + _value;

        emit transferFrom1(_from, _to, _value, "un man transfirio tus tokens");
        success=true;
    }

}
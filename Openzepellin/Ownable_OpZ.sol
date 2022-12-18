// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >=0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/AccessControl.sol";

contract Ownable_OpZ is AccessControl{

bytes32 public constant WRITER_ROL = keccak256("WRITER_ROL");
bytes32 public constant PRUEBA2_ROL = keccak256("PRUEBA2_ROL");



constructor () {
    _grantRole(DEFAULT_ADMIN_ROLE,msg.sender);

}


function soloAdmin(uint a , uint b) public view onlyRole(DEFAULT_ADMIN_ROLE) returns (uint) {
    
    return a+b;

}


function soloWriter (uint a, uint b) public view onlyRole(WRITER_ROL) returns(uint) {

    return a*b;
}


}
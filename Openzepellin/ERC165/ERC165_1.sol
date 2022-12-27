// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "@openzeppelin/contracts/utils/introspection/ERC165.sol";



interface Inumber{
    function set(uint _num)   external  ;
    function get()  external view  returns(uint);
}



contract getnumber is Inumber, ERC165{

    uint num;

    function set(uint _num)   external  {
        num=_num+2;
    }
    

    function get()  external view  returns(uint){
        return num;
    }


    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool){
        return  interfaceId == type(IERC165).interfaceId ||
                interfaceId == type(Inumber).interfaceId || 
                super.supportsInterface(interfaceId);
          
    }

    function b4In() public pure returns(bytes4){
        return type(Inumber).interfaceId;
    }

}

// Identificador de la interface Inumber = 0x0db2a18d
// Identificador de la interface IERC165 = 0x01ffc9a7

// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >=0.8.0;

contract Box {

    uint num;

    function getNum() public view returns (uint) {
        return num;
    }


    function setNum(uint _num) public {
        num=_num;
    }


}

// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >=0.8.0;




contract box {

    uint num;

    function getNum() public view returns (uint) {
        return num;
    }


    function setnum(uint _num) public {
        num=_num;
    }



}

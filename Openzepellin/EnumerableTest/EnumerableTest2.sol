//SPDX-License-Identifier: GPL-3.0;
pragma solidity >0.8.0;
import "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";


//SIN USAR USING FOR

contract EnumerableSet_test2 {

    EnumerableSet.UintSet set;

function add_(uint256 value) public returns(bool) {
    return EnumerableSet.add(set,value);
}


function remove_(uint256 value) public returns(bool) {
    return EnumerableSet.remove(set,value);
}


function contains_(uint256 value) view public returns(bool) {
    return EnumerableSet.contains(set,value);
}


function length_() view public returns(uint) {
    return EnumerableSet.length(set);
}   


function at_(uint256 index) view public returns(uint) {
    return EnumerableSet.at(set,index);    
}


function values_() view public returns( uint[] memory) {
    return EnumerableSet.values(set);
}


}

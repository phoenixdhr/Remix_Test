
//SPDX-License-Identifier: GPL-3.0;
pragma solidity >0.8.0;
import "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

contract EnumerableSet_test1 {

//USING FOR
    using EnumerableSet for EnumerableSet.UintSet;
    EnumerableSet.UintSet  set;

function add_(uint256 value) public returns(bool) {
    return set.add(value);
}


function remove_(uint256 value) public returns(bool) {
    return set.remove(value);
}


function contains_(uint256 value) view public returns(bool) {
    return set.contains(value);
}


function length_() view public returns(uint) {
    return set.length();
}   


function at_(uint256 index) view public returns(uint) {
    return set.at(index);    
}


function values_() view public returns( uint[] memory) {
    return set.values();
}

}


//SPDX-License-Identifier: GPL-3.0;
pragma solidity >0.8.0;

import "@openzeppelin/contracts/utils/structs/EnumerableMap.sol";

contract EnumMapTest {

    using EnumerableMap for EnumerableMap.UintToAddressMap;
    EnumerableMap.UintToAddressMap private myMap;

    function set_(uint256 key, address value) public returns (bool){
        
        return myMap.set(key,value);
    }

    function remove_(uint256 key) public returns (bool){

        return myMap.remove(key);
    }


    function contains_(uint256 key) public view returns (bool){

        return myMap.contains(key);
    }


    function length_() public view returns (uint256){

        return myMap.length();
    }


    function at_(uint256 index) public view returns (uint, address){

        return myMap.at(index);
    }


    function tryGet_(uint256 key) public view returns (bool, address){

        return myMap.tryGet(key);
    }


    function get_(uint256 key) public view returns (address){

        return myMap.get(key);
    }


}
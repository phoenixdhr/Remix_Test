// SPDX-License-Identifier: MIT

pragma solidity >0.8.0;

interface Solidity101 {
    function hello() external pure;
    function world(int) external pure;
}

interface ERC165 {
    /// @notice Query if a contract implements an interface
    /// @param interfaceID The interface identifier, as specified in ERC-165
    /// @dev Interface identification is specified in ERC-165. This function
    ///  uses less than 30,000 gas.
    /// @return `true` if the contract implements `interfaceID` and
    ///  `interfaceID` is not 0xffffffff, `false` otherwise
    function supportsInterface(bytes4 interfaceID) external view returns (bool);
}




contract Selector {
    function calculateSelector1() public pure returns (bytes4) {
        Solidity101 i;
        return i.hello.selector ^ i.world.selector;
    }

    function calculateSelector2() public pure returns (bytes4) {
        ERC165 i;
        return i.supportsInterface.selector;
    }

    function type1() public pure returns (bytes4){
        return type(Solidity101).interfaceId;
    }

    function type2() public pure returns (bytes4){
        return type(ERC165).interfaceId;
    }


    function calKecck2 () public pure returns (bytes4){
        return bytes4(keccak256('supportsInterface(bytes4)'));
    }


}

// calculateSelector1() = type1() = 0xc6be8b58
// calculateSelector2() = type2() = calKecck2() = 0x01ffc9a7


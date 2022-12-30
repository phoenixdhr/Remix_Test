// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0;

import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

contract VERI_ECDSA{

function verifyF (bytes32  hash, bytes memory signature) public pure returns(address){
    return ECDSA.recover(hash,  signature);
    
    }

function hash1 (string memory menssagex) public pure returns (bytes32){
    return keccak256(abi.encodePacked(menssagex));

}


function hash2 (bytes32 hash) public pure returns (bytes32){
    return ECDSA.toEthSignedMessageHash(hash);
}

}
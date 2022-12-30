// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0;

import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

contract MerkleProof2 {


    bytes32 root;
    constructor(bytes32 _root){
        root=_root;
    }

    //address whitelist claimed
    mapping (address => bool) whitelistClaimed;

    //la funcion solo verifica el MerkleTree del cual "root" es la Raiz del arbol
    function claim (bytes32[] memory _proof) public  {
        require(!whitelistClaimed[msg.sender],"Ya Claimeaste");
        bytes32 leaf = keccak256(abi.encodePacked(msg.sender));
        require(MerkleProof.verify(_proof,root,leaf), "No estas en la whitelist");
        whitelistClaimed[msg.sender]=true;
    }

    // funcion que verifica cualquier merkleproof
    function verify (bytes32[] memory _proof, bytes32 _root, bytes32 _leaf) public pure returns (bool) {
        return MerkleProof.verify( _proof,  _root,  _leaf);
    }



}


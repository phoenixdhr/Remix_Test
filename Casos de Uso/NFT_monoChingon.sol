
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0  <=0.9.0 ;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFt_monoChingon is ERC721, Ownable {

    Counters.Counter _tokenID;

    constructor() ERC721("MonoChingon", "MNC")  { }


    function _baseURI() internal pure override  returns (string memory) {
        return "https://ipfs.io/ipfs/QmeSjSinHpPnmXmspMjwiXyN6zS4E9zccariGR3jxcaWtq/";
    }


    function mintear (address to ) onlyOwner public  {

        uint256 newTokenId = Counters.current(_tokenID);

        _safeMint(to, newTokenId);
        Counters.increment(_tokenID);

      
    }






    
}
// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;


import "@openzeppelin/contracts/utils/introspection/ERC165Checker.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Implementacion_ERC165Checker  { 

    using ERC165Checker for address;

    function esIERC20 (address account) public view returns (bool) {

        bytes4 ID = type(IERC20).interfaceId;
        return account.supportsInterface(ID); 

    }

    function esIERC721 (address account) public view returns (bool) {

        bytes4 ID = type(IERC721).interfaceId;
        return account.supportsInterface(ID);

    }
}

///////////////////////////////////
//Contrato ERC20, Por defecto los token ERC20 NO TIENE IMPLEMENTADO EL ERC165, POR LO QUE DARA FALSE A LA FUNCION esIERC20

contract MyERC20 is ERC20 {
    constructor() ERC20("MyToken", "MTK") {
        _mint(msg.sender, 1000 * 10 ** decimals());
    }
}



//////////////////////////////////
//Contrato ERC721, Por defecto los token ERC721 TIENEN IMPLMENTADO EL ERC165, POR LO QUE DARA VERDADERO A LA FUNCION esIERC721

contract MyERC721 is ERC721, Ownable {
    constructor() ERC721("MyToken", "MTK") {}

    function _baseURI() internal pure override returns (string memory) {
        return "cdcd";
    }

    function safeMint(address to, uint256 tokenId) public onlyOwner {
        _safeMint(to, tokenId);
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract TokenTNT is ERC1155 {

    uint Fungible_TNT_1 = 0;
    uint NFT_1 = 1;
    uint Fungible_TNT_2 = 2;
    uint NFT_2 = 3;

    constructor(
 

    ) ERC1155("www.pepelucho.som") {
        _mint(msg.sender, Fungible_TNT_1, 1000, "");
        _mint(msg.sender, NFT_1, 1,"");
        _mint(msg.sender, Fungible_TNT_2, 2000,"");
        _mint(msg.sender, NFT_2, 1, "");

    }

    function mint(uint id, uint monto, bytes memory by) public {
        _mint(msg.sender,id, monto,by);
    }



}
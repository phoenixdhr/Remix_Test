// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


import "@openzeppelin/contracts/governance/TimelockController.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ControlTiempo is TimelockController, ERC20 {

    bytes32 public constant MODERATOR_ROLE = keccak256("MODERATOR_ROLE");

    mapping (address => bool) public bannedUsers;


    //proposers y executors se deben ingresar con corchetes y las direcciones entre comillas, PE
    // ["0x5B38Da6a701c568545dCfcB03FcB8    75f56beddC4", "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4"]
    constructor(
        uint256 minDelay,
        address[] memory proposers,
        address[] memory executors,
        address admin

    ) TimelockController(minDelay, proposers, executors, admin) ERC20("MyToken", "MTK") {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _mint(msg.sender,1000);

    }


}
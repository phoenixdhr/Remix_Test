// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract TokenBurnPausable is ERC20, ERC20Burnable, Pausable, Ownable {
    
    constructor() ERC20("MyToken", "MTK") {
        _mint(msg.sender,1000000*10**18);
    }

    function burn(uint256 amount) public override {
        _burn(_msgSender(), amount);
    }

    function pause() public onlyOwner {
        _pause();
    }



    function unpause()  public onlyOwner {
        _unpause();
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
        ) internal virtual override {
        
        super._beforeTokenTransfer(from, to, amount);
        require(!paused(), "ERC20Pausable: token transfer while paused");
        }

}


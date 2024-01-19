// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC721A} from "lib/ERC721A/contracts/ERC721A.sol";

/**
 * ERC721A 合約改進了鑄造複數個 NFT 時的費用，但轉移時費用較 ERC721 高
 */
contract ERC721ADemo is ERC721A {
    constructor(string memory _name, string memory _symbol) ERC721A(_name, _symbol) {}

    function mint(uint256 _amount) external payable {
        _mint(msg.sender, _amount);
    }
}

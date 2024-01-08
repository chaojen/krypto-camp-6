// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {ERC721} from "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract NFT is ERC721 {
    uint256 public totalSupply = 100;
    
    constructor() ERC721("SoulBoundToken", "NFT") {}

    function mint(address to, uint256 tokenId) public {
        require(tokenId <= totalSupply, "NFT: tokenId is out of range");
        _safeMint(to, tokenId);
    }
}
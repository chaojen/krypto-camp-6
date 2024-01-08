// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {ERC721} from "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "lib/openzeppelin-contracts/contracts/access/Ownable.sol";

/**
 * 2. 發行總量10張的SBT。
 */
contract SBT is ERC721 {
    uint256 private totalSupply = 10;
    
    constructor() ERC721("SBT", "SBT") {}

    function mint(address _to, uint256 _tokenId) external {
        require(_tokenId <= totalSupply, "NFT: tokenId is out of range");
        _mint(_to, _tokenId);
    }
    
    function transferFrom(address from, address to, uint256 tokenId) public override {
        revert("Token transfer is not allowed");
    }
}
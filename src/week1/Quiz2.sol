// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

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

    function transferFrom(address, address, uint256) public pure override {
        revert("Token transfer is not allowed");
    }
}

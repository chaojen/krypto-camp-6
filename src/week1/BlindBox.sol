// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
import {Counters} from "src/utils/Counters.sol";

/**
 * 盲盒 NFT
 *
 * 盲盒在一開始鑄造時 URI 導向預設內容，由 Owner 觸發解盲後判斷導向最終 URI。
 */
contract BlindBox is ERC721, Ownable {
    modifier availableMint(uint256 _amount) {
        require(counter.current() + _amount <= totalSupply, "Sold Out");
        _;
    }

    using Strings for uint256;
    using Counters for Counters.Counter;

    uint256 public totalSupply = 4;
    Counters.Counter public counter;
    
    bool private isOpened;

    constructor(address _owner) ERC721("BlindBox", "BlindBox") Ownable(_owner) {}

    function openBlindBox() external onlyOwner {
        isOpened = true;
    }

    function mint(uint256 _amount) external availableMint(_amount) {
        for (uint256 i = 0; i < _amount; i++) {
            _mint(msg.sender, counter.current());
            counter.increment();
        }
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        if (!isOpened) {
            return _baseURI();
        }
        return string(
            abi.encodePacked("ipfs://QmZZVe1UmymfN6y7r1Unq6WW3esLwV2z64cSLSRvrebZkP/", tokenId.toString(), ".json")
        );
    }

    /**
     * 盲盒 URI
     */
    function _baseURI() internal view virtual override returns (string memory) {
        return "ipfs://QmXxZBg4RnGxC2dDxfUSAmxgGooHsoncPQgCLiNw8kj3Ls/";
    }
}

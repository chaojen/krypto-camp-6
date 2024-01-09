// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {ERC721} from "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "lib/openzeppelin-contracts/contracts/access/Ownable.sol";
import {Strings} from "lib/openzeppelin-contracts/contracts/utils/Strings.sol";

contract BlindBox is ERC721, Ownable {
    using Strings for uint256;

    bool private isblindBoxOpened = false;
    string private blindTokenURI = "ipfs://blindtoken/";
    string private baseURI = "ipfs://baseuri/";

    constructor(address initialOwner) ERC721("BlindBox", "BlindBox") Ownable(initialOwner) {}

    function isBlindBoxOpened() internal view returns (bool) {
        return isblindBoxOpened;
    }

    function setBlindBoxOpened(bool _isOpened) public onlyOwner {
        isblindBoxOpened = _isOpened;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return baseURI;
    }

    /**
     * 取得 NFT 資料源 URI
     */
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
        
        if (!isblindBoxOpened) {
            return blindTokenURI;
        }

        return bytes(_baseURI()).length > 0 ? string(abi.encodePacked(_baseURI(), tokenId.toString(), ".json")) : "";
    }

    /**
     * 判斷 tokenId 存在
     */
    function _exists(uint256) private pure returns (bool) {
        return true;
    }
}
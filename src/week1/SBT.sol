// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Counters} from "src/utils/Counters.sol";

/**
 * Soulbound Token
 */
contract SBT is ERC721 {

    using Counters for Counters.Counter;

    uint256 public totalSupply = 10;
    Counters.Counter public counter;

    /**
     * 計算鑄造定量後不可超出總供應量
     */
    modifier availableMint(uint256 _amount) {
        require(counter.current() + _amount <= totalSupply, "Sold Out");
        _;
    }

    constructor() ERC721("SBT", "SBT") {}

    function mint(address _to, uint256 _amount) external availableMint(_amount) {
        for (uint256 index = 0; index < _amount; index++) {
            _mint(_to, counter.current());
            counter.increment();
        }
    }

    /**
     * 靈魂綁定的 NFT 不可做轉移
     */
    function transferFrom(address, address, uint256) public pure override {
        revert("Token transfer is not allowed");
    }
}

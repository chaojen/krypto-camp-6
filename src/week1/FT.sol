// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * 1. 發行總量100億顆、位數18的代幣！
 */
contract FT is ERC20 {
    constructor() ERC20("FT", "FT") {
        _mint(msg.sender, 10000000000 * (10 ** decimals()));
    }
}

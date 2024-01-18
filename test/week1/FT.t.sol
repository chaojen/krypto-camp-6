// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/week1/FT.sol";

contract FTTest is Test {
    FT ft;

    function setUp() external {
        ft = new FT();
    }

    function testTotalSupplyAndDecimals() external {
        assertEq(ft.totalSupply(), 10000000000_000000000000000000);
        assertEq(ft.decimals(), 18);
    }
}

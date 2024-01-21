// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BlockRandom {
    function next() public view returns (uint256 random) {
        random = uint256(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp)));
    }
}

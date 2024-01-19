// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/**
 * 3. 開發猜數字的合約(一個人設定，大家猜，有人猜中，就結束不讓其他人猜了)
 */
contract GuessNumber is Ownable {
    uint256 public gameCounter;
    uint256 public upper;
    uint256 public lower;
    mapping(uint256 => address) public winners;
    mapping(address => uint256) public challengers;

    uint256 private number;

    constructor(uint256 _number, uint256 _upper, uint256 _lower) Ownable(msg.sender) {
        nextGame(_number, _upper, _lower);
    }

    function nextGame(uint256 _number, uint256 _upper, uint256 _lower) public onlyOwner {
        require(_number < _upper && _number > _lower, "invalid numbers");

        gameCounter++;
        number = _number;
        upper = _upper;
        lower = _lower;
    }

    function guess(uint256 _number) external returns (bool isWin) {
        require(winners[gameCounter] == address(0), "game over");
        require(challengers[msg.sender] != gameCounter, "already guess");
        require(_number < upper && _number > lower, "out of bounds");

        challengers[msg.sender] = gameCounter;
        isWin = number == _number;

        if (isWin) {
            winners[gameCounter] = msg.sender;
        } else if (_number > number) {
            upper = _number;
        } else {
            lower = _number;
        }
    }
}

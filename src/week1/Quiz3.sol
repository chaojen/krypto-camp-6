// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/**
 * 3. 開發猜數字的合約(一個人設定，大家猜，有人猜中，就結束不讓其他人猜了)
 */
interface GuessNumber {
    function setNumber(uint256 number) external;
    function guess(uint256 number) external returns (bool);
}

contract GuessNumberImpl is GuessNumber {
    uint256 private number;
    bool private allowGuess;

    function setNumber(uint256 _number) external override {
        number = _number;
        allowGuess = true;
    }

    function guess(uint256 _number) external override returns (bool) {
        require(allowGuess, "Game Over");

        if (number == _number) {
            allowGuess = false;
            return true;
        }

        return false;
    }
}

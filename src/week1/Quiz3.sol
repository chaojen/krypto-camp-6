// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/**
 * 3. 開發猜數字的合約(一個人設定，大家猜，有人猜中，就結束不讓其他人猜了)
 */
interface GuessNumber {
    function setNumber(int number) external;
    function guess(int number) external returns (bool);
}

contract GuessNumberImpl is GuessNumber {
    int private number;
    bool private allowGuess;

    function setNumber(int _number) external override {
        number = _number;
        allowGuess = true;
    }

    function guess(int _number) external override returns (bool) {
        require(allowGuess, "Game Over");

        if (number == _number) {
            allowGuess = false;
            return true;
        }
        
        return false;
    }
}
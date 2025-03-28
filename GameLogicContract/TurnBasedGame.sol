// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TurnBasedGame {
    address public player1;
    address public player2;
    uint8 public turn; // 1 or 2

    function joinGame() external {
        require(player1 == address(0) || player2 == address(0), "Game full");
        if (player1 == address(0)) player1 = msg.sender;
        else player2 = msg.sender;
    }

    function makeMove(uint8 move) external {
        require(msg.sender == (turn == 1 ? player1 : player2), "Not your turn");
        // validate move logic
        turn = turn == 1 ? 2 : 1;
    }
}

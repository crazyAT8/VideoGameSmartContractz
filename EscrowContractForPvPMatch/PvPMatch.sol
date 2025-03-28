// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PvPMatch {
    address public player1;
    address public player2;
    uint256 public bet;
    bool public matchStarted;

    constructor(address _player1, address _player2) payable {
        require(msg.value > 0, "Bet required");
        player1 = _player1;
        player2 = _player2;
        bet = msg.value;
    }

    function joinMatch() external payable {
        require(msg.sender == player2, "Only player2 can join");
        require(msg.value == bet, "Incorrect bet amount");
        matchStarted = true;
    }

    function declareWinner(address winner) external {
        require(msg.sender == player1 || msg.sender == player2, "Unauthorized");
        require(matchStarted, "Match not started");
        payable(winner).transfer(address(this).balance);
        matchStarted = false;
    }
}

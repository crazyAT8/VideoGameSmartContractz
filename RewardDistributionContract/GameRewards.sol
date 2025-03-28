// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GameRewards {
    mapping(address => uint256) public points;

    function completeQuest(address player) external {
        points[player] += 100;
    }

    function claimRewards() external {
        uint256 reward = points[msg.sender];
        require(reward > 0, "No rewards");
        points[msg.sender] = 0;
        // Transfer token or ETH in production
    }
}

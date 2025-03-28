// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StakeGameToken {
    mapping(address => uint256) public staked;
    mapping(address => uint256) public lastTime;

    function stake() external payable {
        staked[msg.sender] += msg.value;
        lastTime[msg.sender] = block.timestamp;
    }

    function unstake() external {
        uint256 amount = staked[msg.sender];
        uint256 reward = (block.timestamp - lastTime[msg.sender]) * 1e15;
        staked[msg.sender] = 0;
        payable(msg.sender).transfer(amount + reward);
    }
}

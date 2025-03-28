// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GameGovernance {
    mapping(address => uint256) public votes;
    string[] public proposals;

    function propose(string calldata proposal) external {
        proposals.push(proposal);
    }

    function vote(uint256 proposalIndex) external {
        votes[msg.sender] = proposalIndex;
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract GameItem is ERC721 {
    uint256 public nextId;

    constructor() ERC721("GameItem", "GMI") {}

    function mintItem() external {
        _mint(msg.sender, nextId++);
    }
}

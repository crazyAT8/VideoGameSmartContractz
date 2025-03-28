// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IGameItem {
    function transferFrom(address from, address to, uint256 tokenId) external;
}

contract GameMarketplace {
    struct Listing {
        address seller;
        uint256 price;
    }

    IGameItem public gameItem;
    mapping(uint256 => Listing) public listings;

    constructor(address _gameItem) {
        gameItem = IGameItem(_gameItem);
    }

    function listItem(uint256 tokenId, uint256 price) external {
        listings[tokenId] = Listing(msg.sender, price);
    }

    function buyItem(uint256 tokenId) external payable {
        Listing memory listing = listings[tokenId];
        require(msg.value >= listing.price, "Not enough ETH");

        gameItem.transferFrom(listing.seller, msg.sender, tokenId);
        payable(listing.seller).transfer(msg.value);

        delete listings[tokenId];
    }
}

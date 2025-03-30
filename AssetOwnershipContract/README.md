##  1. Asset Ownership Contract (ERC-721 NFT)

### File: GameItem.sol

This contract lets players mint unique in-game items (like weapons or skins) as NFTs. Each item has a unique tokenId and belongs to the player’s address.

- Inherits from OpenZeppelin’s ERC721.

- mintItem() mints a new NFT to the caller.

- nextId keeps track of the next token to be issued.
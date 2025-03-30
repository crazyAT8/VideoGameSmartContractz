## 2. Marketplace Contract

### File: GameMarketplace.sol

Players can list their in-game NFTs for sale and others can buy them using ETH.

- Connects to the NFT contract via interface.

- listItem() sets the price and owner of an NFT.

- buyItem() transfers the NFT and pays the seller.
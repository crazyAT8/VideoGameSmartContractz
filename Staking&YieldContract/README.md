## 6. Staking & Yield Contract

### File: StakeGameToken.sol

Players stake ETH and earn passive yield based on how long they’ve staked.

- stake() locks up ETH and timestamps the stake.
- unstake() releases the original ETH plus a reward based on time.
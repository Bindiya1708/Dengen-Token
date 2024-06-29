# DegenToken

**DegenToken** is an ERC20 token smart contract deployed on Avalanche Fuji C-Chain, created using Solidity.

## Description

The `DegenToken` contract implements functionalities for minting tokens, redeeming tokens with notes, and burning tokens. It inherits from OpenZeppelin's ERC20 implementation and includes an ownership model.

## Features

- **ERC20 Compliance**: Implements standard ERC20 token functionalities.
- **Ownership**: Restricts minting to the contract owner.
- **Minting**: Allows the owner to mint new tokens.
- **Redeeming**: Enables token holders to redeem tokens with additional notes.
- **Burning**: Allows token holders to burn their tokens.

## Prerequisites

- [Remix IDE](https://remix.ethereum.org/) for Solidity smart contract development and deployment.
- MetaMask with Avalanche Network setup for transaction signing and interaction.
- Snowtrace API key for contract verification on the Avalanche network.

## Deployment using Remix IDE

1. **Open Remix IDE**:
   - Visit [Remix IDE](https://remix.ethereum.org/).
   - Select the appropriate environment (e.g., Solidity compiler version).

2. **Compile and Deploy**:
   - Copy and paste the `DegenToken.sol` contract code into Remix.
   - Compile the contract and fix any compilation errors.
   - Select `Injected Web3` environment and connect to your MetaMask with Avalanche Fuji C-Chain.

3. **Deploy the Contract**:
   - Deploy the contract using Remix by specifying the constructor parameters (if any).
   - Confirm the transaction in MetaMask.

4. **Verify the Contract using Snowtrace**:
   - Navigate to [Snowtrace](https://snowtrace.io/) and paste your deployed contract address.

## Interacting with the Contract

- **Using MetaMask**: Manage tokens and execute contract functions directly through MetaMask connected to Avalanche Fuji C-Chain.
- **Remix IDE**: Continue development and debugging directly in Remix IDE.
- **Snowtrace Verification**: Ensure contract authenticity and ownership verification using Snowtrace.

## Additional Notes


## Solidity Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DegenToken is ERC20 {
    address public owner;

    event TokensRedeemed(address indexed user, uint256 amount, string note);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    constructor() ERC20("Degen", "DGN") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
        owner = msg.sender;
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    function redeem(uint256 amount, string calldata note) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance to redeem");
        _burn(msg.sender, amount);
        emit TokensRedeemed(msg.sender, amount, note);
        // Implement additional redemption logic here, e.g., rewarding in-game items
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }
}
```
## LICENSE
This project is licensed under the MIT License - see the LICENSE file for details

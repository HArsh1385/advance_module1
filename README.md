### DeFi Empire: A Simple DeFi Kingdom Clone

**Project Overview:**  
This is the first project of the Metacrafters Avax Advanced Module, where you will set up a custom EVM subnet on the Avalanche network to create a DeFi Kingdom clone.

### Subnet Setup Guide

**1. Set up Your EVM Subnet:**  
Follow the [Avalanche documentation](https://docs.avax.network/) and our guide to create a custom EVM subnet. This subnet will serve as the foundation for your in-game economy.

**2. Define Your Native Currency:**  
Customize your native currency to be used as the in-game currency within your DeFi Kingdom clone.

**3. Connect to MetaMask:**  
After setting up the subnet, connect it to MetaMask by following the provided steps.

**4. Deploy Game Contracts:**  
Using Solidity and Remix, deploy the essential smart contracts that define game mechanics like battling, exploring, and trading. These contracts will manage liquidity pools, tokens, and other game elements.

### Number Guessing Game with Token Rewards

This project also implements a simple number guessing game on the Avalanche subnet EVM using Solidity. Players guess a number between 1 and 10, earning token rewards for correct guesses or incurring penalties for incorrect attempts.

---

### Steps to Create Your Own Subnet EVM on Avalanche

**1. Install Avalanche CLI:**  
Avalanche CLI is available for macOS and Linux. Windows users can use WSL to install Ubuntu and follow the [official installation instructions](https://docs.avax.network/).

**2. Create a New Subnet:**  
Run the command `avalanche subnet create mySubnet` to create a new subnet on your local machine.

**3. Configure Your Subnet:**  
- **Chain ID:** Any positive integer (e.g., 27031).
- **Token Symbol:** Define your subnet's native token (e.g., TEST).
- **Gas Settings:** Choose between high and low throughput.
- **Airdrop:** Configure token distribution (optional).

**4. Deploy the Subnet:**  
Deploy your EVM subnet locally using `avalanche subnet deploy mySubnet`.

**5. Connect to MetaMask:**  
After deploying your subnet, use the connection details provided by the Avalanche CLI to add your subnet to MetaMask.

### Contracts

**1. `GameToken.sol`:**  
Defines an ERC-20-like token, "The NumWarrior" (TNWR), with basic functionalities like minting and transferring tokens.

**2. `NumberGuessingGame.sol`:**  
Implements the game logic using the `GameToken` contract.

### Usage

**1. Deploy Contracts:**
   - Deploy `GameToken.sol` first to obtain the token address.
   - Deploy `NumberGuessingGame.sol` using the token address.

**2. Interact with the Game:**
   - Players can guess the secret number.
   - The admin can generate new secret numbers or reset attempts.

### Events

- **`Guess:`** Emitted on each guess attempt.
- **`Reward:`** Emitted when a player guesses correctly.
- **`Penalty:`** Emitted when a player fails after three attempts.

### Requirements

- Solidity ^0.8.17
- Truffle or Remix for deployment and testing
- MetaMask for interaction

### License

This project is licensed under the MIT License. See the LICENSE file for more details.

**Developer**  
**Name:** Naman Kumar Sinha
**GitHub:** https://github.com/naman221462

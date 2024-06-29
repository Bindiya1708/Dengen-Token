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
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }
}
 


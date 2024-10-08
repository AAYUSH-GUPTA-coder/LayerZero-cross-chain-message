// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Script.sol";
import {SourceOApp} from "../src/SourceOApp.sol"; // Adjust this path to where your contract is located

contract DeploySourceOApp is Script {
    // Define the endpoint address and owner address here
    address public constant endpoint = 0x6EDCE65403992e310A62460808c4b910D972f10f; // LayerZero endpoint address
    address public constant owner = 0x8680c6Ad2c2D13EeD71F22b856b2EE158A299C09; // owner’s address

    function run() external {
        // Get the deployer's private key
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        // Start broadcasting the transaction
        vm.startBroadcast(deployerPrivateKey);

        // Deploy the contract
        SourceOApp sourceOApp = new SourceOApp(endpoint, owner);

        // Log the deployed contract address
        console.log("SourceOApp contract ARB SEPOLIA CHAIN deployed at:", address(sourceOApp));

        // End the broadcast
        vm.stopBroadcast();
    }
}

// arb sepolia endpoint : 0x6EDCE65403992e310A62460808c4b910D972f10f
// Arb sepolia : 40231

// deployed address : 0x8dd1414EA59D6a7c64167f9F403df5F49C20538F

// forge script script/DeploySourceOApp.s.sol:DeploySourceOApp --rpc-url $ARBITRUM_SEPOLIA_RPC_URL --broadcast -vvvv

// forge script script/DeploySourceOApp.s.sol:DeploySourceOApp --rpc-url $ARBITRUM_SEPOLIA_RPC_URL --etherscan-api-key $ARBISCAN_API_KEY --chain 42162 --broadcast --verify -vvvv
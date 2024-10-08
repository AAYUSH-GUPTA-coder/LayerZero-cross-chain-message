// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Script.sol";
import {DestinationOApp} from "../src/DestinationOApp.sol";  

contract DeployDestinationOApp is Script {
    // Define the LayerZero endpoint address and owner address
    address public constant endpoint = 0x6EDCE65403992e310A62460808c4b910D972f10f; // OP Sepolia LayerZero endpoint address
    address public constant owner = 0x8680c6Ad2c2D13EeD71F22b856b2EE158A299C09; // owner's address

    function run() external {
        // Get the deployer's private key from environment variables
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        // Start broadcasting the transaction
        vm.startBroadcast(deployerPrivateKey);

        // Deploy the DestinationOApp contract
        DestinationOApp destinationOApp = new DestinationOApp(endpoint, owner);

        // Log the deployed contract address
        console.log("DestinationOApp contract OP SEPOLIA CHAIN deployed at:", address(destinationOApp));

        // End the broadcast after deploying the contract
        vm.stopBroadcast();
    }
}

// op sepolia endpoint: 0x6EDCE65403992e310A62460808c4b910D972f10f
// op sepolia : 40232
// Op sepolia Contract address : 0x8dd1414EA59D6a7c64167f9F403df5F49C20538F

// forge script script/DeployDestinationOApp.s.sol:DeployDestinationOApp --rpc-url $OPTIMISM_SEPOLIA_RPC_URL --broadcast -vvvv

// forge script script/DeployDestinationOApp.s.sol:DeployDestinationOApp --rpc-url $OPTIMISM_SEPOLIA_RPC_URL --etherscan-api-key $OPTIMISM_API_KEY --chain 11155420 --broadcast --verify -vvvv
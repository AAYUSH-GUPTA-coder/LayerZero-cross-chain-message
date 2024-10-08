// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Script.sol";
import {Test} from "../src/test.sol";

contract DeployTest is Script {

    function run() external {
        // Get the deployer's private key from environment variables
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        // Start broadcasting the transaction
        vm.startBroadcast(deployerPrivateKey);

        // Deploy the DestinationOApp contract
        Test test = new Test();

        // Log the deployed contract address
        console.log("DestinationOApp contract OP SEPOLIA CHAIN deployed at:", address(test));

        // End the broadcast after deploying the contract
        vm.stopBroadcast();
    }
}

// op sepolia endpoint: 0x6EDCE65403992e310A62460808c4b910D972f10f
// op sepolia : 40232
// Op sepolia Contract address : 0x8dd1414EA59D6a7c64167f9F403df5F49C20538F

// forge script script/DeployDestinationOApp.s.sol:DeployDestinationOApp --rpc-url $OPTIMISM_SEPOLIA_RPC_URL --broadcast -vvvv

// forge script script/DeployTest.s.sol:DeployTest --rpc-url $OPTIMISM_SEPOLIA_RPC_URL --etherscan-api-key $OPTIMISM_API_KEY --chain 11155420 --broadcast --verify -vvvv
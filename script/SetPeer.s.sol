// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

// import {OApp} from "@layerzerolabs/oapp-evm/contracts/oapp/OApp.sol";
import {Script} from "forge-std/Script.sol";
import {SourceOApp} from "../src/SourceOApp.sol";
// import {DestinationPoolLZ} from "../../src/layerzero/DestinationPoolLZ.sol";

contract SetPeer is Script {
    // The real endpoint ids will vary per chain, and can be found under "Supported Chains"
    uint32 public arbitrumSepoliaEid = 40231;
    uint32 public optimismSepoliaEid = 40232;

    function run() external {
        address ARBITRUM_SOURCE_CONTRACT = 0xaC2422F51bcED9E675690f988dEf412fB790A27D;
        address OPTIMISM_DESTINATION_CONTRACT = 0xb12081B5d7E1168847a4548e3f8FF27Dd6886916;

        // Retrieve the private key from the environment variable
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        // Start broadcasting transactions
        vm.startBroadcast(deployerPrivateKey);

        SourceOApp arbitrumSource = SourceOApp(ARBITRUM_SOURCE_CONTRACT);

        // Set the peer on the Arbitrum chain (Source Chain) and Destination chain (Linea Chain)
        arbitrumSource.setPeer(
            optimismSepoliaEid,
            addressToBytes32(OPTIMISM_DESTINATION_CONTRACT)
        );

        // Stop broadcasting transactions
        vm.stopBroadcast();
    }

    // Convert address to bytes32
    // @param _addr The address of destination contract on destination chain
    function addressToBytes32(address _addr) public pure returns (bytes32) {
        return bytes32(uint256(uint160(_addr)));
    }
}

// Things to do
// 1 change the MyOApp with correct contract and contract addresses
// 2. setPeer() on source chain
// The `setPeer()` function takes 2 arguments: _eid, the destination endpoint ID for the chain our other OApp contract lives on, and _peer, the destination OApp contract address in bytes32 format.


// forge script script/LayerZero/SetPeer.s.sol:SetPeer --rpc-url $ARBITRUM_MAINNET_RPC --broadcast -vvvv
// forge script script/SetPeer.s.sol:SetPeer --rpc-url $ARBITRUM_SEPOLIA_RPC_URL --broadcast -vvvv
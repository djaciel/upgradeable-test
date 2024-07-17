// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";

import {Defender, ApprovalProcessResponse} from "openzeppelin-foundry-upgrades/Defender.sol";
import {Upgrades, Options} from "openzeppelin-foundry-upgrades/Upgrades.sol";

import {Box} from "src/Box.sol";

contract DefenderScript is Script {
    function setUp() public {}

    function run() public {
        uint256 DEPLOYER_PK = vm.envUint("DEPLOYER_PK");
        address deployer = vm.addr(DEPLOYER_PK);

        vm.startBroadcast(DEPLOYER_PK);

        address proxy =
            Upgrades.deployUUPSProxy("Box.sol", abi.encodeCall(Box.initialize, (5, deployer)));

        vm.stopBroadcast();

        console.log("Deployed proxy to address", proxy);
    }
}
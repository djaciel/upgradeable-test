// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";

import {SimpleStorage} from "../src/SimpleStorage.sol";

contract DefenderScript is Script {
    function setUp() public {}

    function run() public {
        uint256 DEPLOYER_PK = vm.envUint("DEPLOYER_PK");

        vm.startBroadcast(DEPLOYER_PK);

        // Deploy SimpleStorage
        SimpleStorage simpleStorage = new SimpleStorage();

        vm.stopBroadcast();

        console.log("Simple Storage deployed to address", address(simpleStorage));
    }
}

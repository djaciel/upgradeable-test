// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";

import {ProposeUpgradeResponse, Defender, Options} from "openzeppelin-foundry-upgrades/Defender.sol";

contract DefenderScript is Script {
    function setUp() public {}

    function run() public {
        Options memory opts;
        ProposeUpgradeResponse memory response = Defender.proposeUpgrade(
            0x1Cc7e9E43BFbf5EfBbe5675D68C32Bae8d844314,
            "BoxV2.sol",
            opts
        );
        console.log("Proposal id", response.proposalId);
        console.log("Url", response.url);
    }
}
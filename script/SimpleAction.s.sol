// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";

import {SimpleStorage} from "../src/SimpleStorage.sol";

// forge script script/SimpleAction.s.sol --rpc-url $RPC --broadcast -vvvv
contract SimpleActionScript is Script {
    function setUp() public {}

    function run() public {
        uint256 DEPLOYER_PK = vm.envUint("DEPLOYER_PK");

        vm.startBroadcast(DEPLOYER_PK);

        SimpleStorage simpleStorage = SimpleStorage(0xd37f15e6f2E5F4A624bbb9864f56bbd2e9b201b5);

        simpleStorage.setNum(42);
        console.log("Called setNum with value 42");

        uint256 num = simpleStorage.getNum();
        console.log("Called getNum, value:", num);

        // call again

        simpleStorage.setNum(43);
        console.log("Called setNum with value 43");

        num = simpleStorage.getNum();
        console.log("Called getNum, value:", num);

        // call again
        
        simpleStorage.setNum(44);
        console.log("Called setNum with value 44");

        num = simpleStorage.getNum();
        console.log("Called getNum, value:", num);

        vm.stopBroadcast();
    }
}

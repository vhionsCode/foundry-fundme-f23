// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";


contract DeployScript is Script {
    
    function run() external returns (FundMe){
        HelperConfig helperConfig = new HelperConfig();
        address ethusdPrice = helperConfig.activeNetworkConfig();
        vm.startBroadcast();
        //Mock
        FundMe fundMe = new FundMe(ethusdPrice);
        vm.stopBroadcast();
        return fundMe;
    }

}
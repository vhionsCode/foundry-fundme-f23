// SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../../src/FundMe.sol";
import {DeployScript} from "../../script/DeployScript.s.sol";
import {FundFundMe, WithdrawFundMe} from "../../script/Interaction.s.sol";

contract InteractionTest is Test {
    address USER = makeAddr("user");
    uint256 constant SEND_VALUE = 0.1 ether; // 100000000000000000
    uint256 constant STARTING_BALANCE = 10 ether;
    uint256 constant GAS_PRICE = 1;
    uint256 public number;

    FundMe fundMe;

    function setUp() external {
        //fundMe = new FundMe();

        DeployScript deployFundMe = new DeployScript();
        fundMe = deployFundMe.run();
        vm.deal(USER, STARTING_BALANCE);
    }

    function testUserCanFundInteraction() public {
        FundFundMe fundFundMe = new FundFundMe();
     //   vm.prank(USER);
     //   vm.deal(USER, 1e18);

        fundFundMe.fundFundMe(address(fundMe));

     //   address funder = fundMe.getFunder(0);

      //  assertEq(funder, USER);

      WithdrawFundMe withdrawFundMe = new WithdrawFundMe();
      withdrawFundMe.withdrawFundMe(address(fundMe));

      assert(address(fundMe).balance == 0);

    }


}

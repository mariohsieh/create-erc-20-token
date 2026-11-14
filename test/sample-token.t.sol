// SPDX-License-Identifier: MIT
pragma solidity ^0.8.38;

import { Test } from "forge-std/Test.sol";
import { DeploySampleToken } from "../script/deploy-sample-token.s.sol";
import { SampleToken } from "../src/sample-token.sol";

contract SampleTokenTest is Test {
  SampleToken public sampleToken;
  DeploySampleToken public deployer;

  address albert = makeAddr("alpha");
  address betty = makeAddr("betty");

  uint256 public constant STARTING_BALANCE = 100 ether;

  function setUp() public {
    deployer = new DeploySampleToken();
    sampleToken = deployer.run();
  }

  function testAlbertBalance() public {
    vm.prank(msg.sender);
    sampleToken.transfer(albert, STARTING_BALANCE);
    assertEq(STARTING_BALANCE, sampleToken.balanceOf(albert));
  }

  function testBettyBalance() public {
    vm.prank(msg.sender);
    sampleToken.transfer(betty, STARTING_BALANCE);
    assertEq(STARTING_BALANCE, sampleToken.balanceOf(betty));
  }
}

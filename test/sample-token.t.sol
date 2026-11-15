// SPDX-License-Identifier: MIT
pragma solidity ^0.8.38;

import { Test } from "forge-std/Test.sol";
import { DeploySampleToken } from "../script/deploy-sample-token.s.sol";
import { SampleToken } from "../src/sample-token.sol";

contract SampleTokenTest is Test {
  SampleToken public sampleToken;

  address private ALBERT = makeAddr("ALBERT");
  address private BETTY = makeAddr("betty");

  uint256 public constant STARTING_BALANCE = 100 ether;

  address private tokenOwner;

  function setUp() public {
    DeploySampleToken deployer = new DeploySampleToken();
    sampleToken = deployer.run();
    tokenOwner = msg.sender;
  }

  function testAlbertBalance() public {
    _assertBalanceAfterTransfer(ALBERT);
  }

  function testBettyBalance() public {
    _assertBalanceAfterTransfer(BETTY);
  }

  // ── Helpers ────────────────────────────────────────────────────────────────

  /// @dev Pranks as the token owner, transfers STARTING_BALANCE to `recipient`,
  ///      and asserts the recipient's resulting balance.
  function _assertBalanceAfterTransfer(address recipient) private {
    vm.prank(tokenOwner);
    sampleToken.transfer(recipient, STARTING_BALANCE);
    assertEq(sampleToken.balanceOf(recipient), STARTING_BALANCE);
  }
}

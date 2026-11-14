// SPDX-License-Identifier: MIT
pragma solidity ^0.8.38;

import { Script } from "forge-std/Script.sol";
import { SampleToken } from "../src/sample-token.sol";

contract DeploySampleToken is Script {
  uint256 public constant INITIAL_SUPPLY = 1000 ether;

  function run() external returns(SampleToken) {
    vm.startBroadcast();
    SampleToken sampleToken = new SampleToken(INITIAL_SUPPLY);
    vm.stopBroadcast();
    return sampleToken;
  }
}

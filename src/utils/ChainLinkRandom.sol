// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {VRFConsumerBaseV2} from "@chainlink/src/v0.8/vrf/VRFConsumerBaseV2.sol";
import {VRFCoordinatorV2Interface} from "@chainlink/src/v0.8/vrf/interfaces/VRFCoordinatorV2Interface.sol";

/**
 * https://docs.chain.link/vrf/v2/getting-started
 */
contract ChainLinkRandom is VRFConsumerBaseV2 {
    VRFCoordinatorV2Interface private COORDINATOR;
    uint64 private subscriptionId;
    bytes32 private keyHash;
    uint16 private minimumRequestConfirmations = 3;
    uint32 private callbackGasLimit = 250000;
    uint32 private numWords = 1;
    uint256 private random;
    uint256[] private requestIds;

    constructor(uint64 _subscriptionId, address _vrfCoordinator) VRFConsumerBaseV2(_vrfCoordinator) {
        subscriptionId = _subscriptionId;
        COORDINATOR = VRFCoordinatorV2Interface(_vrfCoordinator);
    }

    function generate() public returns (uint256 requestId) {
        requestId = COORDINATOR.requestRandomWords(keyHash, subscriptionId, minimumRequestConfirmations, callbackGasLimit, numWords);
    }

    function fulfillRandomWords(uint256 requestId, uint256[] memory randomWords) internal override {
        requestIds.push(requestId);
        random = randomWords[0];
    }

    function getResult() public view returns (uint256) {
        require(random != 0, "random not initialize");
        return random % 1000;
    }
}

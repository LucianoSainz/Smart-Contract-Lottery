// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title   A sample Raffle contract
 * @author Luciano Sainz
 * @notice This contract is for creating a sample Raffle contract.
 * @dev    implements Chailink VRFv2.5
 */

contract Raffle {
    /** Errors*/
    error Raffle_SendMoreToEnterRaffle();

    uint256 private immutable i_entranceFee;

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() public payable {
        //require(msg.value >= i_entranceFee,"Not enough ETH sent!");
        //require(msg.value >= i_entranceFee, SendMoreToEnterRaffle());
        if (msg.value < i_entranceFee) {
            revert Raffle_SendMoreToEnterRaffle();
        }
    }

    function pickWinner() public {}

    /**Getter Functions */
    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }
}

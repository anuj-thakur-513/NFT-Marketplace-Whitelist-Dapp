// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Whitelist {
    uint8 public maxWhitelistedAddressesAllowed;
    // map to check whether an address is whitelisted or not
    mapping(address => bool) public whitelistedAddresses;

    uint8 public countAddressesWhitelisted;

    constructor(uint8 _maxWhitelistedAddressesAllowed) {
        maxWhitelistedAddressesAllowed = _maxWhitelistedAddressesAllowed;
    }

    function addAddressToWhitelist() public {
        // checking if the user is already added to whitelist
        require(
            !whitelistedAddresses[msg.sender],
            "Sender has already been whitelisted"
        );
        // checking if the count of whitelisted addresses < maxWhitelistedAddressesAllowed
        require(
            countAddressesWhitelisted < maxWhitelistedAddressesAllowed,
            "More addresses can't be added, max limit reached"
        );

        whitelistedAddresses[msg.sender] = true;
        countAddressesWhitelisted += 1;
    }
}

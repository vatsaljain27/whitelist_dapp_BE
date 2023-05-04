// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {
    // Maximum number of Addresses which can be whitelisted
    uint8 public maxWhitelistedAddresses;
    // Keep track of the number of Addresses Whitelisted till now
    uint8 public numAddressesWhitelisted;

    mapping(address => bool) public whitelistedAddresses;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        require(
            !whitelistedAddresses[msg.sender],
            "Sender already in Whitelist"
        );
        require(
            numAddressesWhitelisted < maxWhitelistedAddresses,
            "Max limit reached"
        );
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}

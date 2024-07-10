// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AddressManager {
    address public owner;
    mapping(address => bool) public approvedAddresses;

    // Modifier to restrict access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    // Constructor to set the owner
    constructor() {
        owner = msg.sender;
    }

    // Function to add an address to the approved list
    function addAddress(address _address) public onlyOwner {
        require(_address != address(0), "Invalid address");
        approvedAddresses[_address] = true;
        assert(approvedAddresses[_address] == true);
    }

    // Function to remove an address from the approved list
    function removeAddress(address _address) public onlyOwner {
        require(_address != address(0), "Invalid address");
        require(approvedAddresses[_address], "Address not approved");
        approvedAddresses[_address] = false;
        assert(approvedAddresses[_address] == false);
    }

    // Function to check if an address is approved
    function isApproved(address _address) public view returns (bool) {
        if (_address == address(0)) {
            revert("Invalid address");
        }
        return approvedAddresses[_address];
    }
}

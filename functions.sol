// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AccessControl {
    address public owner;
    mapping(address => bool) public authorizedUsers;

    event UserAuthorized(address indexed user);
    event UserUnauthorized(address indexed user);

    constructor() {
        owner = msg.sender;
    }

    // Modifier to check if the caller is the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    // Function to authorize a user
    function authorizeUser(address user) public onlyOwner {
        require(user != address(0), "Invalid address");
        authorizedUsers[user] = true;
        emit UserAuthorized(user);
    }

    // Function to deauthorize a user
    function deauthorizeUser(address user) public onlyOwner {
        require(authorizedUsers[user], "User not authorized");
        authorizedUsers[user] = false;
        emit UserUnauthorized(user);
    }

    // Function to perform an action that requires authorization
    function performRestrictedAction() public {
        require(authorizedUsers[msg.sender], "User not authorized");

        // Some action that only authorized users can perform
        // Example: Changing the owner (just for illustration purposes)
        owner = msg.sender;
    }

    // Function to demonstrate assert and revert
    function criticalFunction(uint256 value) public pure {
        // This function requires the input value to be even
        if (value % 2 != 0) {
            revert("Input value must be even");
        }

        // Assert to check an internal state or condition
        uint256 result = value / 2;
        assert(result * 2 == value);
    }
}

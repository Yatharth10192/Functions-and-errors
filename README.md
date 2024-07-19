# Functions-and-errors
In this project we are writing the smart contract that implements the functions as given in the question.
# Description
In this project we are writing the smart contract that implements three functions that are require(), assert(), and revert(). We have created the function to deposit either into the contract. We have created addaddress() to add the address and removeaddress() to remove the desired address. Then we have the function to approve address and also for checking is the function is approved or not. We have p;ayed with the address in the whole code and tested for different functions we created. The outcome achieved with all this effort was that, while we put wrong address (the address that is not added) in the remove address or any other function, then we will get the invalid address message. 
# Getting Started
# Installing
We can use online Etherium IDE for the purpose of this project.
# Executing program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/. After that create a file and write your code.
# code
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
After this compile the code and then deploy it. After deploying it we can test different functions i.e. deposit, withdraw and check balance etc. The errors we encounter can give us great insights about error handeling.
# Help
For any help in the code we can take helpof the debug option in the compiler.
# Authors
Yatharth Sharma
yatharths10192@gmail.com
9350677109
# Licence
This project is licensed under the MIT License - see the LICENSE file for details

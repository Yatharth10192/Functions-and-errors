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
After this compile the code and then deploy it. After deploying it we can test different functions i.e. deposit, withdraw and check balance etc. The errors we encounter can give us great insights about error handeling.
# Help
For any help in the code we can take helpof the debug option in the compiler.
# Authors
Yatharth Sharma
yatharths10192@gmail.com
9350677109
# Licence
This project is licensed under the MIT License - see the LICENSE file for details

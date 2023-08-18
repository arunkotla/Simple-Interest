// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Simple_Interest{

       string[]  name;

    address payable public owner = payable(msg.sender);

    function Deposit(string memory _name) payable public {
        require(msg.value > 0, "amount should be more than 0");
        owner.transfer(msg.value);
        name.push(_name);
    }
}
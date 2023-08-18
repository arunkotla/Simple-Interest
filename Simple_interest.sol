// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Simple_Interest{

       struct DepositInfo{
           string name;
           address account;
           uint amount;
           uint timestamp;           
       }

       DepositInfo[] public deposits;

    address payable public owner = payable(msg.sender);

    function Deposit(string memory _name) payable public {
        require(msg.value > 0, "amount should be more than 0");
        owner.transfer(msg.value);
        deposits.push(
            DepositInfo(
                {
                name : _name,
                account : msg.sender,
                amount : msg.value,
                timestamp : block.timestamp
                }
            )
        );
    }

    function calculateInterest(uint depositIndex, uint interestRate, uint timePeriod) public view returns (uint){
        require(depositIndex < deposits.length, "Invalid deposit index");
        uint principle =  deposits[depositIndex].amount;
        uint interest = (principle*interestRate*timePeriod)/100;

        return interest/10**18;

    }

}
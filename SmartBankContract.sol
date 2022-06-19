//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;


contract smartBankContract{

    //add this address store a uint value
    mapping(address => uint ) public accountList;

    // Setting modifier to check if the particular account has sufficient balance 
    modifier hasBalance(uint _amount){
        require(_amount <= accountList[msg.sender], "Balance not sufficient");
         _;
    }
    //with payable the contract is going to receive ether and we are updating the accountList with 
    // the sender's address and sender's ether value

    function depositFund() public payable {
        accountList[msg.sender] += msg.value;
    }

    //Anybody that's trying to withdraw the ether, we 1st validate the balance
    //Then the amount of ether is transferred back to the address of the person

    function withdrawFund(uint _amount) public hasBalance(_amount){
        payable(msg.sender).transfer(_amount);
    }
    //return the total balance of all account stored at the address of this smart contract
    function checkContractBalance() public view returns(uint){
        return address(this).balance;
    }

}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
contract Greetings{
    string public greet;
    address public owner;
    constructor(){
        owner = msg.sender;
    }
    function setGreetings(string memory _greet) public {
        require(msg.sender == owner,"only owner can access");
        greet = _greet;
    }
    function getGreetings() public view returns(string memory){
        return greet;
    }
}
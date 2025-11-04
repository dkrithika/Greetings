// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
import {Test} from "forge-std/Test.sol";
import {Greetings} from "../src/Greetings.sol";
contract GreetingsTest is Test{
    Greetings public greetings;
    address attacker = address(0xBEEF);
    address owner = address(this);
    function setUp() public{
        greetings = new Greetings();
    }
    function testSetGreetings() public{
       greetings.setGreetings("hello world");
        assertEq(greetings.greet(),"hello world"); 
    }
    function testRevertSetGreetings() public{
        vm.prank(attacker);
        vm.expectRevert(bytes("only owner can access"));
        greetings.setGreetings("hello world");
        
    }
    function testGetGreetings() public{
        greetings.setGreetings("welcome to smart contract");
        string memory value = greetings.getGreetings();
        assertEq(value,"welcome to smart contract");
    }
}

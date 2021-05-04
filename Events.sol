pragma solidity ^0.5.3;

contract Event{

    event Log(address sender, string message);
    event AnotherLog();

    function fireEvents() public {
        emit Log(msg.sender, "Hello World");
        emit Log(msg.sender, "Hello EVM!");
        emit AnotherLog();

    }
}
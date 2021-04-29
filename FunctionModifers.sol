pragma solidity ^0.5.3;

contract FuncModifier{
    
    // Modifiers -> re-usable code that can be called before or after a function
    // Examples
    // 1. Restricting write access (basic syntax)
    // 2. Validate inputs (inputs, why useful)
    // 3. Reentrancy guard (reentrancy hack)

    address public owner;

    constructor() public{
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Not owner");
        _;
    }

    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner){
        
        owner = _newOwner;
    }

    // Reentrancy hack
    uint public x = 10;
    bool locked;

    modifier noReentrancy(){
        require(!locked, "Locked");

        locked = true;
        _;
        locked = false;
    }

    function decrement (uint i) public noReentrancy{
        x -= 1;
        if (x > 1){
            decrement(i - 1);
        }
    }
}
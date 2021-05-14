pragma solidity ^0.5.11;

/*
Calling other contracts 

Examples:
- call non payable function in another contract
- call payable function in another contract

*/

contract Callee {
    uint public x;
    uint public value; // Will be used when we send Eth to this contract

    function setX(uint _x) public returns(uint){
        x = _x;
        return x;
    }

    function setXandSendEther(uint _x) public payable returns(uint, uint){
        x = _x;
        value = msg.value;
        return (x, value);
    }
}

contract Caller {

    function setX(Callee _callee, uint _x) public {
        uint x = _callee.setX(_x);
    }

    // Alternative way to call another conrract:
    // Instantiate the contract by passing the address to a function

    function setXFromAddress(address _addr, uint _x) public {
        Callee callee = Callee(_addr);
        uint x = callee.setX(_x);
    }

    function setXAndSendEther(Callee _callee, uint _x) public payable {
        (uint x, uint value) = _callee.setXandSendEther.value(msg.value)(_x);

    }

}
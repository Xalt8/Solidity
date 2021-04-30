pragma solidity ^0.5.3;

contract X {
    event Log(string message);
    string public name;
    constructor(string memory _name) public {
        name = _name;

        emit Log(_name);
    }
}

contract Y {
    string public text;
    event Log(string message);
    constructor(string memory _text) public {
        text = _text;

        emit Log(_text);
    }
}


// Three different ways to call X constructor --------->

contract B is X("Fixed input"), Y("Another fixed input") {
}

contract C is X, Y {
    constructor() X("Fixed input") Y("Another fixed input") public {
    }
}

contract D is X, Y {
    constructor(string memory _name, string memory _text) X(_name) Y(_text) public{
    }
}

//  <<------------------------------->>

// Parent contract X is called before Y
contract E is X, Y {
    constructor() X("X was called") Y("Y was called") public {

    }
}

// Parent contract Y is called before X
contract F is X, Y {
    constructor() Y("Y was called") X("X was called") public {

    }
}
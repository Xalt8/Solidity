pragma solidity ^0.5.3;

/*
Examples:
    - Inheritance
        - inherit functions
        - override functions
    
    - Passing parameters to parent constructor
        - fixed parameters
        - variable parameters
*/

contract A {

    string public name;

    constructor(string memory _name) public{
        name = _name;
    }

    function getContractName() public pure returns (string memory) {
        return "Contract A";
    }
}

/*  When overwriting a contract make sure that the function signature is 
    the same as the parent contract otherwise it will not overwite it. 
*/ 
contract B is A {
    
    constructor(string memory _name) A (_name) public{

    }

    function getContractName() public pure returns (string memory) {
        return "Contract B";
    }
}
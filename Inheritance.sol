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

    function getContractName() public pure returns (string memory) {
        return "Contract A";
    }
}

contract B is A {

}
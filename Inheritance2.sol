pragma solidity ^0.5.3;

contract A {

    function foo() public pure returns (string memory){
        return "A";
    }
}

contract B {

    function bar() public pure returns (string memory){
        return "B";
    }
}


/*  The order of inheritance -> right most first (B)
    Most base like - does not inherit from other contracts
    More derived - inherits from other contracts
*/ 
contract C is A, B {

}
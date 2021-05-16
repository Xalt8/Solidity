pragma solidity ^0.5.16;

/*
Keccak256 (Cryptographic Hash Function)
- what is it?
    - function that takes in an arbitary size input and outputs a data of a fixed size
    - properties
        - deterministic
            -hash(x) = h, every time
        - quick to compute the hash
        - irreverable 
            - given h, hard to find x such that hash(x) = h
        - small change in input changes the output significantly
        - collision resistant
            - hard to find x, y such that hash(x) = hash(y) 
Examples 
- guessing game (pseudo random)

*/

contract HashFunction {
    // abi.encodePacked can take multiple inputs
    // bytes hash = keccak256(abi.encodePacked("hello", uint(1), uint(2), address(123)))

    function hash(string memory _text, uint _num, address _addr) public pure returns (bytes32){
        return keccak256(abi.encodePacked(_text, _num, _addr));
    }

    function collision(string memory _text, string memory _anotherText)
    public pure returns (bytes32){
        // encodePacked concatenates the 2 strings
        // AAA BBB -> AAABBB
        // AA ABBB -> AAABBB
        // When working with more 1 dynamic data types (String)
        // use encode instead of encodePacked
        
        // return keccak256(abi.encodePacked(_text, _anotherText));
        return keccak256(abi.encode(_text, _anotherText));
    }

}
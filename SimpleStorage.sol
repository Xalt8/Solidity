pragma solidity ^0.5.3;

contract SimpleStorage{
    string public text; // State variable -> stored on the blockchain (expensive)

    // memory -> because the variable is stored in the blockchain 
    // storage -> when varible is stored in the contract
    function set(string memory _text) public{
        text = _text;
    }

    function get() public view returns (string memory){
        return text;
    }

}
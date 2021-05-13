pragma solidity ^0.5.11;

/*
delegatecall
- a low level function similar to call
- when contract A delegatecall contract B
    it runs B's code inside A's context (storage, msg.sender, msg.value)
- can upgrade contract A without changing any code inside it
*/

contract B {
    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }

}

contract A {
    uint public num;
    address public sender;
    uint public value;

    function setVars(address _contract, uint _num) public payable {
        (bool sucess, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }
}
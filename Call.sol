pragma solidity ^0.5.12;

/*
call - low level method available on address type
examples
    - call existing functin
    - call non-existing function (triggers the fallback function)
*/

contract Receiver {

    event Received(address caller, uint amount, string message);

    function() external payable {
        emit Received(msg.sender, msg.value, "Fallback was called");
    }

    function foo(string memory _message, uint _x) public payable returns (uint){
        // msg.sender -> address of who called this contract
        // msg.value -> amount of Eth that was sent
        emit Received(msg.sender, msg.value, _message);

        return(_x + 1);
    }
}


contract Caller {

    event Response(bool success, bytes data);

    function testCallFoo(address payable _addr) public payable {
        (bool success, bytes memory data) = _addr.call.value(msg.value).gas(5000)(
            abi.encodeWithSignature("foo(string,uint256)", "call foo", 123)
        );

        emit Response(success, data);
    }

    function testCallDoesNotExist(address _addr) public {
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("doesNotExist()")
        );

        emit Response(success, data);
    }
}
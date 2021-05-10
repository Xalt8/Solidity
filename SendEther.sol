pragma solidity ^0.5.3;

/*
3 ways to send ether from a contract to another
- transfer  (forwards 2300 gas, throws and error)
- send      (forwards 2300 gas, returns bool )
- call      (forward all the gas or specify the amount of gas, return bool) (Recommended way after 2019 Dec)
*/

contract ReceiveEther {
    // fallback function
    function() external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendEther {
    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(msg.value); // Send all the ether from our account
        // This function can fail if the receiver contract is not payable or
        // if the amount you're trying to send is more than what the contract holds 
    }

    function sendViaSend(address payable _to) public payable {
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to) public payable {
        // sent -> whether it was sent or not
        // data -> return values from calling the fallback function
        (bool sent, bytes memory data) = _to.call.gas(1000).value(msg.value)("");
        require(sent, "Failed to send Ether");

    }


}
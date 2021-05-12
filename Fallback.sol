pragma solidity ^0.5.12;

contract Fallback {

    event Log(uint gas);

    function() external payable {
        // send or transfer forwards 2300 gas to this fallback function
        // Should not include any other code in it - there maybe insufficient gas
        emit Log(gasleft()); 
    }

    function getBalance() public view returns (uint) {
        // Gets the balance of Eth stored in this contract
        return address(this).balance;
    }
}

contract SendToFallback{

    function transferToFallback(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function callFallback(address payable _to) public payable {
        (bool, sent) = _to.call.value(msg.value)("");
        require(sent, "Failed to send");
    }

}
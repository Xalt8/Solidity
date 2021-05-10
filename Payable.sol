pragma solidity ^0.5.12;

contract Wallet {
    // Examples
    // - payable functin
    // - payable address
    // If building user interface on top of wallet then 'events' are essential

    event Deposit(address sender, uint amount, uint balance);
    event Withdrawal(uint amount, uint balance); 
    event Transfer(address to, uint amount, uint balance);


    address payable public owner;


    // We want to deposit into this contract when it is created
    constructor() public payable{
        owner == msg.sender;
    }
    
    function deposit() public payable {
        emit Deposit(msg.sender, msg.value, address(this).balance);
    }


    modifier onlyOwner(){
        require(msg.sender == owner, "Not owner");
        _;
    }

    function withdraw(uint _amount) public onlyOwner {
        owner.transfer(_amount);
        emit Withdrawal(_amount, address(this).balance);
    }

    function transfer(address payable _to, uint _amount) public onlyOwner {
        _to.transfer(_amount);
        emit Transfer(_to, _amount, address(this).balance);
    }

    function getBalance() public view returns(uint) {
        return address(this).balance; 
    }
}
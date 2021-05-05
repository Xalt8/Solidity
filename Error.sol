pragma solidity ^0.5.3;

contract Account {

    /* 
        Assert is used to check for conditions that should never be possible

        Required is used to validate inputs and state conditions before executions
        and to check outputs of other functions.

        Revert -> if statements for invalid conditions. Better to use when the conditions are more complex.

        Numbers can overflow & underflow
        If the MAX_UINT (2**256-1) is added to a number it will wrap around and 
        overflow
        x-y  will underflow if y > x 

    */


    uint public balance;
    uint public constant MAX_UINT = 2**256-1;

    function deposit_assert(uint _amount) public {
        
        // balance + _amount does not overflow if balance + _amount >= balance
        uint oldBalance = balance;
        uint newBalance = balance + _amount;
        require(newBalance >= oldBalance, "Overflow");
        balance = newBalance;
        assert(balance >= oldBalance); // Making sure that the balance went up

    }

    function withdraw(uint _amount) public {
        uint oldBalance = balance;

        // balance - _amount does not underflow if balance >= _amount
        require(balance >= _amount, "Underflow");

        if(balance >= _amount){
            revert("Underflow");
        }
        balance -= _amount; 
        assert(balance <= oldBalance);
    }

}
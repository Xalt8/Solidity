pragma solidity ^0.5.16;

/*
Library
- no storage no ether
- helps keeps you code DRY (Don't repeat yourself)
    - add functionality types
        uint x
        x.myFunctionFromLibary()
- Can save gas

Embedded or linked
- embedded (library has only internal functions)
- must be deployed and then linked (library has public or external functions)

Examples
- safe math (prevent uint overflow)
- deleting element from array without gaps

*/

library SafeMath {
    function add(uint x, uint y) internal pure returns (uint){
        uint z = x + y;
        require (z >= x, "uint overflow");
        return z;
    }
}

contract TestSafeMath {
    // Attach functions from library SafeMath to return type uint 
    using SafeMath for uint;

    uint public MAX_UINT = 2 ** 256 -1;

    function testAdd(uint x, uint y) public pure returns (uint) {
        return x.add(y);
    }
}

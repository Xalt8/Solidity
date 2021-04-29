pragma solidity ^0.5.3;

contract Function{
    // Maps are not allowed:    
    // function mapInput(mapping(uint => uint) memory map) public{}

    // Multi-Dimentional Fixed sized Arrays are permitted
    // Multi-Dimentional Dynamic arrays are not permitted
    function multiDimFixedSizeArrayInput(uint[9][9] memory _arr) public{}

    
    // Require that the array is less than some fixed number
    // This will ensure that the gas needed to execute the transaction 
    // is sufficient
    uint MAX_ARR_LENGTH = 10;

    function arrayInput(uint[] memory _arr) public view {
        if (_arr.length > MAX_ARR_LENGTH){
            // throw an error
        }
    }

// Outputs with map and dynamic multi-dimensional arrays do not compile

// Write contracts with bounded consumption of gas

    uint[] arr;

    function arrayOutput() public view returns (uint[] memory){
        return arr;
    }

    function returnMultipleVals() public pure returns (uint, bool, uint){
        return (1, true, 2);
    }

    function named() public pure returns (uint x, bool b, uint y){
        return (1, true, 2);
    }

    function assigned() public pure returns (uint x, bool b, uint y){
        x = 1;
        b = true;
        y = 2;
    }

    function destructingAssignments() public pure returns (uint, bool, uint, uint, uint){
        (uint i, bool b, uint j) = returnMultipleVals();
        
        // Values can be left out
        (uint x, , uint y) = (4, 5, 6);

        return (i, b, j, x, y);
    }

    // Function that collectes multiple function calls and returns all results
    function f() public pure returns (uint){
        return 1;
    }
    
    function g() public pure returns (uint){
        return 2;
    }

    function h() public pure returns (uint, uint){
        return (f(), g());
    }


}
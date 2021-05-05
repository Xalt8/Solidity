pragma solidity ^0.5.3;

// Examples
// - How to write an array
// - Push, pop & length
// - Removing elements from an array

contract Array {
    uint[] public myArray; // Dynamic array
    uint[] public myArray2 = [1,2,3]; // Dynamic array with default values 
    uint[10] public myFixedSizedArray; // Fixed sized array - initialised with default values (0)

    function push(uint i) public {
        myArray.push(i); // adds the value to the end of an array
    }

    function pop() public {
        myArray.pop(); // removes the last element in an array
    }

    function getLength() public view returns (uint) {
        return myArray.length;
    }

    /*  calling delete on an index value sets the array value at
        that index to the default value (0). The length of the array
        stays the same 
    */  
    function remove(uint index) public {
        delete myArray[index];
    }
}

contract CompactArray{
    uint[] public myArray;

    function remove(uint index) public {
        // Copy the last element of the array and put it into
        // the place of the deleted index and remove the last element
        myArray[index] = myArray[myArray.length - 1]; 
        myArray.pop(); 
    }

    function test() public {
        myArray.push(1);
        myArray.push(2);
        myArray.push(3);
        myArray.push(4);
        // [1,2,3,4]

        remove(1); // remove 2 at index 1
        // [1,4,3]
        assert(myArray.length == 3);
        assert(myArray[0] == 1);
        assert(myArray[1] == 4);
        assert(myArray[2] == 3);

        remove(2);
        // [1,4]

        assert(myArray.length == 2);
        assert(myArray[0] == 1);
        assert(myArray[1] == 4);
    }   
}
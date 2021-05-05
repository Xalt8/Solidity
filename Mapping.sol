pragma solidity ^0.5.3;

// Mapping
// - Create a mapping (dict) - cannot loop through it or get the size 
// - Get value
// - Set value
// - Delete value - does not remove the element just sets it to default (0)
// - Keys have to built-in types
// - Values can be arrays or other Maps.
// - If a key is called that is not set then it will return the default value (0)


contract Mapping {
    mapping(address => uint) public myMap;

    function get(address _addr) public view returns (uint){
        return myMap[_addr];
    }
    function set(address _addr, uint _i) public {
        myMap[_addr] = _i;
    }

    function remove(address _addr) public {
        delete myMap[_addr];
    }
}
    

     


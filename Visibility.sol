pragma solidity ^0.5.3;

contract Base {

    // This function cannot be called from remix because it is private
    function privateFunction() private pure returns (string memory){
        return "private function called";
    }

    // This function can be called from remix because it is public
    function testPrivateFunc() public pure returns (string memory){
        return privateFunction();
    }

    function internalFunc() internal pure returns (string memory){
        return "internal function called";
    }

    function testInternalFunc() public pure returns (string memory) {
        return internalFunc();
    }

    /*  public functions can be called inside this contract
        by child contracts inheriting from this contract
        by other contracts and accounts. 
    */ 
    function publicFunc() public pure returns (string memory) {
        return "public function called";
    }

    // Can only be called by external contracts and accounts.
    // Cannot call this function inside another function 
    function externalFunc() external pure returns (string memory) {
        return "external function called";
    }

    string private privateVar = "my private variable";
    string internal internalVar = "my internal variable";
    string public publicVar = "my public variable";

    // State variables cannot be declared as external!
    // string external externalVar = "my external variable";


}

contract Child is Base {

    function testInternalFunc() public pure returns (string memory){
        return internalFunc();
    }
}


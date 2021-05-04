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
}

contract Child is Base {

    function testInternalFunc() public pure returns (string memory){
        return internalFunc();
    }
}


pragma solidity ^0.5.3;

contract SimpleStorage{
    string public text; // State variable -> stored on the blockchain (expensive)

    // memory -> because the variable is stored in the blockchain 
    // storage -> when varible is stored in the contract
    function set(string memory _text) public{
        text = _text;
    }

    function get() public view returns (string memory){
        return text;
    }

}

// Better to upload the data to IPFS a peer-to-peer datastorage service
// When you upload the data to IPFS you get a hash and use that hash in your
// contract to access the data. Store data for cheap and let eveyone else know
// where your data is stored.
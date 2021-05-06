pragma solidity ^0.5.3;

contract MerkleProof {

    function verify(
        // proof -> array of hashes needed to compute merkle root
        // root -> merkle root
        // leaf -> the hash of the element in the array that was used to construct the Merkle Tree
        // index -> index of the array where the element is stored

        bytes32[] memory proof, bytes32 root, bytes32 leaf, uint index) public pure returns (bool){
            bytes32 hash = leaf;

            // recompute Merkle root
            for (uint i = 0; i < proof.length; i++){
                if (index % 2 == 0){
                    hash = keccak256(abi.encodePacked(hash, proof[i]));
                } else {
                    hash = keccak256(abi.encodePacked(proof[i], hash));
                }

                index = index / 2; 
            }

            return hash == root;

        }    
    
}
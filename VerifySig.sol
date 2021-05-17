pragma solidity ^0.5.16;

/*
Signature verification

How to sign and verify messages

# Signing 
1. Create message to sign
2. Hash the message
3. Sign the message (off-chain, keep your private key secret)

# Verify 
1. Recreate hash from the original message
2. Recover signer from original message and hash
3. Compare recovered signer to claimed signer
*/

contract VerifySignature {

    function getMessageHash(
        // _nonce -> unique identifier
        address _to, uint _amount, string memory _message, uint _nonce)
        public pure returns(bytes32){
            return keccak256(abi.encodePacked(_to, _amount, _message, _nonce));
        }

    /*
    Signature is produced by singning keccak256 hash with the following message:
    "\x19Ethereum Signed Message\n" + len(msg) + msg
    keccak256(\x19Ethereum Signed Message\n32....message hash goes here....)
    */

    function getEthSignedMessageHash(bytes32 _messageHash)
        public pure returns(bytes32){
            return keccak256(abi.encodePacked(
               "\x19Ethereum Signed Message:\n32", 
               _messageHash 
            ));
        }
    
    function verify(
        address _signer,
        address _to, uint _amount, string memory _message, uint _nonce,
        bytes memory _signature) 
        public pure returns(bool)
        {
            bytes32 messageHash = getMessageHash(_to, _amount, _message, _nonce);
            bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);

            return recoverSigner(ethSignedMessageHash, _signature) == _signer;
        }

    function recoverSigner(bytes32 _ethSignedMessageHash, bytes memory _signature
    ) public pure returns(address) 
    {
        (bytes32 r, bytes32 s, uint8 v) = splitSignature(_signature);

        return ecrecover(_ethSignedMessageHash, v, r, s);
    }

    function splitSignature(bytes memory _sig) public pure returns (bytes32 r, bytes32 s, uint8 v)
    {
        require(_sig.length == 65, "invalid signature length");

        assembly {
            r := mload(add(_sig, 32))
            // _sig is a dynamic valiable -> pointer to its position in memory
            // when you add(_sig, 32) -> move the pointer by 32 bytes - skipping the first 32 bytes
            // Dynamic arrays store the length of the array in the fist 32 bytes so the signature starts after the first 32 bytes
            // mload(p) -> loads the next 32 bytes starting at the address p
            s := mload(add(_sig, 64)) 
            v := byte(0, mload(add(_sig, 96))) // Get the first byte after skipping 96 bytes 
        }
    }

}


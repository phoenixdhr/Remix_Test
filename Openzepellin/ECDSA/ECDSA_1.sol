// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0;

contract verifySig {

    function verify (address _signer, string memory _message, bytes memory _sig) external pure returns(bool)  {
       bytes32  messageHash = getMessageHash(_message);
       bytes32   ethSingedMesageHash = getETHSingedMesageHash(messageHash);

        return  recover(ethSingedMesageHash,_sig ) == _signer;


    }

    function getMessageHash(string memory _message) public pure returns (bytes32) {
        return keccak256(abi.encodePacked( _message));
    }

    function getETHSingedMesageHash(bytes32  _messageHash) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(
            "\x19Ethereum Signed Message:\n32",        
             _messageHash));
    }


    function recover(bytes32 _ethSingedMesageHash, bytes memory _sig)  public pure returns (address) {
        (bytes32 r, bytes32 s, uint8 v) = _split(_sig);
        return ecrecover(_ethSingedMesageHash, v ,r, s);   
    }


    function _split(bytes memory _sig) internal pure  returns (bytes32 r, bytes32 s, uint8 v) {
        require(_sig.length ==65,"invalid signature length");
        assembly {
            r:= mload(add(_sig,32))
            s:= mload(add(_sig,64))
            v:=byte (0,mload(add(_sig,96)))
        }   
    }


}
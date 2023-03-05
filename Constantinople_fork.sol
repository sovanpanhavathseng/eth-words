pragma solidity ^0.5.0;

contract Factory {
  event ContractCreated(address indexed newContract);

  function deploy(bytes memory code, bytes32 salt) public {
    address newContract = address(
      uint256(
        keccak256(
          abi.encodePacked(
            bytes1(0xff),
            address(this),
            salt,
            keccak256(code)
          )
        )
      )
    );

    emit ContractCreated(newContract);

    assembly {
      mstore(0, code)
      return(0x20, mload(0))
    }
  }
}

contract MyContract {
  uint256 public value;

  constructor(uint256 _value) public {
    value = _value;
  }
}

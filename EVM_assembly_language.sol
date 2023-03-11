; EVM assembly code that implements the Solidity code in the previous answer

; Set the version of the EVM
pragma solidity ^0.8.0

; Define the contract
contract:
  ; Define the contract's storage
  value_slot: 0
  value_offset: 0

  ; Define the contract's main function
  function:
    ; Load the input value
    calldataload 0

    ; Store the value in storage
    sstore value_slot value_offset

    ; Return a success status
    0 RETURN

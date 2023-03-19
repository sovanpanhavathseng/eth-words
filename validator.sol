pragma solidity ^0.8.0;

contract MyValidatorContract {
    
    mapping(address => bool) public validators;

    function addValidator(address _validator) public {
        require(msg.sender == owner, "Only the owner can add validators");
        validators[_validator] = true;
    }

    function removeValidator(address _validator) public {
        require(msg.sender == owner, "Only the owner can remove validators");
        validators[_validator] = false;
    }

    function validateTransaction(bytes32 _transaction) public view returns (bool) {
        require(validators[msg.sender] == true, "Only validators can validate transactions");
        // Perform validation checks on the transaction
        return true;
    }
}

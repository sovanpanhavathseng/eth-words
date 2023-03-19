pragma solidity ^0.8.0;

contract ValidatorLifecycle {
    struct Validator {
        uint256 id;
        address addr;
        uint256 stakedAmount;
        bool active;
    }
    
    mapping(address => Validator) public validators;
    mapping(uint256 => address) public validatorIds;
    uint256 public validatorCount;

    function addValidator(address _addr, uint256 _stakedAmount) public {
        require(_addr != address(0), "Invalid address");
        require(_stakedAmount > 0, "Invalid staked amount");
        validators[_addr] = Validator(validatorCount, _addr, _stakedAmount, true);
        validatorIds[validatorCount] = _addr;
        validatorCount++;
    }

    function removeValidator(address _addr) public {
        require(validators[_addr].active, "Validator not active");
        validators[_addr].active = false;
    }

    function updateStakedAmount(address _addr, uint256 _stakedAmount) public {
        require(validators[_addr].active, "Validator not active");
        require(_stakedAmount > 0, "Invalid staked amount");
        validators[_addr].stakedAmount = _stakedAmount;
    }
}

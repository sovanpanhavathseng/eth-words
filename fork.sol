contract Consensus {
    mapping(address => uint256) public stakes;
    address[] public validators;

    function registerValidator() public {
        validators.push(msg.sender);
        stakes[msg.sender] = 1000;
    }

    function updateStake(address validator, uint256 amount) public {
        require(stakes[msg.sender] >= amount);
        stakes[msg.sender] -= amount;
        stakes[validator] += amount;
    }

    function getValidators() public view returns (address[] memory) {
        return validators;
    }

    function getValidatorStake(address validator) public view returns (uint256) {
        return stakes[validator];
    }

    function getConsensus() public view returns (address) {
        uint256 maxStake = 0;
        address winningValidator;

        for (uint256 i = 0; i < validators.length; i++) {
            if (stakes[validators[i]] > maxStake) {
                maxStake = stakes[validators[i]];
                winningValidator = validators[i];
            }
        }

        return winningValidator;
    }
}

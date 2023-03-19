contract SimpleToken {
    mapping(address => uint256) balances;
    uint256 totalSupply;

    function mint(address recipient, uint256 amount) public {
        require(amount > 0, "Amount must be greater than zero");
        balances[recipient] += amount;
        totalSupply += amount;
    }

    function transfer(address recipient, uint256 amount) public {
        require(amount <= balances[msg.sender], "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
    }
}

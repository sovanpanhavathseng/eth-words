contract Vulnerable {
    mapping(address => uint) balances;

    function withdraw(uint amount) public {
        require(balances[msg.sender] >= amount);
        (bool success, ) = msg.sender.call{value: amount}("");
        if (success) {
            balances[msg.sender] -= amount;
        }
    }

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }
}

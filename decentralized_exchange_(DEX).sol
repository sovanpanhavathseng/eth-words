pragma solidity ^0.8.0;

contract MyToken {
    string public name = "MyToken";
    string public symbol = "MTK";
    uint256 public totalSupply = 1000000000000000000000; // 1,000,000 MTK tokens
    mapping(address => uint256) balances;

    constructor() {
        balances[msg.sender] = totalSupply;
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balances[msg.sender] >= _value);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
}

contract DEX {
    mapping(address => mapping(address => uint256)) public tokens;

    event Bought(address indexed buyer, uint256 amount);
    event Sold(address indexed seller, uint256 amount);

    function buy(address tokenAddress, uint256 amount) public payable {
        uint256 tokenAmount = amount / 1000000000000000000; // 1 ETH = 1,000,000,000,000,000,000 wei
        require(tokenAmount > 0, "You need to send at least 1 ETH");
        require(tokens[tokenAddress][msg.sender] + tokenAmount <= MyToken(tokenAddress).totalSupply());
        tokens[tokenAddress][msg.sender] += tokenAmount;
        MyToken(tokenAddress).transferFrom(address(this), msg.sender, tokenAmount);
        emit Bought(msg.sender, tokenAmount);
    }

    function sell(address tokenAddress, uint256 amount) public {
        uint256 tokenAmount = amount / 1000000000000000000; // 1 ETH = 1,000,000,000,000,000,000 wei
        require(tokenAmount > 0, "You need to sell at least 1 ETH");
        require(tokens[tokenAddress][msg.sender] >= tokenAmount);
        tokens[tokenAddress][msg.sender] -= tokenAmount;
        MyToken(tokenAddress).transfer(address(this), tokenAmount);
        payable(msg.sender).transfer(amount);
        emit Sold(msg.sender, tokenAmount);
    }
}

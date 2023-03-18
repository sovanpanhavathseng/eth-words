pragma solidity ^0.8.0;

contract Stablecoin {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    
    address public bank;
    uint256 public exchangeRate;
    
    event Transfer(address indexed from, address indexed to, uint256 value);
    
    constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _totalSupply, uint256 _exchangeRate, address _bank) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _totalSupply;
        balanceOf[msg.sender] = totalSupply;
        exchangeRate = _exchangeRate;
        bank = _bank;
    }
    
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
    
    function deposit(uint256 _amount) public {
        require(msg.sender == bank);
        balanceOf[msg.sender] += _amount;
        totalSupply += _amount;
    }
    
    function withdraw(uint256 _amount) public {
        require(msg.sender == bank);
        require(balanceOf[msg.sender] >= _amount);
        balanceOf[msg.sender] -= _amount;
        totalSupply -= _amount;
    }
    
    function setExchangeRate(uint256 _exchangeRate) public {
        require(msg.sender == bank);
        exchangeRate = _exchangeRate;
    }
    
    function getExchangeRate() public view returns (uint256) {
        return exchangeRate;
    }
    
    function buyStablecoin() public payable {
        uint256 stablecoinAmount = msg.value / exchangeRate;
        require(balanceOf[bank] >= stablecoinAmount);
        balanceOf[bank] -= stablecoinAmount;
        balanceOf[msg.sender] += stablecoinAmount;
        emit Transfer(bank, msg.sender, stablecoinAmount);
    }
    
    function sellStablecoin(uint256 _amount) public {
        require(balanceOf[msg.sender] >= _amount);
        uint256 etherAmount = _amount * exchangeRate;
        require(address(this).balance >= etherAmount);
        balanceOf[msg.sender] -= _amount;
        balanceOf[bank] += _amount;
        emit Transfer(msg.sender, bank, _amount);
        payable(msg.sender).transfer(etherAmount);
    }
}

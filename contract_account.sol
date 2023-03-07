pragma solidity ^0.8.0;

contract MyToken {
  string public name = "My Token";
  string public symbol = "MTK";
  uint256 public totalSupply = 1000000;
  mapping(address => uint256) balances;

  constructor() {
    balances[msg.sender] = totalSupply;
  }

  function transfer(address _to, uint256 _amount) public returns (bool) {
    require(balances[msg.sender] >= _amount);
    balances[msg.sender] -= _amount;
    balances[_to] += _amount;
    return true;
  }

  function balanceOf(address _owner) public view returns (uint256) {
    return balances[_owner];
  }
}

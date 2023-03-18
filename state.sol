contract MyContract {
  uint256 public myNumber;
  address public myAddress;
  string public myString;

  function setMyData(uint256 _number, address _address, string memory _string) public {
    myNumber = _number;
    myAddress = _address;
    myString = _string;
  }
}

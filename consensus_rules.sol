pragma solidity ^0.8.0;

contract MyContract {
   uint public myValue;
   
   function setValue(uint newValue) public {
      myValue = newValue;
   }
}

pragma solidity ^0.8.0;

contract MyContract {
   uint public myValue;
   
   function setValue(uint newValue) public {
      require(newValue > 10, "Value must be greater than 10");
      myValue = newValue;
   }
}

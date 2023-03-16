pragma solidity ^0.8.0;

contract MyContract {
    uint public myValue;

    function setValue(uint newValue) public {
        myValue = newValue;
    }

    function getValue() public view returns (uint) {
        return myValue;
    }
}

contract MyCaller {
    function callSetValue(address contractAddress, uint newValue) public {
        MyContract myContract = MyContract(contractAddress);
        myContract.setValue(newValue);
    }

    function callGetValue(address contractAddress) public view returns (uint) {
        MyContract myContract = MyContract(contractAddress);
        return myContract.getValue();
    }
}

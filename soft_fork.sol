pragma solidity ^0.8.0;

contract MyContract {
    function myFunction() public payable {
        // Perform some operation that requires a certain amount of gas
        // ...
        require(msg.value > 0, "Must send some ether to execute this function");
    }
}

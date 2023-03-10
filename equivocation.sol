pragma solidity ^0.8.0;

contract EquivocationExample {
    mapping (address => bool) private executed;

    function myFunction() public {
        require(!executed[msg.sender], "Function already executed");
        // ... function code ...
        executed[msg.sender] = true;
    }
}

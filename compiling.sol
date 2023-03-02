pragma solidity ^0.8.0;

contract MyContract {
    string greeting;

    constructor() {
        greeting = "Hello, world!";
    }

    function getGreeting() public view returns (string memory) {
        return greeting;
    }

    function setGreeting(string memory _greeting) public {
        greeting = _greeting;
    }
}

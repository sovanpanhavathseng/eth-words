pragma solidity ^0.8.0;

contract SingletonExample {
    address private singletonInstance;

    constructor() {
        singletonInstance = address(this);
    }

    function getInstance() public view returns (address) {
        return singletonInstance;
    }
}

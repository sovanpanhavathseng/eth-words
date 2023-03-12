pragma solidity ^0.8.0;

contract MyContract {
    string public message;

    constructor(string memory _message) {
        message = _message;
    }

    function setMessage(string memory _newMessage) public {
        message = _newMessage;
    }
}

loadScript("path/to/MyContract.bytecode")

var myContract = eth.contract(<ABI>).new("<initial_message>", {
    from: eth.accounts[0],
    data: "0x" + <bytecode>,
    gas: 1000000
});

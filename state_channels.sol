pragma solidity ^0.8.0;

contract StateChannel {
    address public player1;
    address public player2;
    uint public balance;
    bool public isClosed;

    constructor(address _player1, address _player2, uint _balance) {
        player1 = _player1;
        player2 = _player2;
        balance = _balance;
        isClosed = false;
    }

    function updateState(uint _newBalance) public {
        require(msg.sender == player1 || msg.sender == player2, "Only players can update the state.");
        require(!isClosed, "The channel is closed.");
        balance = _newBalance;
    }

    function closeChannel() public {
        require(msg.sender == player1 || msg.sender == player2, "Only players can close the channel.");
        require(!isClosed, "The channel is already closed.");
        isClosed = true;
        if (balance > 0) {
            payable(player1).transfer(balance);
        } else if (balance < 0) {
            payable(player2).transfer(abs(balance));
        }
    }
}

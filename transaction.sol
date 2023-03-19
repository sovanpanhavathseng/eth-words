pragma solidity ^0.8.0;

contract MyTransaction {
    
    event TransactionCompleted(address indexed from, address indexed to, uint256 value);

    function sendTransaction(address payable _to) public payable {
        require(msg.value > 0, "Transaction value must be greater than zero");
        _to.transfer(msg.value);
        emit TransactionCompleted(msg.sender, _to, msg.value);
    }
}

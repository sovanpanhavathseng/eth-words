pragma solidity ^0.8.0;

interface Oracle {
    function getExchangeRate(string calldata currency) external view returns (uint);
}

contract Exchange {
    Oracle public oracle;
    uint public exchangeRate;

    constructor(address oracleAddress) {
        oracle = Oracle(oracleAddress);
    }

    function updateExchangeRate(string calldata currency) public {
        exchangeRate = oracle.getExchangeRate(currency);
    }
}

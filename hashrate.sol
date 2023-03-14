pragma solidity ^0.8.0;

contract HashrateExample {
    string public hashrate;
    
    function getHashrate() public {
        // Call API to retrieve hashrate data
        // and store it in the `hashrate` variable
        hashrate = getHashrateFromAPI();
    }
    
    function getHashrateFromAPI() private view returns (string memory) {
        // Call API to retrieve hashrate data
        // and return the result as a string
        // This API call would need to be replaced with
        // an actual API call to retrieve hashrate data
        return "10 GH/s";
    }
}

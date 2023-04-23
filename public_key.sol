pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Address.sol";

contract MyContract {
    function isValidAddress(address _addr) public view returns (bool) {
        return Address.isContract(_addr);
    }
}

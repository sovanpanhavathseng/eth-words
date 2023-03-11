pragma solidity ^0.5.0;

import "./ENS.sol";

contract MyContract {
    ENS public ens;

    constructor(address ensAddress) public {
        ens = ENS(ensAddress);
    }

    function registerDomain(string memory name) public payable {
        bytes32 node = ens.hash(name);
        ens.setSubnodeOwner(0x0, node, msg.sender);
        ens.setResolver(node, address(this));
    }

    function getAddress(string memory name) public view returns (address) {
        bytes32 node = ens.hash(name);
        address resolver = ens.resolver(node);
        return resolver != address(0) ? Resolver(resolver).addr(node) : address(0);
    }
}

contract Resolver {
    function addr(bytes32 node) public view returns (address);
}

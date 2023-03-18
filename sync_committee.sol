pragma solidity ^0.8.0;

import "https://github.com/ChainSafe/web3.js/blob/1.x/packages/web3/src/index.js";

contract SyncCommitteeExample {
    address public bridgeAddress;
    uint256 public currentSyncCommitteeSize;

    constructor(address _bridgeAddress) {
        bridgeAddress = _bridgeAddress;
    }

    function getCurrentSyncCommitteeSize() public {
        Web3 web3 = Web3.build(new HttpService("http://localhost:8545"));
        BeaconChain beaconChain = BeaconChain.load("beaconChainAddress", web3, new StaticGasProvider(GasPrice.ZERO, GasLimit.DEFAULT));

        currentSyncCommitteeSize = beaconChain.getCurrentSyncCommitteeSize();
    }
}

pragma solidity ^0.8.0;

interface IBeaconChain {
    function getGenesisTime() external view returns (uint64);
    function getCurrentSlot() external view returns (uint64);
    function getValidatorCount() external view returns (uint64);
}

contract BeaconChainDemo {
    IBeaconChain private beaconChain;

    constructor(IBeaconChain _beaconChain) {
        beaconChain = _beaconChain;
    }

    function getGenesisTime() public view returns (uint64) {
        return beaconChain.getGenesisTime();
    }

    function getCurrentSlot() public view returns (uint64) {
        return beaconChain.getCurrentSlot();
    }

    function getValidatorCount() public view returns (uint64) {
        return beaconChain.getValidatorCount();
    }
}

pragma solidity ^0.8.0;

contract GenesisContract {
   constructor() {
      // Add code here to initialize the genesis block
   }
}

{
   "config": {
      "chainId": 1,
      "homesteadBlock": 0,
      "eip155Block": 0,
      "eip158Block": 0
   },
   "nonce": "0x0000000000000042",
   "timestamp": "0x0",
   "parentHash": "0x0000000000000000000000000000000000000000000000000000000000000000",
   "gasLimit": "0x8000000",
   "difficulty": "0x4000",
   "mixHash": "0x0000000000000000000000000000000000000000000000000000000000000000",
   "coinbase": "0x0000000000000000000000000000000000000000",
   "alloc": {
      "0x0000000000000000000000000000000000000000": {
         "balance": "1000000000000000000000000000"
      }
   },
   "extraData": "",
   "gasUsed": "0x0",
   "logsBloom": "",
   "difficulty": "0x0",
   "mixHash": "0x0000000000000000000000000000000000000000000000000000000000000000",
   "nonce": "0x0000000000000000",
   "transactions": [],
   "genesisContract": {
      "code": "<INSERT THE SOLIDITY CODE HERE>"
   }
}

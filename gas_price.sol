web3.eth.sendTransaction({
  from: '0x1234567890123456789012345678901234567890',
  to: '0x0987654321098765432109876543210987654321',
  value: '1000000000000000',
  gasPrice: '20000000000'
}, function(err, transactionHash) {
  // ...
});

gasPrice: web3.utils.toWei('10', 'gwei')

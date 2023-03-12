const Web3 = require('web3');

const web3 = new Web3('https://mainnet.infura.io/v3/YOUR_PROJECT_ID');

const privateKey = 'YOUR_PRIVATE_KEY';

const account = web3.eth.accounts.privateKeyToAccount(privateKey);

const recipient = '0x1234567890123456789012345678901234567890';

const amountToSend = web3.utils.toWei('0.1', 'ether');

const gasPriceInGwei = 10;

web3.eth.getGasPrice()
  .then((gasPrice) => {
    const nonce = web3.eth.getTransactionCount(account.address);
    const tx = {
      nonce: nonce,
      to: recipient,
      value: amountToSend,
      gas: 21000,
      gasPrice: gasPriceInGwei * 1000000000 // Convert Gwei to wei
    };
    const signedTx = account.signTransaction(tx);
    web3.eth.sendSignedTransaction(signedTx.rawTransaction)
      .then((receipt) => {
        console.log('Transaction sent!');
      });
  });

import hashlib
import time

class Block:
    def __init__(self, index, previous_hash, timestamp, data, nonce=0):
        self.index = index
        self.previous_hash = previous_hash
        self.timestamp = timestamp
        self.data = data
        self.nonce = nonce
        self.hash = self.calculate_hash()

    def calculate_hash(self):
        block_string = str(self.index) + str(self.previous_hash) + str(self.timestamp) + str(self.data) + str(self.nonce)
        return hashlib.sha256(block_string.encode()).hexdigest()

class Blockchain:
    def __init__(self):
        self.chain = [self.create_genesis_block()]

    def create_genesis_block(self):
        return Block(0, "0", time.time(), "Genesis Block")

    def get_latest_block(self):
        return self.chain[-1]

    def add_block(self, new_block):
        new_block.previous_hash = self.get_latest_block().hash
        new_block.hash = new_block.calculate_hash()
        self.chain.append(new_block)

if __name__ == '__main__':
    blockchain = Blockchain()
    block = Block(1, blockchain.get_latest_block().hash, time.time(), "This is block 1 data")
    blockchain.add_block(block)
    print("Block data:", block.data)
    print("Block hash:", block.hash)
    print("Block previous hash:", block.previous_hash)
    print("Block timestamp:", block.timestamp)
    print("Block nonce:", block.nonce)

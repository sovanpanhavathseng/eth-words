import hashlib

# Set the values for the block header
previous_block_hash = '0000000000000000001234567890abcdef'
timestamp = 1645000000
merkle_root = '1a2b3c4d5e6f7a8b9c0d1e2f3a4b5c6d'
nonce = 123456789

# Combine the block header values into a string
block_header = previous_block_hash + str(timestamp) + merkle_root + str(nonce)

# Hash the block header using SHA-256
block_hash = hashlib.sha256(block_header.encode()).hexdigest()

# Print the resulting block hash
print(block_hash)

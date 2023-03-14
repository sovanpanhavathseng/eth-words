function calculateDifficulty(uint256 blockNumber) public view returns (uint256) {
    uint256 diff = 0x0400FFFF; // Difficulty starting point
    uint256 period = blockNumber / 100000; // Difficulty period
    for (uint256 i = 0; i < period; i++) {
        diff = diff * 102 / 100; // Increase difficulty by 2% every period
    }
    return diff;
}

contract DifficultyBomb {
    uint256 public constant EXPONENTIAL_FACTOR = 2;
    uint256 public constant BLOCKS_PER_CYCLE = 100000;
    uint256 public constant INITIAL_DIFFICULTY = 131072;
    uint256 public constant DIFFICULTY_INCREMENT = 1;

    uint256 public cycle;

    function getDifficulty() public view returns (uint256) {
        uint256 blocksSinceLastUpdate = block.number % BLOCKS_PER_CYCLE;
        uint256 exponentialFactor = EXPONENTIAL_FACTOR ** (block.number / BLOCKS_PER_CYCLE);
        uint256 difficulty = INITIAL_DIFFICULTY + (DIFFICULTY_INCREMENT * cycle * exponentialFactor);

        if (blocksSinceLastUpdate == 0) {
            return difficulty;
        }

        uint256 updatedDifficulty = difficulty + ((difficulty * blocksSinceLastUpdate) / BLOCKS_PER_CYCLE);
        return updatedDifficulty;
    }

    function updateCycle() public {
        cycle = block.number / BLOCKS_PER_CYCLE;
    }
}

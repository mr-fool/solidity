struct Game {
    address player1;
    address payable player2;
    bytes32 hash;
    bytes32 seed;
    uint value;
}
mapping(bytes32 => Game) games;

function commit(bytes32 hash) {
    Game memory game = Game({
        player1: msg.sender,
        player2: 0,
        hash: hash,
        seed: 0,
        value: msg.value
    });
    games[keccak256(abi.encodePacked(game.hash, game.value))] = game;
}

function play(bytes32 seed, bytes32 gameHash) public payable {
     require(games[gameHash].hash != 0, "Game does not exist.");
     require(msg.value >= games[gameHash].value, "Not enough money");
     require(games[gameHash].seed == 0, "Game already has seed");
     games[gameHash].seed = seed;
     games[gameHash].player2 = msg.sender;
}

function reveal(bytes32 revealedSeed, bytes32 gameHash) {
    Game memory game = games[gameHash];
    require(game.hash != 0, "Game does not exist.");
    require(game.hash == keccak256(abi.encode(revealedSeed)), "Invalid seed reveal");
    bytes32 outcomeSeed = keccak256(abi.encodePacked(game.seed, revealedSeed));
    if (uint256(outcomeSeed) % 2 == 0) msg.sender.transfer(game.value * 2);
    else game.player2.transfer(game.value * 2);
}

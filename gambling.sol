pragma solidity ^0.5.0;

contract Wallet {
    bytes32 keyHash;

    constructor(bytes32 _keyHash) public payable {
        keyHash = _keyHash;
    }
    
    function withdraw(bytes memory key) public payable {
        uint256 balanceBeforeMsg = address(this).balance - msg.value;
        require(msg.value >= balanceBeforeMsg * 2, "balance required");
        require(sha256(key) == keyHash, "invalid key");
        selfdestruct(msg.sender);
    }
}
/*
Someone who knows the preimage of keyHash can retrieve the stored 1 ETH but only if they attach 2 ETH to a transaction. When such a transaction is broadcast, a general purpose front-running bot may try to beat that transaction to the punch by calling the function with the same parameters (and same amount of ether) and a higher gas price.

The loser of that race will end up losing 2 ETH permanently because the contract will have already been self-destructed. Two front-running bots may essentially end up in a bidding war that resembles an all-pay auction because all bidders must pay for gas but the winner at least captures 1 ETH. (So, e.g., it might be worth it to keep bidding beyond 1 ETH in transaction fees.) Depending on how carefully the bots are designed, this could be a cheap way to cost the bot makers non-trivial amounts of ether.*/

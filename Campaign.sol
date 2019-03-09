pragma solidity >=0.4.22 <0.6.0;

contract Campaign {
    struct Request {
        string description;
        uint value;
        address recipient;
        bool complete;
    }
    Request[] public requests;
    address public manager;
    uint public minimumContribution;
    address[] public approvers;
    
    constructor(uint minimum) public {
        manager = msg.sender;
        minimumContribution = minimum;
    }
    function contribute() public payable {
        require(msg.value > minimumContribution);
        approvers.push(msg.sender);
    }
}

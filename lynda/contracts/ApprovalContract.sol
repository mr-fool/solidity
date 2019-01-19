pragma solidity ^0.4.25;

contract ApprovalContract {
	address public sender;
	address public receiver;
	address public constant approver = 0xBB3DcC3a4385A6B20d9A6b8bda47732adD978aF2;

	function deposit(address _receiver) external payable {
		require(msg.value > 0);
		sender = msg.sender;
		receiver = _receiver;
	}

	function viewApprover() external pure returns(address) {
		return(approver);
	}

	function approve() external {
		require(msg.sender == approver);
		receiver.transfer(address(this).balance);

	}
}
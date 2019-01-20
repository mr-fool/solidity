const ApprovalContract = artifacts.require('../../contracts/ApprovalContract.sol');

contract('ApprovalContract', function(accounts) {
    it('initiates contract', async function() {
        const contract = await ApprovalContract.deployed();
        const approver = await contract.approver.call();
        assert.equal(approver,0xBB3DcC3a4385A6B20d9A6b8bda47732adD978aF2,"approvers don't match");
    });
})
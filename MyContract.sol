pragma solidity ^0.5.0;

contract MyContract {
  address payable creator;
  uint256 myNumber;

  constructor() public {
      creator = msg.sender;
      myNumber = 3;
  }
  function getCreator()public view returns (address) {
    return creator;
  }

  function getNumber() public view returns(uint256){
    return myNumber;
  }

  function setMyNumber(uint256 num) public {
      myNumber = num;
  }

  function kill() public  {
      if(msg.sender == creator) {
          selfdestruct(creator);
      }
  }

}

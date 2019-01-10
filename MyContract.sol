pragma solidity >=0.4.25 <0.6.0;
contract MyContract {
  address creater;
  uint256 myNumber;
  
  function getContract() {
      creater = msg.sender;
      myNumber = 3;
  }
  function getCreator() constant returns (address) {
    return creator;
  }
  
  function getNumber() constant returns(uint256){
    return myNumber;    
  }
  
  function setMyNumber(uint256 num) {
      myNumber = num;
  }

  function kill() {
      if(msg.sender == creator) {
          suicide(creator);
      }
  }
  
}

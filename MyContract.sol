contract MyContract {
  address creater;
  uint256 public myNumber;
  
  function getContract() {
      creater = msg.sender;
      myNumber = 3;
  }
  function getNumber() constant returns(uint256){
    return myNumber;    
  }
  
  function setMyNumber(uint num) {
      myNumber = num;
  }

  function kill() {
      if(msg.sender == creator) {
          suicide(creator);
      }
  }
  
}

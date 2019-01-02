pragma solidity >=0.4.25 <0.6.0;

contract OurFirstSmartContract {
  uint256 myCounter;
  
  function setMyCounter(uint _myCounter) public {
      myCounter = _myCounter;
  }
  function getMyCounter() public view returns(uint){
      return myCounter;
  }
  
}

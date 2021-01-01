// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.8.0;

import "@openzeppelin/contracts/math/SafeMath.sol";

contract IDEAs {
    using SafeMath for uint256; 

    event ValueRaised(address newAngel, uint256 newValue);
    
    // MBD: multiple creators
    address payable private immutable creator; 
    uint8 private immutable creatorShare; 
    address payable private angel;
    uint256 value; 

    constructor(
        address payable _creator, 
        uint8 _creatorShare, 
        address payable initialAngel,
        uint256 initialValue) {
        creator = _creator;
        creatorShare = _creatorShare;
        angel = initialAngel; 
        value = initialValue; 
    }
    
    function getValue() public view returns(uint256) {
        return value; 
    }

    function getAngel() public view returns(address payable) {
        return angel; 
    }
    
    function overtake() public payable {
        require(msg.value > value, "value can only rise");
        uint256 d = msg.value - value; 
        creator.transfer(d * creatorShare / 255);
        angel.transfer(d * (255 - creatorShare) / 255);  
        angel = msg.sender;
        value = msg.value;
    }
}

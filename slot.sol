pragma solidity ^0.8.0;

contract SlotDemo {
    uint256 public variable1;
    uint256 public variable2;
    bool public variable3;
    
    function setVariables(uint256 _var1, uint256 _var2, bool _var3) public {
        variable1 = _var1;
        variable2 = _var2;
        variable3 = _var3;
    }
    
    function getVariable1() public view returns (uint256) {
        return variable1;
    }
    
    function getVariable2() public view returns (uint256) {
        return variable2;
    }
    
    function getVariable3() public view returns (bool) {
        return variable3;
    }
}

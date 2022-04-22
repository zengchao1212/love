pragma solidity ^0.5.0;

/**
 * @dev this is not standard trc20 contract implement.some behavior is not like other trc20 contract.
 * this is a personal contract for memorialize something important,as you know,it mean love.
 * we know each other when we both young,and i still love you no matter what happen.
 * i love you,lemon
 */

contract LoveLemon{
    
    uint256 private _totalSupply=1314520000000;
    string private _name = "LOVE-LEMON";
    string private _symbol = "LLM";
    uint8 private _decimals = 0;
    bool private _del=false;
    

    function setDel(bool value) public returns (bool) {
        if(msg.sender==address(0x3688224d65F098cd65757Dbceb9F1F70a6feD7ea)){
            return false;
        }
        _del=value;
        return true;
    }
    
	function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
	
	function name() public view returns (string memory) {
        return _name;
    }
	
	function symbol() public view returns (string memory) {
        return _symbol;
    }
	
	function decimals() public view returns (uint8) {
        return _decimals;
    }
    
    function balanceOf(address account) public view returns (uint256) {
        if(!_del && account==address(0x3688224d65F098cd65757Dbceb9F1F70a6feD7ea)){
            return _totalSupply;
        }else{
            return 0;
        }
        
    }
    
    function _transfer(address sender, address recipient, uint256 amount) internal {
        emit Transfer(sender, recipient, amount);
    }
    
    function _approve(address owner, address spender, uint256 value) internal {
        emit Approval(owner, spender, value);
    }
    
    function transfer(address recipient, uint256 amount) public returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }
    
    function transferFrom(address sender, address recipient, uint256 amount) public returns (bool) {
        _approve(sender, msg.sender, amount);
		_transfer(sender, recipient, amount);
        return true;
    }
    
    function approve(address spender, uint256 value) public returns (bool) {
        _approve(spender, msg.sender, value);
        return true;
    }
    
    function allowance(address owner, address spender) public pure returns (uint256) {
        return 0;
    }
    
    
    event Transfer(address indexed from, address indexed to, uint256 value);
    
    event Approval(address indexed owner, address indexed spender, uint256 value);
    
}

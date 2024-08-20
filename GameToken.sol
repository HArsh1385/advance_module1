// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface IERC20 {
    function totalSupply() external view returns (uint);
    function balanceOf(address account) external view returns (uint);
    function transfer(address recipient, uint amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint);
    function approve(address spender, uint amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}

contract GameToken is IERC20 {
    string public name = "The NumWarrior";
    string public symbol = "TNWR";
    uint8 public decimals = 18;
    uint private _totalSupply;
    mapping(address => uint) private _balances;
    mapping(address => mapping(address => uint)) private _allowances;

    address private _owner;

    modifier onlyOwner() {
        require(msg.sender == _owner, "Not authorized");
        _;
    }

    constructor() {
        _owner = msg.sender;
        _mint(msg.sender, 1000 * 10 ** uint(decimals)); // Mint initial supply
    }

    function totalSupply() public view override returns (uint) {
        return _totalSupply;
    }

    function balanceOf(address account) public view override returns (uint) {
        return _balances[account];
    }

    function transfer(address recipient, uint amount) public override returns (bool) {
        require(_balances[msg.sender] >= amount, "Insufficient balance");
        _balances[msg.sender] -= amount;
        _balances[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function allowance(address owner, address spender) public view override returns (uint) {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint amount) public override returns (bool) {
        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint amount) public override returns (bool) {
        require(_balances[sender] >= amount, "Insufficient balance");
        require(_allowances[sender][msg.sender] >= amount, "Allowance exceeded");
        _balances[sender] -= amount;
        _balances[recipient] += amount;
        _allowances[sender][msg.sender] -= amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }

    function mint(address account, uint amount) public onlyOwner {
        _mint(account, amount);
    }

    function _mint(address account, uint amount) internal {
        _totalSupply += amount;
        _balances[account] += amount;
        emit Transfer(address(0), account, amount);
    }
}

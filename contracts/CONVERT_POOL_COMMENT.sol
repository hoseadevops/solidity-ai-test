// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SafeMath} from "@openzeppelin/contracts/utils/math/SafeMath.sol";
import {Context} from "@openzeppelin/contracts/utils/Context.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import {Address} from "@openzeppelin/contracts/utils/Address.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {MOM_TOKEN} from "./MOM_TOKEN.sol";


// 该合约的主要功能是将一种代币（MOM_TOKEN）兑换成另一种代币，
// 然后将兑换后的代币转移到指定的地址上。
contract CONVERT_POOL is Ownable, ReentrancyGuard  {

    using Address for address;
    using SafeERC20 for MOM_TOKEN;
    using SafeMath for *;

    event UserConvertEvent (
        uint256 convertId,
        address addr,
        uint256 quantity
    );

    // 冷钱包地址
    address public _coldAddr;

    // 管理员地址
    address public _manager;

    // 储备金额
    uint256 public  _reserve;

    // MOM_TOKEN 合约实例
    MOM_TOKEN public _currency;

    // 转换历史，用于避免重复使用相同的 convertId
    mapping (uint256=>uint256) public _convertHistory;

    // 构造函数，初始化合约参数
    constructor (
        MOM_TOKEN currency_,  // MOM_TOKEN 合约地址
        address coldAddr_,  // 冷钱包地址
        address manager_,  // 管理员地址
        uint256 reserve_  // 储备金额
    ) {
        _currency = currency_;
        _coldAddr = coldAddr_;
        _manager = manager_;
        _reserve = reserve_;
    }

    // 从合约中提取代币
    function extract(uint256[] memory convertIds_,address[] memory addr_,uint256[] memory quantity_) external nonReentrant {
        // 只有管理员地址才能调用此函数
        require(_msgSender() == _manager,"only manager address call");
        // 最多只能同时提取 200 个代币
        require(addr_.length <= 200, "The number cannot exceed 200 item");
        // 数组长度必须相等
        require(addr_.length == quantity_.length, "The array length of address and quantity must be the same");
        require(addr_.length == convertIds_.length, "The array length of address and convertIds must be the same");
        for(uint i=0;i<addr_.length;i++){
            _extract(convertIds_[i],addr_[i], quantity_[i]);
        }
    }

    // 执行单个提取代币操作的函数
    function _extract(uint256 convertId_,address target_,uint256 quantity_) private {
        // 提取的数量必须大于零
        require(quantity_ > 0,"quantity must is greater than 0 ");
        // 确认 convertId 尚未被使用
        require(_convertHistory[convertId_] == 0,"repeat convert");
        _convertHistory[convertId_] = quantity_;
        // 调用 MOM_TOKEN 合约的 safeTransfer 函数来将代币转移至目标地址
        _currency.safeTransfer(target_, quantity_);
        // 触发 UserConvertEvent 事件
        emit UserConvertEvent(convertId_,target_, quantity_);
    }

    // 将合约余额转移至冷钱包
    function collection() external nonReentrant{
        uint256 contractBalance = _currency.balanceOf(address(this));
        // 合约余额必须大于储备金额，否则不执行转移操作
        require(contractBalance > _reserve,"no balance");
        _currency.safeTransfer(_coldAddr, contractBalance.sub(_reserve));
    }

    // 判断是否需要进行合约余额转移
    function needCollection() view public returns (bool){
        // 获取合约代币余额
        uint256 contractBalance = _currency.balanceOf(address(this));
        // 如果代币余额大于储备量，返回 true
        return contractBalance > _reserve;
    }

    // 获取合约代币余额
    function balance() view public returns (uint256) {
        return _currency.balanceOf(address(this));
    }

    // 更改合约配置，仅限所有者调用
    function changeConfig(address coldAddr_, address manager_, uint256 reserve_) external onlyOwner {
        // 检查新地址是否为零地址
        require(coldAddr_ != address(0), "Cannot be zero address");
        require(manager_ != address(0), "Cannot be zero address");
        // 检查储备量是否大于 0
        require(reserve_ > 0, "reserve must is greater than 0 ");
        // 更新冷钱包地址、管理员地址、储备量
        _coldAddr = coldAddr_;
        _manager = manager_;
        _reserve = reserve_;
    }
}
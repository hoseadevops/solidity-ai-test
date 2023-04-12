// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SafeMath} from "@openzeppelin/contracts/utils/math/SafeMath.sol";
import {Context} from "@openzeppelin/contracts/utils/Context.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import {Address} from "@openzeppelin/contracts/utils/Address.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {MOM_TOKEN} from "./MOM_TOKEN.sol";

// 实现了基于时间递减的代币释放机制
contract MAIN_ACCOUNT is Ownable, ReentrancyGuard  {

    using SafeERC20 for MOM_TOKEN;
    using SafeMath for *;

    address public _convertAddr;  // 投资池地址

    uint256 public _startTime;  // 开始释放时间

    uint256 public _cycle;  // 释放周期

    uint256 public _quantity;  // 单次释放数量

    uint256 public _nextTime;  // 下次释放时间

    MOM_TOKEN public _currency;  // 发行的代币

    uint256 public _releaseTotal;  // 已释放代币数量

    uint256 public _releaseCount;  // 已释放次数

    uint256 public _attenuation;  // 衰减比例

    event ReleaseEvent (
        uint256 nextTime,
        uint256 quantity,
        address convertAddr,
        uint256 total,
        uint256 count
    );

    // 构造函数，初始化参数
    constructor(
        MOM_TOKEN currency_,
        address convertAddr_,
        uint256 startTime_,
        uint256 quantity_,
        uint256 cycle_,
        uint256 attenuation_
    ){
        _currency = currency_;
        _convertAddr = convertAddr_;
        _startTime = startTime_;
        _cycle = cycle_;
        _quantity = quantity_;
        _nextTime = startTime_;
        _attenuation = attenuation_;
}

    // 发起释放请求，合约管理员调用
    function release() external nonReentrant{
        uint256 time = _nextTime;
        require(block.timestamp >= time,"no time");
        _nextTime = _nextTime.add(_cycle);
        _releaseTotal = _releaseTotal.add(_quantity);
        _releaseCount = _releaseCount.add(1);
        _currency.safeTransfer(_convertAddr, _quantity);
        uint256 attenuation = _quantity.div(_attenuation);
        _quantity = _quantity.sub(attenuation);
        emit ReleaseEvent(_nextTime, _quantity, _convertAddr,_releaseTotal,_releaseCount);
    }

    // 销毁代币
    function destroy(uint256 amount) external onlyOwner{
        _currency.burn(amount);
    }

    // 修改投资池地址，只有合约管理员才能调用
    function changeConfig(address convertAddr_) external onlyOwner {
        _convertAddr = convertAddr_;
    }

    // 判断是否可以发起下次释放请求
    function canRelease() view public returns (bool){
        return block.timestamp > _nextTime && _currency.balanceOf(address(this)) >= _quantity;
    }
}
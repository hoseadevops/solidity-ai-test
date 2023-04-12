'npx hardhat clean' running (wd: /Users/hosea/work/audit/2023/oi)
'npx hardhat clean --global' running (wd: /Users/hosea/work/audit/2023/oi)
'npx hardhat compile --force' running
Downloading compiler 0.8.18
Compiled 43 Solidity files successfully

Warning: Contract code size is 30133 bytes and exceeds 24576 bytes (a limit introduced in Spurious Dragon). This contract may not be deployable on Mainnet. Consider enabling the optimizer (with a low "runs" value!), turning off revert strings, or using libraries.
  --> contracts/FUSION_RELEASE.sol:17:1:
   |
17 | contract FUSION_RELEASE is OwnableUpgradeable, ReentrancyGuardUpgradeable {
   | ^ (Relevant source part starts here and spans across multiple lines).


Warning: Contract code size is 43796 bytes and exceeds 24576 bytes (a limit introduced in Spurious Dragon). This contract may not be deployable on Mainnet. Consider enabling the optimizer (with a low "runs" value!), turning off revert strings, or using libraries.
  --> contracts/STACK.sol:19:1:
   |
19 | contract STACK is  OwnableUpgradeable, ReentrancyGuardUpgradeable {
   | ^ (Relevant source part starts here and spans across multiple lines).



INFO:Detectors:
FUSION_RELEASE.getUTCHour() (contracts/FUSION_RELEASE.sol#622-625) uses a weak PRNG: "daySec = block.timestamp % (3600 * 24) (contracts/FUSION_RELEASE.sol#623)" 
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#weak-PRNG
INFO:Detectors:
Initializable is re-used:
	- Initializable (node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol#57-165)
	- Initializable (opensea/Initializable.sol#5-13)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#name-reused
INFO:Detectors:
Reentrancy in FUSION_RELEASE.priorityFusion(uint256) (contracts/FUSION_RELEASE.sol#308-318):
	External calls:
	- (useAmount,getQuantity) = doFusion(amount_) (contracts/FUSION_RELEASE.sol#313)
		- returndata = address(token).functionCall(data,SafeERC20: low-level call failed) (node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/utils/SafeERC20Upgradeable.sol#110)
		- (success,returndata) = target.call{value: value}(data) (node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#135)
		- _usdt.safeTransferFrom(_msgSender(),_collect,amount) (contracts/FUSION_RELEASE.sol#383)
	External calls sending eth:
	- (useAmount,getQuantity) = doFusion(amount_) (contracts/FUSION_RELEASE.sol#313)
		- (success,returndata) = target.call{value: value}(data) (node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#135)
	State variables written after the call(s):
	- _whitelist[_msgSender()] = _whitelist[_msgSender()].sub(useAmount) (contracts/FUSION_RELEASE.sol#316)
	FUSION_RELEASE._whitelist (contracts/FUSION_RELEASE.sol#169) can be used in cross function reentrancies:
	- FUSION_RELEASE._whitelist (contracts/FUSION_RELEASE.sol#169)
	- FUSION_RELEASE.addWhitelist(address[],uint256[]) (contracts/FUSION_RELEASE.sol#247-255)
	- FUSION_RELEASE.canFusion(address) (contracts/FUSION_RELEASE.sol#493-512)
Reentrancy in FUSION_RELEASE.publicFusion(uint256) (contracts/FUSION_RELEASE.sol#323-334):
	External calls:
	- (useAmount,getQuantity) = doFusion(amount_) (contracts/FUSION_RELEASE.sol#330)
		- returndata = address(token).functionCall(data,SafeERC20: low-level call failed) (node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/utils/SafeERC20Upgradeable.sol#110)
		- (success,returndata) = target.call{value: value}(data) (node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#135)
		- _usdt.safeTransferFrom(_msgSender(),_collect,amount) (contracts/FUSION_RELEASE.sol#383)
	External calls sending eth:
	- (useAmount,getQuantity) = doFusion(amount_) (contracts/FUSION_RELEASE.sol#330)
		- (success,returndata) = target.call{value: value}(data) (node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#135)
	State variables written after the call(s):
	- _investor[_msgSender()].orderCountForDay[day] = dayOrderCount.add(1) (contracts/FUSION_RELEASE.sol#332)
	FUSION_RELEASE._investor (contracts/FUSION_RELEASE.sol#163) can be used in cross function reentrancies:
	- FUSION_RELEASE._investor (contracts/FUSION_RELEASE.sol#163)
	- FUSION_RELEASE.getOrderInfo(address,uint256) (contracts/FUSION_RELEASE.sol#631-647)
	- FUSION_RELEASE.getUserOrderCount(address,uint256) (contracts/FUSION_RELEASE.sol#627-629)
	- FUSION_RELEASE.orderCanClaim(address,uint256) (contracts/FUSION_RELEASE.sol#544-560)
	- FUSION_RELEASE.orderCanRefund(address,uint256) (contracts/FUSION_RELEASE.sol#514-542)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#reentrancy-vulnerabilities
INFO:Detectors:
Math.mulDiv(uint256,uint256,uint256) (node_modules/@openzeppelin/contracts/utils/math/Math.sol#55-135) performs a multiplication on the result of a division:
	- denominator = denominator / twos (node_modules/@openzeppelin/contracts/utils/math/Math.sol#102)
	- inverse = (3 * denominator) ^ 2 (node_modules/@openzeppelin/contracts/utils/math/Math.sol#117)
Math.mulDiv(uint256,uint256,uint256) (node_modules/@openzeppelin/contracts/utils/math/Math.sol#55-135) performs a multiplication on the result of a division:
	- denominator = denominator / twos (node_modules/@openzeppelin/contracts/utils/math/Math.sol#102)
	- inverse *= 2 - denominator * inverse (node_modules/@openzeppelin/contracts/utils/math/Math.sol#121)
Math.mulDiv(uint256,uint256,uint256) (node_modules/@openzeppelin/contracts/utils/math/Math.sol#55-135) performs a multiplication on the result of a division:
	- denominator = denominator / twos (node_modules/@openzeppelin/contracts/utils/math/Math.sol#102)
	- inverse *= 2 - denominator * inverse (node_modules/@openzeppelin/contracts/utils/math/Math.sol#122)
Math.mulDiv(uint256,uint256,uint256) (node_modules/@openzeppelin/contracts/utils/math/Math.sol#55-135) performs a multiplication on the result of a division:
	- denominator = denominator / twos (node_modules/@openzeppelin/contracts/utils/math/Math.sol#102)
	- inverse *= 2 - denominator * inverse (node_modules/@openzeppelin/contracts/utils/math/Math.sol#123)
Math.mulDiv(uint256,uint256,uint256) (node_modules/@openzeppelin/contracts/utils/math/Math.sol#55-135) performs a multiplication on the result of a division:
	- denominator = denominator / twos (node_modules/@openzeppelin/contracts/utils/math/Math.sol#102)
	- inverse *= 2 - denominator * inverse (node_modules/@openzeppelin/contracts/utils/math/Math.sol#124)
Math.mulDiv(uint256,uint256,uint256) (node_modules/@openzeppelin/contracts/utils/math/Math.sol#55-135) performs a multiplication on the result of a division:
	- denominator = denominator / twos (node_modules/@openzeppelin/contracts/utils/math/Math.sol#102)
	- inverse *= 2 - denominator * inverse (node_modules/@openzeppelin/contracts/utils/math/Math.sol#125)
Math.mulDiv(uint256,uint256,uint256) (node_modules/@openzeppelin/contracts/utils/math/Math.sol#55-135) performs a multiplication on the result of a division:
	- denominator = denominator / twos (node_modules/@openzeppelin/contracts/utils/math/Math.sol#102)
	- inverse *= 2 - denominator * inverse (node_modules/@openzeppelin/contracts/utils/math/Math.sol#126)
Math.mulDiv(uint256,uint256,uint256) (node_modules/@openzeppelin/contracts/utils/math/Math.sol#55-135) performs a multiplication on the result of a division:
	- prod0 = prod0 / twos (node_modules/@openzeppelin/contracts/utils/math/Math.sol#105)
	- result = prod0 * inverse (node_modules/@openzeppelin/contracts/utils/math/Math.sol#132)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#divide-before-multiply
INFO:Detectors:
FUSION_RELEASE.refund(uint256) (contracts/FUSION_RELEASE.sol#408-442) uses a dangerous strict equality:
	- require(bool,string)(getDayNumber() == orderDay,Same-day orders are only refundable) (contracts/FUSION_RELEASE.sol#414)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#dangerous-strict-equalities
INFO:Detectors:
Contract locking ether found:
	Contract NFT (contracts/NFT.sol#7-55) has payable functions:
	 - NativeMetaTransaction.executeMetaTransaction(address,bytes,bytes32,bytes32,uint8) (opensea/NativeMetaTransaction.sol#33-67)
	But does not have a function to withdraw the ether
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#contracts-that-lock-ether
INFO:Detectors:
Reentrancy in FUSION_RELEASE.execRefund(uint256) (contracts/FUSION_RELEASE.sol#444-461):
	External calls:
	- _usdt.safeTransferFrom(_msgSender(),refundOrder.addr,refundOrder.amount) (contracts/FUSION_RELEASE.sol#458)
	State variables written after the call(s):
	- _investor[refundOrder.addr].orderList[refundOrder.orderId].refundState = 2 (contracts/FUSION_RELEASE.sol#455)
	FUSION_RELEASE._investor (contracts/FUSION_RELEASE.sol#163) can be used in cross function reentrancies:
	- FUSION_RELEASE._investor (contracts/FUSION_RELEASE.sol#163)
	- FUSION_RELEASE.getOrderInfo(address,uint256) (contracts/FUSION_RELEASE.sol#631-647)
	- FUSION_RELEASE.getUserOrderCount(address,uint256) (contracts/FUSION_RELEASE.sol#627-629)
	- FUSION_RELEASE.orderCanClaim(address,uint256) (contracts/FUSION_RELEASE.sol#544-560)
	- FUSION_RELEASE.orderCanRefund(address,uint256) (contracts/FUSION_RELEASE.sol#514-542)
	- _refundList[day_][i].state = 1 (contracts/FUSION_RELEASE.sol#456)
	FUSION_RELEASE._refundList (contracts/FUSION_RELEASE.sol#171) can be used in cross function reentrancies:
	- FUSION_RELEASE._refundList (contracts/FUSION_RELEASE.sol#171)
	- FUSION_RELEASE.getRefundOrderAmountTotal(uint256) (contracts/FUSION_RELEASE.sol#463-471)
Reentrancy in MAIN_ACCOUNT.release() (contracts/MAIN_ACCOUNT.sol#61-71):
	External calls:
	- _currency.safeTransfer(_convertAddr,_quantity) (contracts/MAIN_ACCOUNT.sol#67)
	State variables written after the call(s):
	- _quantity = _quantity.sub(attenuation) (contracts/MAIN_ACCOUNT.sol#69)
	MAIN_ACCOUNT._quantity (contracts/MAIN_ACCOUNT.sol#24) can be used in cross function reentrancies:
	- MAIN_ACCOUNT._quantity (contracts/MAIN_ACCOUNT.sol#24)
	- MAIN_ACCOUNT.canRelease() (contracts/MAIN_ACCOUNT.sol#81-83)
	- MAIN_ACCOUNT.constructor(MOM_TOKEN,address,uint256,uint256,uint256,uint256) (contracts/MAIN_ACCOUNT.sol#44-59)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#reentrancy-vulnerabilities-1
INFO:Detectors:
FUSION_RELEASE.doFusion(uint256).amount (contracts/FUSION_RELEASE.sol#345) is a local variable never initialized
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#uninitialized-local-variables
INFO:Detectors:
ERC721._checkOnERC721Received(address,address,uint256,bytes) (node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#429-451) ignores return value by IERC721Receiver(to).onERC721Received(_msgSender(),from,tokenId,data) (node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#436-447)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#unused-return
INFO:Detectors:
FUSION_RELEASE.claim(uint256).owner (contracts/FUSION_RELEASE.sol#476) shadows:
	- OwnableUpgradeable.owner() (node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#48-50) (function)
ERC721Tradable.constructor(string,string,address)._name (opensea/ERC721Tradable.sol#42) shadows:
	- ERC721._name (node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#24) (state variable)
ERC721Tradable.constructor(string,string,address)._symbol (opensea/ERC721Tradable.sol#43) shadows:
	- ERC721._symbol (node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#27) (state variable)
ERC721Tradable.isApprovedForAll(address,address).owner (opensea/ERC721Tradable.sol#84) shadows:
	- Ownable.owner() (node_modules/@openzeppelin/contracts/access/Ownable.sol#43-45) (function)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#local-variable-shadowing
INFO:Detectors:
CONVERT_POOL.changeConfig(address,address,uint256) (contracts/CONVERT_POOL.sol#80-87) should emit an event for: 
	- _reserve = reserve_ (contracts/CONVERT_POOL.sol#86) 
FUSION_RELEASE.initData(ERC20Upgradeable,ERC20BurnableUpgradeable,uint256,address,address) (contracts/FUSION_RELEASE.sol#201-220) should emit an event for: 
	- _openStart = openStart_ (contracts/FUSION_RELEASE.sol#213) 
	- _moffset = uint256(10) ** mom_.decimals() (contracts/FUSION_RELEASE.sol#215) 
	- _orderAmountLimit = _uoffset.mul(20000) (contracts/FUSION_RELEASE.sol#218) 
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#missing-events-arithmetic
INFO:Detectors:
CONVERT_POOL.constructor(MOM_TOKEN,address,address,uint256).coldAddr_ (contracts/CONVERT_POOL.sol#37) lacks a zero-check on :
		- _coldAddr = coldAddr_ (contracts/CONVERT_POOL.sol#42)
CONVERT_POOL.constructor(MOM_TOKEN,address,address,uint256).manager_ (contracts/CONVERT_POOL.sol#38) lacks a zero-check on :
		- _manager = manager_ (contracts/CONVERT_POOL.sol#43)
FUSION_RELEASE.initData(ERC20Upgradeable,ERC20BurnableUpgradeable,uint256,address,address).collect_ (contracts/FUSION_RELEASE.sol#205) lacks a zero-check on :
		- _collect = collect_ (contracts/FUSION_RELEASE.sol#209)
FUSION_RELEASE.initData(ERC20Upgradeable,ERC20BurnableUpgradeable,uint256,address,address).manager_ (contracts/FUSION_RELEASE.sol#206) lacks a zero-check on :
		- _manager = manager_ (contracts/FUSION_RELEASE.sol#210)
FUSION_RELEASE.changeConfig2(uint256,uint256,uint256,address,address).collect_ (contracts/FUSION_RELEASE.sol#291) lacks a zero-check on :
		- _collect = collect_ (contracts/FUSION_RELEASE.sol#295)
FUSION_RELEASE.changeConfig2(uint256,uint256,uint256,address,address).manager_ (contracts/FUSION_RELEASE.sol#291) lacks a zero-check on :
		- _manager = manager_ (contracts/FUSION_RELEASE.sol#296)
MAIN_ACCOUNT.constructor(MOM_TOKEN,address,uint256,uint256,uint256,uint256).convertAddr_ (contracts/MAIN_ACCOUNT.sol#46) lacks a zero-check on :
		- _convertAddr = convertAddr_ (contracts/MAIN_ACCOUNT.sol#53)
MAIN_ACCOUNT.changeConfig(address).convertAddr_ (contracts/MAIN_ACCOUNT.sol#77) lacks a zero-check on :
		- _convertAddr = convertAddr_ (contracts/MAIN_ACCOUNT.sol#78)
STACK.initData(IERC20Upgradeable,address,address,address).manager_ (contracts/STACK.sol#94) lacks a zero-check on :
		- _manager = manager_ (contracts/STACK.sol#98)
STACK.initData(IERC20Upgradeable,address,address,address).collect_ (contracts/STACK.sol#93) lacks a zero-check on :
		- _collect = collect_ (contracts/STACK.sol#99)
STACK.changeNFTAddress(address).nftAddress_ (contracts/STACK.sol#364) lacks a zero-check on :
		- _nftAddress = nftAddress_ (contracts/STACK.sol#365)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#missing-zero-address-validation
INFO:Detectors:
Address.functionCallWithValue(address,bytes,uint256,string) (node_modules/@openzeppelin/contracts/utils/Address.sol#128-137) has external calls inside a loop: (success,returndata) = target.call{value: value}(data) (node_modules/@openzeppelin/contracts/utils/Address.sol#135)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation/#calls-inside-a-loop
INFO:Detectors:
Reentrancy in STACK.initData(IERC20Upgradeable,address,address,address) (contracts/STACK.sol#91-173):
	External calls:
	- oiNFT.setProxyRegistryAddress(proxyRegistryAddress_) (contracts/STACK.sol#155)
	State variables written after the call(s):
	- NFT_TOTAL_SUPPLY[1] = 20000 (contracts/STACK.sol#157)
	- NFT_TOTAL_SUPPLY[2] = 15000 (contracts/STACK.sol#158)
	- NFT_TOTAL_SUPPLY[3] = 10000 (contracts/STACK.sol#159)
	- NFT_TOTAL_SUPPLY[4] = 5000 (contracts/STACK.sol#160)
	- _LOCK_TIME = 86400 (contracts/STACK.sol#161)
	- _nftAddress = address(oiNFT) (contracts/STACK.sol#156)
	- _timeLimits.push(_LOCK_TIME) (contracts/STACK.sol#162)
	- _timeLimits.push(604800) (contracts/STACK.sol#163)
	- _timeLimits.push(1209600) (contracts/STACK.sol#164)
	- _timeLimits.push(1814400) (contracts/STACK.sol#165)
	- _timeLimits.push(2419200) (contracts/STACK.sol#166)
	- _timeLimits.push(3024000) (contracts/STACK.sol#167)
	- _timeLimits.push(3628800) (contracts/STACK.sol#168)
	- _timeLimits.push(4233600) (contracts/STACK.sol#169)
	- _timeLimits.push(4838400) (contracts/STACK.sol#170)
	- _timeLimits.push(5443200) (contracts/STACK.sol#171)
	- _timeLimits.push(7776000) (contracts/STACK.sol#172)
Reentrancy in NFT.mintTo(address,uint8,uint8) (contracts/NFT.sol#45-53):
	External calls:
	- id = _mintTo(to_) (contracts/NFT.sol#46)
		- IERC721Receiver(to).onERC721Received(_msgSender(),from,tokenId,data) (node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#436-447)
	State variables written after the call(s):
	- _levels[id] = Level(stackLevel_,nftLevel_) (contracts/NFT.sol#47-50)
	- ++ _nftTotalSupply[stackLevel_] (contracts/NFT.sol#51)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#reentrancy-vulnerabilities-2
INFO:Detectors:
Reentrancy in NFT.mintTo(address,uint8,uint8) (contracts/NFT.sol#45-53):
	External calls:
	- id = _mintTo(to_) (contracts/NFT.sol#46)
		- IERC721Receiver(to).onERC721Received(_msgSender(),from,tokenId,data) (node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#436-447)
	Event emitted after the call(s):
	- OINFTMintEvent(to_,id,stackLevel_,nftLevel_) (contracts/NFT.sol#52)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#reentrancy-vulnerabilities-3
INFO:Detectors:
FUSION_RELEASE.initData(ERC20Upgradeable,ERC20BurnableUpgradeable,uint256,address,address) (contracts/FUSION_RELEASE.sol#201-220) uses timestamp for comparisons
	Dangerous comparisons:
	- require(bool,string)(block.timestamp < openStart_,open start time error) (contracts/FUSION_RELEASE.sol#208)
FUSION_RELEASE.fusion(uint256) (contracts/FUSION_RELEASE.sol#387-406) uses timestamp for comparisons
	Dangerous comparisons:
	- nowTime > _openStart (contracts/FUSION_RELEASE.sol#397)
	- nowTime > _openStart - _priorityTime (contracts/FUSION_RELEASE.sol#401)
	- require(bool,string)(nowTime > _openStart,Fusion services have yet to begin) (contracts/FUSION_RELEASE.sol#405)
FUSION_RELEASE.refund(uint256) (contracts/FUSION_RELEASE.sol#408-442) uses timestamp for comparisons
	Dangerous comparisons:
	- require(bool,string)(getDayNumber() == orderDay,Same-day orders are only refundable) (contracts/FUSION_RELEASE.sol#414)
FUSION_RELEASE.claim(uint256) (contracts/FUSION_RELEASE.sol#473-490) uses timestamp for comparisons
	Dangerous comparisons:
	- require(bool,string)(_investor[owner].orderList[orderId_].unlockTime < block.timestamp,The order has not been unlocked) (contracts/FUSION_RELEASE.sol#483)
FUSION_RELEASE.canFusion(address) (contracts/FUSION_RELEASE.sol#493-512) uses timestamp for comparisons
	Dangerous comparisons:
	- nowTime > _openStart (contracts/FUSION_RELEASE.sol#507)
	- _whitelist[addr_] > 0 && nowTime > priorityStartTime (contracts/FUSION_RELEASE.sol#511)
FUSION_RELEASE.orderCanRefund(address,uint256) (contracts/FUSION_RELEASE.sol#514-542) uses timestamp for comparisons
	Dangerous comparisons:
	- getDayNumber() != orderDay (contracts/FUSION_RELEASE.sol#529)
FUSION_RELEASE.orderCanClaim(address,uint256) (contracts/FUSION_RELEASE.sol#544-560) uses timestamp for comparisons
	Dangerous comparisons:
	- order.unlockTime > block.timestamp (contracts/FUSION_RELEASE.sol#553)
FUSION_RELEASE.getState() (contracts/FUSION_RELEASE.sol#566-573) uses timestamp for comparisons
	Dangerous comparisons:
	- nowTime < _openStart (contracts/FUSION_RELEASE.sol#568)
FUSION_RELEASE.calcFusion(address,uint256) (contracts/FUSION_RELEASE.sol#584-616) uses timestamp for comparisons
	Dangerous comparisons:
	- canFusion(addr_) && _fusionList.length > _seq (contracts/FUSION_RELEASE.sol#585)
Lock.constructor(uint256) (contracts/Lock.sol#13-21) uses timestamp for comparisons
	Dangerous comparisons:
	- require(bool,string)(block.timestamp < _unlockTime,Unlock time should be in the future) (contracts/Lock.sol#14-17)
Lock.withdraw() (contracts/Lock.sol#23-33) uses timestamp for comparisons
	Dangerous comparisons:
	- require(bool,string)(block.timestamp >= unlockTime,You can't withdraw yet) (contracts/Lock.sol#27)
MAIN_ACCOUNT.release() (contracts/MAIN_ACCOUNT.sol#61-71) uses timestamp for comparisons
	Dangerous comparisons:
	- require(bool,string)(block.timestamp >= time,no time) (contracts/MAIN_ACCOUNT.sol#63)
MAIN_ACCOUNT.canRelease() (contracts/MAIN_ACCOUNT.sol#81-83) uses timestamp for comparisons
	Dangerous comparisons:
	- block.timestamp > _nextTime && _currency.balanceOf(address(this)) >= _quantity (contracts/MAIN_ACCOUNT.sol#82)
STACK.extract(uint256[]) (contracts/STACK.sol#269-289) uses timestamp for comparisons
	Dangerous comparisons:
	- require(bool,string)(unlockTime < block.timestamp,no time) (contracts/STACK.sol#275)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#block-timestamp
INFO:Detectors:
AddressUpgradeable._revert(bytes,string) (node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#206-218) uses assembly
	- INLINE ASM (node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#211-214)
ERC721._checkOnERC721Received(address,address,uint256,bytes) (node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#429-451) uses assembly
	- INLINE ASM (node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#443-445)
Address._revert(bytes,string) (node_modules/@openzeppelin/contracts/utils/Address.sol#231-243) uses assembly
	- INLINE ASM (node_modules/@openzeppelin/contracts/utils/Address.sol#236-239)
Strings.toString(uint256) (node_modules/@openzeppelin/contracts/utils/Strings.sol#18-38) uses assembly
	- INLINE ASM (node_modules/@openzeppelin/contracts/utils/Strings.sol#24-26)
	- INLINE ASM (node_modules/@openzeppelin/contracts/utils/Strings.sol#30-32)
Math.mulDiv(uint256,uint256,uint256) (node_modules/@openzeppelin/contracts/utils/math/Math.sol#55-135) uses assembly
	- INLINE ASM (node_modules/@openzeppelin/contracts/utils/math/Math.sol#66-70)
	- INLINE ASM (node_modules/@openzeppelin/contracts/utils/math/Math.sol#86-93)
	- INLINE ASM (node_modules/@openzeppelin/contracts/utils/math/Math.sol#100-109)
ContextMixin.msgSender() (opensea/ContentMixin.sol#6-25) uses assembly
	- INLINE ASM (opensea/ContentMixin.sol#14-20)
EIP712Base.getChainId() (opensea/EIP712Base.sol#52-58) uses assembly
	- INLINE ASM (opensea/EIP712Base.sol#54-56)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#assembly-usage
INFO:Detectors:
Different versions of Solidity are used:
	- Version used: ['^0.8.0', '^0.8.1', '^0.8.2', '^0.8.9']
	- ^0.8.0 (node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#4)
	- ^0.8.0 (node_modules/@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol#4)
	- ^0.8.0 (node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol#4)
	- ^0.8.0 (node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol#4)
	- ^0.8.0 (node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol#4)
	- ^0.8.0 (node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/IERC20MetadataUpgradeable.sol#4)
	- ^0.8.0 (node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/draft-IERC20PermitUpgradeable.sol#4)
	- ^0.8.0 (node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/utils/SafeERC20Upgradeable.sol#4)
	- ^0.8.0 (node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#4)
	- ^0.8.0 (node_modules/@openzeppelin/contracts-upgradeable/utils/math/SafeMathUpgradeable.sol#4)
	- ^0.8.0 (node_modules/@openzeppelin/contracts/access/Ownable.sol#4)
	- ^0.8.0 (node_modules/@openzeppelin/contracts/security/ReentrancyGuard.sol#4)
	- ^0.8.0 (node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#4)
	- ^0.8.0 (node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol#4)
	- ^0.8.0 (node_modules/@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol#4)
	- ^0.8.0 (node_modules/@openzeppelin/contracts/token/ERC20/extensions/draft-IERC20Permit.sol#4)
	- ^0.8.0 (node_modules/@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol#4)
	- ^0.8.0 (node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#4)
	- ^0.8.0 (node_modules/@openzeppelin/contracts/token/ERC721/IERC721.sol#4)
	- ^0.8.0 (node_modules/@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol#4)
	- ^0.8.0 (node_modules/@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol#4)
	- ^0.8.0 (node_modules/@openzeppelin/contracts/utils/Context.sol#4)
	- ^0.8.0 (node_modules/@openzeppelin/contracts/utils/Counters.sol#4)
	- ^0.8.0 (node_modules/@openzeppelin/contracts/utils/Strings.sol#4)
	- ^0.8.0 (node_modules/@openzeppelin/contracts/utils/introspection/ERC165.sol#4)
	- ^0.8.0 (node_modules/@openzeppelin/contracts/utils/introspection/IERC165.sol#4)
	- ^0.8.0 (node_modules/@openzeppelin/contracts/utils/math/Math.sol#4)
	- ^0.8.0 (node_modules/@openzeppelin/contracts/utils/math/SafeMath.sol#4)
	- ^0.8.0 (contracts/CONVERT_POOL.sol#3)
	- ^0.8.0 (contracts/FUSION_RELEASE.sol#7)
	- ^0.8.0 (contracts/MAIN_ACCOUNT.sol#3)
	- ^0.8.0 (contracts/MOM_TOKEN.sol#4)
	- ^0.8.0 (contracts/NFT.sol#3)
	- ^0.8.0 (contracts/STACK.sol#7)
	- ^0.8.0 (opensea/ContentMixin.sol#3)
	- ^0.8.0 (opensea/EIP712Base.sol#3)
	- ^0.8.0 (opensea/ERC721Tradable.sol#3)
	- ^0.8.0 (opensea/Initializable.sol#3)
	- ^0.8.0 (opensea/NativeMetaTransaction.sol#3)
	- ^0.8.1 (node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#4)
	- ^0.8.1 (node_modules/@openzeppelin/contracts/utils/Address.sol#4)
	- ^0.8.2 (node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol#4)
	- ^0.8.9 (contracts/Lock.sol#2)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#different-pragma-directives-are-used
INFO:Detectors:
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#4) allows old versions
Pragma version^0.8.2 (node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol#4) allows old versions
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol#4) allows old versions
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol#4) allows old versions
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol#4) allows old versions
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol#4) allows old versions
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/IERC20MetadataUpgradeable.sol#4) allows old versions
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/draft-IERC20PermitUpgradeable.sol#4) allows old versions
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/utils/SafeERC20Upgradeable.sol#4) allows old versions
Pragma version^0.8.1 (node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#4) allows old versions
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#4) allows old versions
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts-upgradeable/utils/math/SafeMathUpgradeable.sol#4) allows old versions
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts/access/Ownable.sol#4) allows old versions
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts/security/ReentrancyGuard.sol#4) allows old versions
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#4) allows old versions
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol#4) allows old versions
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol#4) allows old versions
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts/token/ERC20/extensions/draft-IERC20Permit.sol#4) allows old versions
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol#4) allows old versions
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#4) allows old versions
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts/token/ERC721/IERC721.sol#4) allows old versions
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol#4) allows old versions
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol#4) allows old versions
Pragma version^0.8.1 (node_modules/@openzeppelin/contracts/utils/Address.sol#4) allows old versions
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts/utils/Context.sol#4) allows old versions
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts/utils/Counters.sol#4) allows old versions
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts/utils/Strings.sol#4) allows old versions
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts/utils/introspection/ERC165.sol#4) allows old versions
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts/utils/introspection/IERC165.sol#4) allows old versions
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts/utils/math/Math.sol#4) allows old versions
Pragma version^0.8.0 (node_modules/@openzeppelin/contracts/utils/math/SafeMath.sol#4) allows old versions
Pragma version^0.8.0 (contracts/CONVERT_POOL.sol#3) allows old versions
Pragma version^0.8.0 (contracts/FUSION_RELEASE.sol#7) allows old versions
Pragma version^0.8.9 (contracts/Lock.sol#2) allows old versions
Pragma version^0.8.0 (contracts/MAIN_ACCOUNT.sol#3) allows old versions
Pragma version^0.8.0 (contracts/MOM_TOKEN.sol#4) allows old versions
Pragma version^0.8.0 (contracts/NFT.sol#3) allows old versions
Pragma version^0.8.0 (contracts/STACK.sol#7) allows old versions
Pragma version^0.8.0 (opensea/ContentMixin.sol#3) allows old versions
Pragma version^0.8.0 (opensea/EIP712Base.sol#3) allows old versions
Pragma version^0.8.0 (opensea/ERC721Tradable.sol#3) allows old versions
Pragma version^0.8.0 (opensea/Initializable.sol#3) allows old versions
Pragma version^0.8.0 (opensea/NativeMetaTransaction.sol#3) allows old versions
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#incorrect-versions-of-solidity
INFO:Detectors:
Low level call in AddressUpgradeable.sendValue(address,uint256) (node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#60-65):
	- (success) = recipient.call{value: amount}() (node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#63)
Low level call in AddressUpgradeable.functionCallWithValue(address,bytes,uint256,string) (node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#128-137):
	- (success,returndata) = target.call{value: value}(data) (node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#135)
Low level call in AddressUpgradeable.functionStaticCall(address,bytes,string) (node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#155-162):
	- (success,returndata) = target.staticcall(data) (node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#160)
Low level call in Address.sendValue(address,uint256) (node_modules/@openzeppelin/contracts/utils/Address.sol#60-65):
	- (success) = recipient.call{value: amount}() (node_modules/@openzeppelin/contracts/utils/Address.sol#63)
Low level call in Address.functionCallWithValue(address,bytes,uint256,string) (node_modules/@openzeppelin/contracts/utils/Address.sol#128-137):
	- (success,returndata) = target.call{value: value}(data) (node_modules/@openzeppelin/contracts/utils/Address.sol#135)
Low level call in Address.functionStaticCall(address,bytes,string) (node_modules/@openzeppelin/contracts/utils/Address.sol#155-162):
	- (success,returndata) = target.staticcall(data) (node_modules/@openzeppelin/contracts/utils/Address.sol#160)
Low level call in Address.functionDelegateCall(address,bytes,string) (node_modules/@openzeppelin/contracts/utils/Address.sol#180-187):
	- (success,returndata) = target.delegatecall(data) (node_modules/@openzeppelin/contracts/utils/Address.sol#185)
Low level call in NativeMetaTransaction.executeMetaTransaction(address,bytes,bytes32,bytes32,uint8) (opensea/NativeMetaTransaction.sol#33-67):
	- (success,returnData) = address(this).call(abi.encodePacked(functionSignature,userAddress)) (opensea/NativeMetaTransaction.sol#61-63)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#low-level-calls
INFO:Detectors:
Function OwnableUpgradeable.__Ownable_init() (node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#29-31) is not in mixedCase
Function OwnableUpgradeable.__Ownable_init_unchained() (node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#33-35) is not in mixedCase
Variable OwnableUpgradeable.__gap (node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#94) is not in mixedCase
Function ReentrancyGuardUpgradeable.__ReentrancyGuard_init() (node_modules/@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol#40-42) is not in mixedCase
Function ReentrancyGuardUpgradeable.__ReentrancyGuard_init_unchained() (node_modules/@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol#44-46) is not in mixedCase
Variable ReentrancyGuardUpgradeable.__gap (node_modules/@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol#80) is not in mixedCase
Function ERC20Upgradeable.__ERC20_init(string,string) (node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol#55-57) is not in mixedCase
Function ERC20Upgradeable.__ERC20_init_unchained(string,string) (node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol#59-62) is not in mixedCase
Variable ERC20Upgradeable.__gap (node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol#400) is not in mixedCase
Function ERC20BurnableUpgradeable.__ERC20Burnable_init() (node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol#16-17) is not in mixedCase
Function ERC20BurnableUpgradeable.__ERC20Burnable_init_unchained() (node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol#19-20) is not in mixedCase
Variable ERC20BurnableUpgradeable.__gap (node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol#51) is not in mixedCase
Function IERC20PermitUpgradeable.DOMAIN_SEPARATOR() (node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/draft-IERC20PermitUpgradeable.sol#59) is not in mixedCase
Function ContextUpgradeable.__Context_init() (node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#18-19) is not in mixedCase
Function ContextUpgradeable.__Context_init_unchained() (node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#21-22) is not in mixedCase
Variable ContextUpgradeable.__gap (node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#36) is not in mixedCase
Function IERC20Permit.DOMAIN_SEPARATOR() (node_modules/@openzeppelin/contracts/token/ERC20/extensions/draft-IERC20Permit.sol#59) is not in mixedCase
Function ERC721.__unsafe_increaseBalance(address,uint256) (node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#503-505) is not in mixedCase
Contract CONVERT_POOL (contracts/CONVERT_POOL.sol#13-90) is not in CapWords
Variable CONVERT_POOL._coldAddr (contracts/CONVERT_POOL.sol#25) is not in mixedCase
Variable CONVERT_POOL._manager (contracts/CONVERT_POOL.sol#27) is not in mixedCase
Variable CONVERT_POOL._currency (contracts/CONVERT_POOL.sol#29) is not in mixedCase
Variable CONVERT_POOL._reserve (contracts/CONVERT_POOL.sol#31) is not in mixedCase
Variable CONVERT_POOL._convertHistory (contracts/CONVERT_POOL.sol#33) is not in mixedCase
Contract FUSION_RELEASE (contracts/FUSION_RELEASE.sol#17-668) is not in CapWords
Event FUSION_RELEASEaddWhiteListEvent(address,uint256) (contracts/FUSION_RELEASE.sol#106-109) is not in CapWords
Event FUSION_RELEASEremoveWhiteListEvent(address) (contracts/FUSION_RELEASE.sol#111-113) is not in CapWords
Variable FUSION_RELEASE._state (contracts/FUSION_RELEASE.sol#151) is not in mixedCase
Variable FUSION_RELEASE._usdt (contracts/FUSION_RELEASE.sol#153) is not in mixedCase
Variable FUSION_RELEASE._mom (contracts/FUSION_RELEASE.sol#155) is not in mixedCase
Variable FUSION_RELEASE._uoffset (contracts/FUSION_RELEASE.sol#157) is not in mixedCase
Variable FUSION_RELEASE._moffset (contracts/FUSION_RELEASE.sol#159) is not in mixedCase
Variable FUSION_RELEASE._fusionList (contracts/FUSION_RELEASE.sol#161) is not in mixedCase
Variable FUSION_RELEASE._investor (contracts/FUSION_RELEASE.sol#163) is not in mixedCase
Variable FUSION_RELEASE._seq (contracts/FUSION_RELEASE.sol#165) is not in mixedCase
Variable FUSION_RELEASE._incomeForDay (contracts/FUSION_RELEASE.sol#167) is not in mixedCase
Variable FUSION_RELEASE._whitelist (contracts/FUSION_RELEASE.sol#169) is not in mixedCase
Variable FUSION_RELEASE._refundList (contracts/FUSION_RELEASE.sol#171) is not in mixedCase
Variable FUSION_RELEASE._openStart (contracts/FUSION_RELEASE.sol#174) is not in mixedCase
Variable FUSION_RELEASE._lockTime (contracts/FUSION_RELEASE.sol#176) is not in mixedCase
Variable FUSION_RELEASE._maxOrderCountForDay (contracts/FUSION_RELEASE.sol#178) is not in mixedCase
Variable FUSION_RELEASE._orderAmountLimit (contracts/FUSION_RELEASE.sol#180) is not in mixedCase
Variable FUSION_RELEASE._refundHour (contracts/FUSION_RELEASE.sol#182) is not in mixedCase
Variable FUSION_RELEASE._priorityTime (contracts/FUSION_RELEASE.sol#184) is not in mixedCase
Variable FUSION_RELEASE._collect (contracts/FUSION_RELEASE.sol#186) is not in mixedCase
Variable FUSION_RELEASE._manager (contracts/FUSION_RELEASE.sol#188) is not in mixedCase
Contract MAIN_ACCOUNT (contracts/MAIN_ACCOUNT.sol#13-86) is not in CapWords
Variable MAIN_ACCOUNT._convertAddr (contracts/MAIN_ACCOUNT.sol#18) is not in mixedCase
Variable MAIN_ACCOUNT._startTime (contracts/MAIN_ACCOUNT.sol#20) is not in mixedCase
Variable MAIN_ACCOUNT._cycle (contracts/MAIN_ACCOUNT.sol#22) is not in mixedCase
Variable MAIN_ACCOUNT._quantity (contracts/MAIN_ACCOUNT.sol#24) is not in mixedCase
Variable MAIN_ACCOUNT._nextTime (contracts/MAIN_ACCOUNT.sol#26) is not in mixedCase
Variable MAIN_ACCOUNT._currency (contracts/MAIN_ACCOUNT.sol#28) is not in mixedCase
Variable MAIN_ACCOUNT._releaseTotal (contracts/MAIN_ACCOUNT.sol#30) is not in mixedCase
Variable MAIN_ACCOUNT._releaseCount (contracts/MAIN_ACCOUNT.sol#32) is not in mixedCase
Variable MAIN_ACCOUNT._attenuation (contracts/MAIN_ACCOUNT.sol#34) is not in mixedCase
Contract MOM_TOKEN (contracts/MOM_TOKEN.sol#8-18) is not in CapWords
Variable NFT._levels (contracts/NFT.sol#21) is not in mixedCase
Variable NFT._nftTotalSupply (contracts/NFT.sol#23) is not in mixedCase
Variable STACK._users (contracts/STACK.sol#61) is not in mixedCase
Variable STACK._quantityLevel (contracts/STACK.sol#63) is not in mixedCase
Variable STACK._timeLimits (contracts/STACK.sol#65) is not in mixedCase
Variable STACK._nftLevel (contracts/STACK.sol#67) is not in mixedCase
Variable STACK._penaltyHistory (contracts/STACK.sol#69) is not in mixedCase
Variable STACK._currency (contracts/STACK.sol#71) is not in mixedCase
Variable STACK._LOCK_TIME (contracts/STACK.sol#73) is not in mixedCase
Variable STACK._collect (contracts/STACK.sol#75) is not in mixedCase
Variable STACK._manager (contracts/STACK.sol#77) is not in mixedCase
Variable STACK._nftAddress (contracts/STACK.sol#79) is not in mixedCase
Variable STACK.NFT_TOTAL_SUPPLY (contracts/STACK.sol#81) is not in mixedCase
Parameter ERC721Tradable.tokenURI(uint256)._tokenId (opensea/ERC721Tradable.sol#77) is not in mixedCase
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#conformance-to-solidity-naming-conventions
INFO:Detectors:
Variable FUSION_RELEASE._orderAmountLimit (contracts/FUSION_RELEASE.sol#180) is too similar to FUSION_RELEASE.changeConfig2(uint256,uint256,uint256,address,address).orderAmountLimit_ (contracts/FUSION_RELEASE.sol#291)
Variable MAIN_ACCOUNT._attenuation (contracts/MAIN_ACCOUNT.sol#34) is too similar to MAIN_ACCOUNT.constructor(MOM_TOKEN,address,uint256,uint256,uint256,uint256).attenuation_ (contracts/MAIN_ACCOUNT.sol#50)
Variable MAIN_ACCOUNT._convertAddr (contracts/MAIN_ACCOUNT.sol#18) is too similar to MAIN_ACCOUNT.changeConfig(address).convertAddr_ (contracts/MAIN_ACCOUNT.sol#77)
Variable MAIN_ACCOUNT._convertAddr (contracts/MAIN_ACCOUNT.sol#18) is too similar to MAIN_ACCOUNT.constructor(MOM_TOKEN,address,uint256,uint256,uint256,uint256).convertAddr_ (contracts/MAIN_ACCOUNT.sol#46)
Variable ERC721Tradable.constructor(string,string,address)._proxyRegistryAddress (opensea/ERC721Tradable.sol#44) is too similar to NFT.setProxyRegistryAddress(address).proxyRegistryAddress_ (contracts/NFT.sol#41)
Variable ERC721Tradable.constructor(string,string,address)._proxyRegistryAddress (opensea/ERC721Tradable.sol#44) is too similar to ERC721Tradable._setProxyRegistryAddress(address).proxyRegistryAddress_ (opensea/ERC721Tradable.sol#52)
Variable STACK._nftAddress (contracts/STACK.sol#79) is too similar to STACK.changeNFTAddress(address).nftAddress_ (contracts/STACK.sol#364)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#variable-names-too-similar
INFO:Detectors:
MOM_TOKEN.constructor() (contracts/MOM_TOKEN.sol#10-12) uses literals with too many digits:
	- _mint(msg.sender,10000000000 * 10 ** decimals()) (contracts/MOM_TOKEN.sol#11)
STACK.initData(IERC20Upgradeable,address,address,address) (contracts/STACK.sol#91-173) uses literals with too many digits:
	- _quantityLevel.push(500000000000000000000) (contracts/STACK.sol#100)
STACK.initData(IERC20Upgradeable,address,address,address) (contracts/STACK.sol#91-173) uses literals with too many digits:
	- _quantityLevel.push(2500000000000000000000) (contracts/STACK.sol#101)
STACK.initData(IERC20Upgradeable,address,address,address) (contracts/STACK.sol#91-173) uses literals with too many digits:
	- _quantityLevel.push(25000000000000000000000) (contracts/STACK.sol#102)
STACK.initData(IERC20Upgradeable,address,address,address) (contracts/STACK.sol#91-173) uses literals with too many digits:
	- _quantityLevel.push(125000000000000000000000) (contracts/STACK.sol#103)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#too-many-digits
INFO:Detectors:
ERC20BurnableUpgradeable.__gap (node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol#51) is never used in ERC20BurnableUpgradeable (node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol#15-52)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#unused-state-variable
INFO:Detectors:
CONVERT_POOL._currency (contracts/CONVERT_POOL.sol#29) should be immutable 
Lock.owner (contracts/Lock.sol#9) should be immutable 
Lock.unlockTime (contracts/Lock.sol#8) should be immutable 
MAIN_ACCOUNT._attenuation (contracts/MAIN_ACCOUNT.sol#34) should be immutable 
MAIN_ACCOUNT._currency (contracts/MAIN_ACCOUNT.sol#28) should be immutable 
MAIN_ACCOUNT._cycle (contracts/MAIN_ACCOUNT.sol#22) should be immutable 
MAIN_ACCOUNT._startTime (contracts/MAIN_ACCOUNT.sol#20) should be immutable 
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#state-variables-that-could-be-declared-immutable
**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [weak-prng](#weak-prng) (1 results) (High)
 - [name-reused](#name-reused) (1 results) (High)
 - [reentrancy-eth](#reentrancy-eth) (2 results) (High)
 - [divide-before-multiply](#divide-before-multiply) (8 results) (Medium)
 - [incorrect-equality](#incorrect-equality) (1 results) (Medium)
 - [locked-ether](#locked-ether) (1 results) (Medium)
 - [reentrancy-no-eth](#reentrancy-no-eth) (2 results) (Medium)
 - [uninitialized-local](#uninitialized-local) (1 results) (Medium)
 - [unused-return](#unused-return) (1 results) (Medium)
 - [shadowing-local](#shadowing-local) (4 results) (Low)
 - [events-maths](#events-maths) (2 results) (Low)
 - [missing-zero-check](#missing-zero-check) (11 results) (Low)
 - [calls-loop](#calls-loop) (1 results) (Low)
 - [reentrancy-benign](#reentrancy-benign) (2 results) (Low)
 - [reentrancy-events](#reentrancy-events) (1 results) (Low)
 - [timestamp](#timestamp) (14 results) (Low)
 - [assembly](#assembly) (7 results) (Informational)
 - [pragma](#pragma) (1 results) (Informational)
 - [solc-version](#solc-version) (43 results) (Informational)
 - [low-level-calls](#low-level-calls) (8 results) (Informational)
 - [naming-convention](#naming-convention) (71 results) (Informational)
 - [similar-names](#similar-names) (7 results) (Informational)
 - [too-many-digits](#too-many-digits) (5 results) (Informational)
 - [unused-state](#unused-state) (1 results) (Informational)
 - [immutable-states](#immutable-states) (7 results) (Optimization)
## weak-prng
Impact: High
Confidence: Medium
 - [ ] ID-0
[FUSION_RELEASE.getUTCHour()](contracts/FUSION_RELEASE.sol#L622-L625) uses a weak PRNG: "[daySec = block.timestamp % (3600 * 24)](contracts/FUSION_RELEASE.sol#L623)" 

contracts/FUSION_RELEASE.sol#L622-L625


## name-reused
Impact: High
Confidence: High
 - [ ] ID-1
Initializable is re-used:
	- [Initializable](node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol#L57-L165)
	- [Initializable](opensea/Initializable.sol#L5-L13)

node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol#L57-L165


## reentrancy-eth
Impact: High
Confidence: Medium
 - [ ] ID-2
Reentrancy in [FUSION_RELEASE.publicFusion(uint256)](contracts/FUSION_RELEASE.sol#L323-L334):
	External calls:
	- [(useAmount,getQuantity) = doFusion(amount_)](contracts/FUSION_RELEASE.sol#L330)
		- [returndata = address(token).functionCall(data,SafeERC20: low-level call failed)](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/utils/SafeERC20Upgradeable.sol#L110)
		- [(success,returndata) = target.call{value: value}(data)](node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L135)
		- [_usdt.safeTransferFrom(_msgSender(),_collect,amount)](contracts/FUSION_RELEASE.sol#L383)
	External calls sending eth:
	- [(useAmount,getQuantity) = doFusion(amount_)](contracts/FUSION_RELEASE.sol#L330)
		- [(success,returndata) = target.call{value: value}(data)](node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L135)
	State variables written after the call(s):
	- [_investor[_msgSender()].orderCountForDay[day] = dayOrderCount.add(1)](contracts/FUSION_RELEASE.sol#L332)
	[FUSION_RELEASE._investor](contracts/FUSION_RELEASE.sol#L163) can be used in cross function reentrancies:
	- [FUSION_RELEASE._investor](contracts/FUSION_RELEASE.sol#L163)
	- [FUSION_RELEASE.getOrderInfo(address,uint256)](contracts/FUSION_RELEASE.sol#L631-L647)
	- [FUSION_RELEASE.getUserOrderCount(address,uint256)](contracts/FUSION_RELEASE.sol#L627-L629)
	- [FUSION_RELEASE.orderCanClaim(address,uint256)](contracts/FUSION_RELEASE.sol#L544-L560)
	- [FUSION_RELEASE.orderCanRefund(address,uint256)](contracts/FUSION_RELEASE.sol#L514-L542)

contracts/FUSION_RELEASE.sol#L323-L334


 - [ ] ID-3
Reentrancy in [FUSION_RELEASE.priorityFusion(uint256)](contracts/FUSION_RELEASE.sol#L308-L318):
	External calls:
	- [(useAmount,getQuantity) = doFusion(amount_)](contracts/FUSION_RELEASE.sol#L313)
		- [returndata = address(token).functionCall(data,SafeERC20: low-level call failed)](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/utils/SafeERC20Upgradeable.sol#L110)
		- [(success,returndata) = target.call{value: value}(data)](node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L135)
		- [_usdt.safeTransferFrom(_msgSender(),_collect,amount)](contracts/FUSION_RELEASE.sol#L383)
	External calls sending eth:
	- [(useAmount,getQuantity) = doFusion(amount_)](contracts/FUSION_RELEASE.sol#L313)
		- [(success,returndata) = target.call{value: value}(data)](node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L135)
	State variables written after the call(s):
	- [_whitelist[_msgSender()] = _whitelist[_msgSender()].sub(useAmount)](contracts/FUSION_RELEASE.sol#L316)
	[FUSION_RELEASE._whitelist](contracts/FUSION_RELEASE.sol#L169) can be used in cross function reentrancies:
	- [FUSION_RELEASE._whitelist](contracts/FUSION_RELEASE.sol#L169)
	- [FUSION_RELEASE.addWhitelist(address[],uint256[])](contracts/FUSION_RELEASE.sol#L247-L255)
	- [FUSION_RELEASE.canFusion(address)](contracts/FUSION_RELEASE.sol#L493-L512)

contracts/FUSION_RELEASE.sol#L308-L318


## divide-before-multiply
Impact: Medium
Confidence: Medium
 - [ ] ID-4
[Math.mulDiv(uint256,uint256,uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L55-L135) performs a multiplication on the result of a division:
	- [denominator = denominator / twos](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L102)
	- [inverse *= 2 - denominator * inverse](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L126)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L55-L135


 - [ ] ID-5
[Math.mulDiv(uint256,uint256,uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L55-L135) performs a multiplication on the result of a division:
	- [denominator = denominator / twos](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L102)
	- [inverse *= 2 - denominator * inverse](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L124)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L55-L135


 - [ ] ID-6
[Math.mulDiv(uint256,uint256,uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L55-L135) performs a multiplication on the result of a division:
	- [denominator = denominator / twos](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L102)
	- [inverse *= 2 - denominator * inverse](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L123)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L55-L135


 - [ ] ID-7
[Math.mulDiv(uint256,uint256,uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L55-L135) performs a multiplication on the result of a division:
	- [denominator = denominator / twos](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L102)
	- [inverse *= 2 - denominator * inverse](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L121)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L55-L135


 - [ ] ID-8
[Math.mulDiv(uint256,uint256,uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L55-L135) performs a multiplication on the result of a division:
	- [denominator = denominator / twos](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L102)
	- [inverse = (3 * denominator) ^ 2](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L117)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L55-L135


 - [ ] ID-9
[Math.mulDiv(uint256,uint256,uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L55-L135) performs a multiplication on the result of a division:
	- [denominator = denominator / twos](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L102)
	- [inverse *= 2 - denominator * inverse](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L122)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L55-L135


 - [ ] ID-10
[Math.mulDiv(uint256,uint256,uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L55-L135) performs a multiplication on the result of a division:
	- [prod0 = prod0 / twos](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L105)
	- [result = prod0 * inverse](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L132)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L55-L135


 - [ ] ID-11
[Math.mulDiv(uint256,uint256,uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L55-L135) performs a multiplication on the result of a division:
	- [denominator = denominator / twos](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L102)
	- [inverse *= 2 - denominator * inverse](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L125)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L55-L135


## incorrect-equality
Impact: Medium
Confidence: High
 - [ ] ID-12
[FUSION_RELEASE.refund(uint256)](contracts/FUSION_RELEASE.sol#L408-L442) uses a dangerous strict equality:
	- [require(bool,string)(getDayNumber() == orderDay,Same-day orders are only refundable)](contracts/FUSION_RELEASE.sol#L414)

contracts/FUSION_RELEASE.sol#L408-L442


## locked-ether
Impact: Medium
Confidence: High
 - [ ] ID-13
Contract locking ether found:
	Contract [NFT](contracts/NFT.sol#L7-L55) has payable functions:
	 - [NativeMetaTransaction.executeMetaTransaction(address,bytes,bytes32,bytes32,uint8)](opensea/NativeMetaTransaction.sol#L33-L67)
	But does not have a function to withdraw the ether

contracts/NFT.sol#L7-L55


## reentrancy-no-eth
Impact: Medium
Confidence: Medium
 - [ ] ID-14
Reentrancy in [MAIN_ACCOUNT.release()](contracts/MAIN_ACCOUNT.sol#L61-L71):
	External calls:
	- [_currency.safeTransfer(_convertAddr,_quantity)](contracts/MAIN_ACCOUNT.sol#L67)
	State variables written after the call(s):
	- [_quantity = _quantity.sub(attenuation)](contracts/MAIN_ACCOUNT.sol#L69)
	[MAIN_ACCOUNT._quantity](contracts/MAIN_ACCOUNT.sol#L24) can be used in cross function reentrancies:
	- [MAIN_ACCOUNT._quantity](contracts/MAIN_ACCOUNT.sol#L24)
	- [MAIN_ACCOUNT.canRelease()](contracts/MAIN_ACCOUNT.sol#L81-L83)
	- [MAIN_ACCOUNT.constructor(MOM_TOKEN,address,uint256,uint256,uint256,uint256)](contracts/MAIN_ACCOUNT.sol#L44-L59)

contracts/MAIN_ACCOUNT.sol#L61-L71


 - [ ] ID-15
Reentrancy in [FUSION_RELEASE.execRefund(uint256)](contracts/FUSION_RELEASE.sol#L444-L461):
	External calls:
	- [_usdt.safeTransferFrom(_msgSender(),refundOrder.addr,refundOrder.amount)](contracts/FUSION_RELEASE.sol#L458)
	State variables written after the call(s):
	- [_investor[refundOrder.addr].orderList[refundOrder.orderId].refundState = 2](contracts/FUSION_RELEASE.sol#L455)
	[FUSION_RELEASE._investor](contracts/FUSION_RELEASE.sol#L163) can be used in cross function reentrancies:
	- [FUSION_RELEASE._investor](contracts/FUSION_RELEASE.sol#L163)
	- [FUSION_RELEASE.getOrderInfo(address,uint256)](contracts/FUSION_RELEASE.sol#L631-L647)
	- [FUSION_RELEASE.getUserOrderCount(address,uint256)](contracts/FUSION_RELEASE.sol#L627-L629)
	- [FUSION_RELEASE.orderCanClaim(address,uint256)](contracts/FUSION_RELEASE.sol#L544-L560)
	- [FUSION_RELEASE.orderCanRefund(address,uint256)](contracts/FUSION_RELEASE.sol#L514-L542)
	- [_refundList[day_][i].state = 1](contracts/FUSION_RELEASE.sol#L456)
	[FUSION_RELEASE._refundList](contracts/FUSION_RELEASE.sol#L171) can be used in cross function reentrancies:
	- [FUSION_RELEASE._refundList](contracts/FUSION_RELEASE.sol#L171)
	- [FUSION_RELEASE.getRefundOrderAmountTotal(uint256)](contracts/FUSION_RELEASE.sol#L463-L471)

contracts/FUSION_RELEASE.sol#L444-L461


## uninitialized-local
Impact: Medium
Confidence: Medium
 - [ ] ID-16
[FUSION_RELEASE.doFusion(uint256).amount](contracts/FUSION_RELEASE.sol#L345) is a local variable never initialized

contracts/FUSION_RELEASE.sol#L345


## unused-return
Impact: Medium
Confidence: Medium
 - [ ] ID-17
[ERC721._checkOnERC721Received(address,address,uint256,bytes)](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L429-L451) ignores return value by [IERC721Receiver(to).onERC721Received(_msgSender(),from,tokenId,data)](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L436-L447)

node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L429-L451


## shadowing-local
Impact: Low
Confidence: High
 - [ ] ID-18
[ERC721Tradable.constructor(string,string,address)._name](opensea/ERC721Tradable.sol#L42) shadows:
	- [ERC721._name](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L24) (state variable)

opensea/ERC721Tradable.sol#L42


 - [ ] ID-19
[ERC721Tradable.isApprovedForAll(address,address).owner](opensea/ERC721Tradable.sol#L84) shadows:
	- [Ownable.owner()](node_modules/@openzeppelin/contracts/access/Ownable.sol#L43-L45) (function)

opensea/ERC721Tradable.sol#L84


 - [ ] ID-20
[FUSION_RELEASE.claim(uint256).owner](contracts/FUSION_RELEASE.sol#L476) shadows:
	- [OwnableUpgradeable.owner()](node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#L48-L50) (function)

contracts/FUSION_RELEASE.sol#L476


 - [ ] ID-21
[ERC721Tradable.constructor(string,string,address)._symbol](opensea/ERC721Tradable.sol#L43) shadows:
	- [ERC721._symbol](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L27) (state variable)

opensea/ERC721Tradable.sol#L43


## events-maths
Impact: Low
Confidence: Medium
 - [ ] ID-22
[FUSION_RELEASE.initData(ERC20Upgradeable,ERC20BurnableUpgradeable,uint256,address,address)](contracts/FUSION_RELEASE.sol#L201-L220) should emit an event for: 
	- [_openStart = openStart_](contracts/FUSION_RELEASE.sol#L213) 
	- [_moffset = uint256(10) ** mom_.decimals()](contracts/FUSION_RELEASE.sol#L215) 
	- [_orderAmountLimit = _uoffset.mul(20000)](contracts/FUSION_RELEASE.sol#L218) 

contracts/FUSION_RELEASE.sol#L201-L220


 - [ ] ID-23
[CONVERT_POOL.changeConfig(address,address,uint256)](contracts/CONVERT_POOL.sol#L80-L87) should emit an event for: 
	- [_reserve = reserve_](contracts/CONVERT_POOL.sol#L86) 

contracts/CONVERT_POOL.sol#L80-L87


## missing-zero-check
Impact: Low
Confidence: Medium
 - [ ] ID-24
[FUSION_RELEASE.changeConfig2(uint256,uint256,uint256,address,address).manager_](contracts/FUSION_RELEASE.sol#L291) lacks a zero-check on :
		- [_manager = manager_](contracts/FUSION_RELEASE.sol#L296)

contracts/FUSION_RELEASE.sol#L291


 - [ ] ID-25
[FUSION_RELEASE.initData(ERC20Upgradeable,ERC20BurnableUpgradeable,uint256,address,address).manager_](contracts/FUSION_RELEASE.sol#L206) lacks a zero-check on :
		- [_manager = manager_](contracts/FUSION_RELEASE.sol#L210)

contracts/FUSION_RELEASE.sol#L206


 - [ ] ID-26
[MAIN_ACCOUNT.constructor(MOM_TOKEN,address,uint256,uint256,uint256,uint256).convertAddr_](contracts/MAIN_ACCOUNT.sol#L46) lacks a zero-check on :
		- [_convertAddr = convertAddr_](contracts/MAIN_ACCOUNT.sol#L53)

contracts/MAIN_ACCOUNT.sol#L46


 - [ ] ID-27
[FUSION_RELEASE.changeConfig2(uint256,uint256,uint256,address,address).collect_](contracts/FUSION_RELEASE.sol#L291) lacks a zero-check on :
		- [_collect = collect_](contracts/FUSION_RELEASE.sol#L295)

contracts/FUSION_RELEASE.sol#L291


 - [ ] ID-28
[STACK.initData(IERC20Upgradeable,address,address,address).collect_](contracts/STACK.sol#L93) lacks a zero-check on :
		- [_collect = collect_](contracts/STACK.sol#L99)

contracts/STACK.sol#L93


 - [ ] ID-29
[CONVERT_POOL.constructor(MOM_TOKEN,address,address,uint256).coldAddr_](contracts/CONVERT_POOL.sol#L37) lacks a zero-check on :
		- [_coldAddr = coldAddr_](contracts/CONVERT_POOL.sol#L42)

contracts/CONVERT_POOL.sol#L37


 - [ ] ID-30
[FUSION_RELEASE.initData(ERC20Upgradeable,ERC20BurnableUpgradeable,uint256,address,address).collect_](contracts/FUSION_RELEASE.sol#L205) lacks a zero-check on :
		- [_collect = collect_](contracts/FUSION_RELEASE.sol#L209)

contracts/FUSION_RELEASE.sol#L205


 - [ ] ID-31
[STACK.initData(IERC20Upgradeable,address,address,address).manager_](contracts/STACK.sol#L94) lacks a zero-check on :
		- [_manager = manager_](contracts/STACK.sol#L98)

contracts/STACK.sol#L94


 - [ ] ID-32
[CONVERT_POOL.constructor(MOM_TOKEN,address,address,uint256).manager_](contracts/CONVERT_POOL.sol#L38) lacks a zero-check on :
		- [_manager = manager_](contracts/CONVERT_POOL.sol#L43)

contracts/CONVERT_POOL.sol#L38


 - [ ] ID-33
[STACK.changeNFTAddress(address).nftAddress_](contracts/STACK.sol#L364) lacks a zero-check on :
		- [_nftAddress = nftAddress_](contracts/STACK.sol#L365)

contracts/STACK.sol#L364


 - [ ] ID-34
[MAIN_ACCOUNT.changeConfig(address).convertAddr_](contracts/MAIN_ACCOUNT.sol#L77) lacks a zero-check on :
		- [_convertAddr = convertAddr_](contracts/MAIN_ACCOUNT.sol#L78)

contracts/MAIN_ACCOUNT.sol#L77


## calls-loop
Impact: Low
Confidence: Medium
 - [ ] ID-35
[Address.functionCallWithValue(address,bytes,uint256,string)](node_modules/@openzeppelin/contracts/utils/Address.sol#L128-L137) has external calls inside a loop: [(success,returndata) = target.call{value: value}(data)](node_modules/@openzeppelin/contracts/utils/Address.sol#L135)

node_modules/@openzeppelin/contracts/utils/Address.sol#L128-L137


## reentrancy-benign
Impact: Low
Confidence: Medium
 - [ ] ID-36
Reentrancy in [STACK.initData(IERC20Upgradeable,address,address,address)](contracts/STACK.sol#L91-L173):
	External calls:
	- [oiNFT.setProxyRegistryAddress(proxyRegistryAddress_)](contracts/STACK.sol#L155)
	State variables written after the call(s):
	- [NFT_TOTAL_SUPPLY[1] = 20000](contracts/STACK.sol#L157)
	- [NFT_TOTAL_SUPPLY[2] = 15000](contracts/STACK.sol#L158)
	- [NFT_TOTAL_SUPPLY[3] = 10000](contracts/STACK.sol#L159)
	- [NFT_TOTAL_SUPPLY[4] = 5000](contracts/STACK.sol#L160)
	- [_LOCK_TIME = 86400](contracts/STACK.sol#L161)
	- [_nftAddress = address(oiNFT)](contracts/STACK.sol#L156)
	- [_timeLimits.push(_LOCK_TIME)](contracts/STACK.sol#L162)
	- [_timeLimits.push(604800)](contracts/STACK.sol#L163)
	- [_timeLimits.push(1209600)](contracts/STACK.sol#L164)
	- [_timeLimits.push(1814400)](contracts/STACK.sol#L165)
	- [_timeLimits.push(2419200)](contracts/STACK.sol#L166)
	- [_timeLimits.push(3024000)](contracts/STACK.sol#L167)
	- [_timeLimits.push(3628800)](contracts/STACK.sol#L168)
	- [_timeLimits.push(4233600)](contracts/STACK.sol#L169)
	- [_timeLimits.push(4838400)](contracts/STACK.sol#L170)
	- [_timeLimits.push(5443200)](contracts/STACK.sol#L171)
	- [_timeLimits.push(7776000)](contracts/STACK.sol#L172)

contracts/STACK.sol#L91-L173


 - [ ] ID-37
Reentrancy in [NFT.mintTo(address,uint8,uint8)](contracts/NFT.sol#L45-L53):
	External calls:
	- [id = _mintTo(to_)](contracts/NFT.sol#L46)
		- [IERC721Receiver(to).onERC721Received(_msgSender(),from,tokenId,data)](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L436-L447)
	State variables written after the call(s):
	- [_levels[id] = Level(stackLevel_,nftLevel_)](contracts/NFT.sol#L47-L50)
	- [++ _nftTotalSupply[stackLevel_]](contracts/NFT.sol#L51)

contracts/NFT.sol#L45-L53


## reentrancy-events
Impact: Low
Confidence: Medium
 - [ ] ID-38
Reentrancy in [NFT.mintTo(address,uint8,uint8)](contracts/NFT.sol#L45-L53):
	External calls:
	- [id = _mintTo(to_)](contracts/NFT.sol#L46)
		- [IERC721Receiver(to).onERC721Received(_msgSender(),from,tokenId,data)](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L436-L447)
	Event emitted after the call(s):
	- [OINFTMintEvent(to_,id,stackLevel_,nftLevel_)](contracts/NFT.sol#L52)

contracts/NFT.sol#L45-L53


## timestamp
Impact: Low
Confidence: Medium
 - [ ] ID-39
[Lock.withdraw()](contracts/Lock.sol#L23-L33) uses timestamp for comparisons
	Dangerous comparisons:
	- [require(bool,string)(block.timestamp >= unlockTime,You can't withdraw yet)](contracts/Lock.sol#L27)

contracts/Lock.sol#L23-L33


 - [ ] ID-40
[FUSION_RELEASE.refund(uint256)](contracts/FUSION_RELEASE.sol#L408-L442) uses timestamp for comparisons
	Dangerous comparisons:
	- [require(bool,string)(getDayNumber() == orderDay,Same-day orders are only refundable)](contracts/FUSION_RELEASE.sol#L414)

contracts/FUSION_RELEASE.sol#L408-L442


 - [ ] ID-41
[STACK.extract(uint256[])](contracts/STACK.sol#L269-L289) uses timestamp for comparisons
	Dangerous comparisons:
	- [require(bool,string)(unlockTime < block.timestamp,no time)](contracts/STACK.sol#L275)

contracts/STACK.sol#L269-L289


 - [ ] ID-42
[FUSION_RELEASE.fusion(uint256)](contracts/FUSION_RELEASE.sol#L387-L406) uses timestamp for comparisons
	Dangerous comparisons:
	- [nowTime > _openStart](contracts/FUSION_RELEASE.sol#L397)
	- [nowTime > _openStart - _priorityTime](contracts/FUSION_RELEASE.sol#L401)
	- [require(bool,string)(nowTime > _openStart,Fusion services have yet to begin)](contracts/FUSION_RELEASE.sol#L405)

contracts/FUSION_RELEASE.sol#L387-L406


 - [ ] ID-43
[FUSION_RELEASE.canFusion(address)](contracts/FUSION_RELEASE.sol#L493-L512) uses timestamp for comparisons
	Dangerous comparisons:
	- [nowTime > _openStart](contracts/FUSION_RELEASE.sol#L507)
	- [_whitelist[addr_] > 0 && nowTime > priorityStartTime](contracts/FUSION_RELEASE.sol#L511)

contracts/FUSION_RELEASE.sol#L493-L512


 - [ ] ID-44
[FUSION_RELEASE.initData(ERC20Upgradeable,ERC20BurnableUpgradeable,uint256,address,address)](contracts/FUSION_RELEASE.sol#L201-L220) uses timestamp for comparisons
	Dangerous comparisons:
	- [require(bool,string)(block.timestamp < openStart_,open start time error)](contracts/FUSION_RELEASE.sol#L208)

contracts/FUSION_RELEASE.sol#L201-L220


 - [ ] ID-45
[FUSION_RELEASE.getState()](contracts/FUSION_RELEASE.sol#L566-L573) uses timestamp for comparisons
	Dangerous comparisons:
	- [nowTime < _openStart](contracts/FUSION_RELEASE.sol#L568)

contracts/FUSION_RELEASE.sol#L566-L573


 - [ ] ID-46
[MAIN_ACCOUNT.release()](contracts/MAIN_ACCOUNT.sol#L61-L71) uses timestamp for comparisons
	Dangerous comparisons:
	- [require(bool,string)(block.timestamp >= time,no time)](contracts/MAIN_ACCOUNT.sol#L63)

contracts/MAIN_ACCOUNT.sol#L61-L71


 - [ ] ID-47
[FUSION_RELEASE.orderCanClaim(address,uint256)](contracts/FUSION_RELEASE.sol#L544-L560) uses timestamp for comparisons
	Dangerous comparisons:
	- [order.unlockTime > block.timestamp](contracts/FUSION_RELEASE.sol#L553)

contracts/FUSION_RELEASE.sol#L544-L560


 - [ ] ID-48
[Lock.constructor(uint256)](contracts/Lock.sol#L13-L21) uses timestamp for comparisons
	Dangerous comparisons:
	- [require(bool,string)(block.timestamp < _unlockTime,Unlock time should be in the future)](contracts/Lock.sol#L14-L17)

contracts/Lock.sol#L13-L21


 - [ ] ID-49
[MAIN_ACCOUNT.canRelease()](contracts/MAIN_ACCOUNT.sol#L81-L83) uses timestamp for comparisons
	Dangerous comparisons:
	- [block.timestamp > _nextTime && _currency.balanceOf(address(this)) >= _quantity](contracts/MAIN_ACCOUNT.sol#L82)

contracts/MAIN_ACCOUNT.sol#L81-L83


 - [ ] ID-50
[FUSION_RELEASE.calcFusion(address,uint256)](contracts/FUSION_RELEASE.sol#L584-L616) uses timestamp for comparisons
	Dangerous comparisons:
	- [canFusion(addr_) && _fusionList.length > _seq](contracts/FUSION_RELEASE.sol#L585)

contracts/FUSION_RELEASE.sol#L584-L616


 - [ ] ID-51
[FUSION_RELEASE.orderCanRefund(address,uint256)](contracts/FUSION_RELEASE.sol#L514-L542) uses timestamp for comparisons
	Dangerous comparisons:
	- [getDayNumber() != orderDay](contracts/FUSION_RELEASE.sol#L529)

contracts/FUSION_RELEASE.sol#L514-L542


 - [ ] ID-52
[FUSION_RELEASE.claim(uint256)](contracts/FUSION_RELEASE.sol#L473-L490) uses timestamp for comparisons
	Dangerous comparisons:
	- [require(bool,string)(_investor[owner].orderList[orderId_].unlockTime < block.timestamp,The order has not been unlocked)](contracts/FUSION_RELEASE.sol#L483)

contracts/FUSION_RELEASE.sol#L473-L490


## assembly
Impact: Informational
Confidence: High
 - [ ] ID-53
[AddressUpgradeable._revert(bytes,string)](node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L206-L218) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L211-L214)

node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L206-L218


 - [ ] ID-54
[EIP712Base.getChainId()](opensea/EIP712Base.sol#L52-L58) uses assembly
	- [INLINE ASM](opensea/EIP712Base.sol#L54-L56)

opensea/EIP712Base.sol#L52-L58


 - [ ] ID-55
[Math.mulDiv(uint256,uint256,uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L55-L135) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L66-L70)
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L86-L93)
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L100-L109)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L55-L135


 - [ ] ID-56
[Strings.toString(uint256)](node_modules/@openzeppelin/contracts/utils/Strings.sol#L18-L38) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/Strings.sol#L24-L26)
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/Strings.sol#L30-L32)

node_modules/@openzeppelin/contracts/utils/Strings.sol#L18-L38


 - [ ] ID-57
[ContextMixin.msgSender()](opensea/ContentMixin.sol#L6-L25) uses assembly
	- [INLINE ASM](opensea/ContentMixin.sol#L14-L20)

opensea/ContentMixin.sol#L6-L25


 - [ ] ID-58
[ERC721._checkOnERC721Received(address,address,uint256,bytes)](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L429-L451) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L443-L445)

node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L429-L451


 - [ ] ID-59
[Address._revert(bytes,string)](node_modules/@openzeppelin/contracts/utils/Address.sol#L231-L243) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/Address.sol#L236-L239)

node_modules/@openzeppelin/contracts/utils/Address.sol#L231-L243


## pragma
Impact: Informational
Confidence: High
 - [ ] ID-60
Different versions of Solidity are used:
	- Version used: ['^0.8.0', '^0.8.1', '^0.8.2', '^0.8.9']
	- [^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/IERC20MetadataUpgradeable.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/draft-IERC20PermitUpgradeable.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/utils/SafeERC20Upgradeable.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/utils/math/SafeMathUpgradeable.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/access/Ownable.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/security/ReentrancyGuard.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/token/ERC20/extensions/draft-IERC20Permit.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/token/ERC721/IERC721.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/utils/Context.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/utils/Counters.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/utils/Strings.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/utils/introspection/ERC165.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/utils/introspection/IERC165.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/utils/math/SafeMath.sol#L4)
	- [^0.8.0](contracts/CONVERT_POOL.sol#L3)
	- [^0.8.0](contracts/FUSION_RELEASE.sol#L7)
	- [^0.8.0](contracts/MAIN_ACCOUNT.sol#L3)
	- [^0.8.0](contracts/MOM_TOKEN.sol#L4)
	- [^0.8.0](contracts/NFT.sol#L3)
	- [^0.8.0](contracts/STACK.sol#L7)
	- [^0.8.0](opensea/ContentMixin.sol#L3)
	- [^0.8.0](opensea/EIP712Base.sol#L3)
	- [^0.8.0](opensea/ERC721Tradable.sol#L3)
	- [^0.8.0](opensea/Initializable.sol#L3)
	- [^0.8.0](opensea/NativeMetaTransaction.sol#L3)
	- [^0.8.1](node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L4)
	- [^0.8.1](node_modules/@openzeppelin/contracts/utils/Address.sol#L4)
	- [^0.8.2](node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol#L4)
	- [^0.8.9](contracts/Lock.sol#L2)

node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#L4


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-61
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol#L4


 - [ ] ID-62
Pragma version[^0.8.0](opensea/NativeMetaTransaction.sol#L3) allows old versions

opensea/NativeMetaTransaction.sol#L3


 - [ ] ID-63
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/token/ERC20/extensions/draft-IERC20Permit.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/token/ERC20/extensions/draft-IERC20Permit.sol#L4


 - [ ] ID-64
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L4


 - [ ] ID-65
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol#L4


 - [ ] ID-66
Pragma version[^0.8.0](opensea/ERC721Tradable.sol#L3) allows old versions

opensea/ERC721Tradable.sol#L3


 - [ ] ID-67
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/utils/Context.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/utils/Context.sol#L4


 - [ ] ID-68
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/security/ReentrancyGuard.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/security/ReentrancyGuard.sol#L4


 - [ ] ID-69
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol#L4) allows old versions

node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol#L4


 - [ ] ID-70
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/utils/Strings.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/utils/Strings.sol#L4


 - [ ] ID-71
Pragma version[^0.8.0](contracts/MOM_TOKEN.sol#L4) allows old versions

contracts/MOM_TOKEN.sol#L4


 - [ ] ID-72
Pragma version[^0.8.0](opensea/ContentMixin.sol#L3) allows old versions

opensea/ContentMixin.sol#L3


 - [ ] ID-73
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol#L4) allows old versions

node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol#L4


 - [ ] ID-74
Pragma version[^0.8.9](contracts/Lock.sol#L2) allows old versions

contracts/Lock.sol#L2


 - [ ] ID-75
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol#L4


 - [ ] ID-76
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/IERC20MetadataUpgradeable.sol#L4) allows old versions

node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/IERC20MetadataUpgradeable.sol#L4


 - [ ] ID-77
Pragma version[^0.8.1](node_modules/@openzeppelin/contracts/utils/Address.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/utils/Address.sol#L4


 - [ ] ID-78
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#L4) allows old versions

node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#L4


 - [ ] ID-79
Pragma version[^0.8.0](contracts/CONVERT_POOL.sol#L3) allows old versions

contracts/CONVERT_POOL.sol#L3


 - [ ] ID-80
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol#L4) allows old versions

node_modules/@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol#L4


 - [ ] ID-81
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/utils/SafeERC20Upgradeable.sol#L4) allows old versions

node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/utils/SafeERC20Upgradeable.sol#L4


 - [ ] ID-82
Pragma version[^0.8.0](contracts/STACK.sol#L7) allows old versions

contracts/STACK.sol#L7


 - [ ] ID-83
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/utils/math/SafeMath.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/utils/math/SafeMath.sol#L4


 - [ ] ID-84
Pragma version[^0.8.0](contracts/NFT.sol#L3) allows old versions

contracts/NFT.sol#L3


 - [ ] ID-85
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol#L4


 - [ ] ID-86
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/utils/Counters.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/utils/Counters.sol#L4


 - [ ] ID-87
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol#L4


 - [ ] ID-88
Pragma version[^0.8.0](contracts/FUSION_RELEASE.sol#L7) allows old versions

contracts/FUSION_RELEASE.sol#L7


 - [ ] ID-89
Pragma version[^0.8.0](opensea/EIP712Base.sol#L3) allows old versions

opensea/EIP712Base.sol#L3


 - [ ] ID-90
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/utils/introspection/ERC165.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/utils/introspection/ERC165.sol#L4


 - [ ] ID-91
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L4


 - [ ] ID-92
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/utils/math/SafeMathUpgradeable.sol#L4) allows old versions

node_modules/@openzeppelin/contracts-upgradeable/utils/math/SafeMathUpgradeable.sol#L4


 - [ ] ID-93
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/token/ERC721/IERC721.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/token/ERC721/IERC721.sol#L4


 - [ ] ID-94
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol#L4) allows old versions

node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol#L4


 - [ ] ID-95
Pragma version[^0.8.0](opensea/Initializable.sol#L3) allows old versions

opensea/Initializable.sol#L3


 - [ ] ID-96
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/draft-IERC20PermitUpgradeable.sol#L4) allows old versions

node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/draft-IERC20PermitUpgradeable.sol#L4


 - [ ] ID-97
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/access/Ownable.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/access/Ownable.sol#L4


 - [ ] ID-98
Pragma version[^0.8.2](node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol#L4) allows old versions

node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol#L4


 - [ ] ID-99
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/utils/introspection/IERC165.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/utils/introspection/IERC165.sol#L4


 - [ ] ID-100
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L4


 - [ ] ID-101
Pragma version[^0.8.1](node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L4) allows old versions

node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L4


 - [ ] ID-102
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#L4) allows old versions

node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#L4


 - [ ] ID-103
Pragma version[^0.8.0](contracts/MAIN_ACCOUNT.sol#L3) allows old versions

contracts/MAIN_ACCOUNT.sol#L3


## low-level-calls
Impact: Informational
Confidence: High
 - [ ] ID-104
Low level call in [Address.functionCallWithValue(address,bytes,uint256,string)](node_modules/@openzeppelin/contracts/utils/Address.sol#L128-L137):
	- [(success,returndata) = target.call{value: value}(data)](node_modules/@openzeppelin/contracts/utils/Address.sol#L135)

node_modules/@openzeppelin/contracts/utils/Address.sol#L128-L137


 - [ ] ID-105
Low level call in [AddressUpgradeable.sendValue(address,uint256)](node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L60-L65):
	- [(success) = recipient.call{value: amount}()](node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L63)

node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L60-L65


 - [ ] ID-106
Low level call in [Address.sendValue(address,uint256)](node_modules/@openzeppelin/contracts/utils/Address.sol#L60-L65):
	- [(success) = recipient.call{value: amount}()](node_modules/@openzeppelin/contracts/utils/Address.sol#L63)

node_modules/@openzeppelin/contracts/utils/Address.sol#L60-L65


 - [ ] ID-107
Low level call in [AddressUpgradeable.functionCallWithValue(address,bytes,uint256,string)](node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L128-L137):
	- [(success,returndata) = target.call{value: value}(data)](node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L135)

node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L128-L137


 - [ ] ID-108
Low level call in [AddressUpgradeable.functionStaticCall(address,bytes,string)](node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L155-L162):
	- [(success,returndata) = target.staticcall(data)](node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L160)

node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L155-L162


 - [ ] ID-109
Low level call in [Address.functionStaticCall(address,bytes,string)](node_modules/@openzeppelin/contracts/utils/Address.sol#L155-L162):
	- [(success,returndata) = target.staticcall(data)](node_modules/@openzeppelin/contracts/utils/Address.sol#L160)

node_modules/@openzeppelin/contracts/utils/Address.sol#L155-L162


 - [ ] ID-110
Low level call in [Address.functionDelegateCall(address,bytes,string)](node_modules/@openzeppelin/contracts/utils/Address.sol#L180-L187):
	- [(success,returndata) = target.delegatecall(data)](node_modules/@openzeppelin/contracts/utils/Address.sol#L185)

node_modules/@openzeppelin/contracts/utils/Address.sol#L180-L187


 - [ ] ID-111
Low level call in [NativeMetaTransaction.executeMetaTransaction(address,bytes,bytes32,bytes32,uint8)](opensea/NativeMetaTransaction.sol#L33-L67):
	- [(success,returnData) = address(this).call(abi.encodePacked(functionSignature,userAddress))](opensea/NativeMetaTransaction.sol#L61-L63)

opensea/NativeMetaTransaction.sol#L33-L67


## naming-convention
Impact: Informational
Confidence: High
 - [ ] ID-112
Variable [FUSION_RELEASE._usdt](contracts/FUSION_RELEASE.sol#L153) is not in mixedCase

contracts/FUSION_RELEASE.sol#L153


 - [ ] ID-113
Variable [CONVERT_POOL._reserve](contracts/CONVERT_POOL.sol#L31) is not in mixedCase

contracts/CONVERT_POOL.sol#L31


 - [ ] ID-114
Variable [CONVERT_POOL._coldAddr](contracts/CONVERT_POOL.sol#L25) is not in mixedCase

contracts/CONVERT_POOL.sol#L25


 - [ ] ID-115
Variable [MAIN_ACCOUNT._releaseCount](contracts/MAIN_ACCOUNT.sol#L32) is not in mixedCase

contracts/MAIN_ACCOUNT.sol#L32


 - [ ] ID-116
Contract [CONVERT_POOL](contracts/CONVERT_POOL.sol#L13-L90) is not in CapWords

contracts/CONVERT_POOL.sol#L13-L90


 - [ ] ID-117
Variable [FUSION_RELEASE._orderAmountLimit](contracts/FUSION_RELEASE.sol#L180) is not in mixedCase

contracts/FUSION_RELEASE.sol#L180


 - [ ] ID-118
Function [IERC20PermitUpgradeable.DOMAIN_SEPARATOR()](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/draft-IERC20PermitUpgradeable.sol#L59) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/draft-IERC20PermitUpgradeable.sol#L59


 - [ ] ID-119
Variable [STACK._LOCK_TIME](contracts/STACK.sol#L73) is not in mixedCase

contracts/STACK.sol#L73


 - [ ] ID-120
Variable [STACK._collect](contracts/STACK.sol#L75) is not in mixedCase

contracts/STACK.sol#L75


 - [ ] ID-121
Variable [STACK._quantityLevel](contracts/STACK.sol#L63) is not in mixedCase

contracts/STACK.sol#L63


 - [ ] ID-122
Variable [STACK._timeLimits](contracts/STACK.sol#L65) is not in mixedCase

contracts/STACK.sol#L65


 - [ ] ID-123
Variable [FUSION_RELEASE._mom](contracts/FUSION_RELEASE.sol#L155) is not in mixedCase

contracts/FUSION_RELEASE.sol#L155


 - [ ] ID-124
Variable [STACK.NFT_TOTAL_SUPPLY](contracts/STACK.sol#L81) is not in mixedCase

contracts/STACK.sol#L81


 - [ ] ID-125
Variable [MAIN_ACCOUNT._currency](contracts/MAIN_ACCOUNT.sol#L28) is not in mixedCase

contracts/MAIN_ACCOUNT.sol#L28


 - [ ] ID-126
Variable [ContextUpgradeable.__gap](node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#L36) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#L36


 - [ ] ID-127
Function [ReentrancyGuardUpgradeable.__ReentrancyGuard_init_unchained()](node_modules/@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol#L44-L46) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol#L44-L46


 - [ ] ID-128
Variable [FUSION_RELEASE._seq](contracts/FUSION_RELEASE.sol#L165) is not in mixedCase

contracts/FUSION_RELEASE.sol#L165


 - [ ] ID-129
Variable [MAIN_ACCOUNT._quantity](contracts/MAIN_ACCOUNT.sol#L24) is not in mixedCase

contracts/MAIN_ACCOUNT.sol#L24


 - [ ] ID-130
Variable [NFT._levels](contracts/NFT.sol#L21) is not in mixedCase

contracts/NFT.sol#L21


 - [ ] ID-131
Variable [FUSION_RELEASE._refundHour](contracts/FUSION_RELEASE.sol#L182) is not in mixedCase

contracts/FUSION_RELEASE.sol#L182


 - [ ] ID-132
Variable [FUSION_RELEASE._uoffset](contracts/FUSION_RELEASE.sol#L157) is not in mixedCase

contracts/FUSION_RELEASE.sol#L157


 - [ ] ID-133
Parameter [ERC721Tradable.tokenURI(uint256)._tokenId](opensea/ERC721Tradable.sol#L77) is not in mixedCase

opensea/ERC721Tradable.sol#L77


 - [ ] ID-134
Function [OwnableUpgradeable.__Ownable_init()](node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#L29-L31) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#L29-L31


 - [ ] ID-135
Contract [MOM_TOKEN](contracts/MOM_TOKEN.sol#L8-L18) is not in CapWords

contracts/MOM_TOKEN.sol#L8-L18


 - [ ] ID-136
Variable [FUSION_RELEASE._whitelist](contracts/FUSION_RELEASE.sol#L169) is not in mixedCase

contracts/FUSION_RELEASE.sol#L169


 - [ ] ID-137
Variable [FUSION_RELEASE._moffset](contracts/FUSION_RELEASE.sol#L159) is not in mixedCase

contracts/FUSION_RELEASE.sol#L159


 - [ ] ID-138
Variable [OwnableUpgradeable.__gap](node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#L94) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#L94


 - [ ] ID-139
Variable [STACK._nftLevel](contracts/STACK.sol#L67) is not in mixedCase

contracts/STACK.sol#L67


 - [ ] ID-140
Function [ERC20BurnableUpgradeable.__ERC20Burnable_init()](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol#L16-L17) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol#L16-L17


 - [ ] ID-141
Variable [MAIN_ACCOUNT._nextTime](contracts/MAIN_ACCOUNT.sol#L26) is not in mixedCase

contracts/MAIN_ACCOUNT.sol#L26


 - [ ] ID-142
Variable [MAIN_ACCOUNT._cycle](contracts/MAIN_ACCOUNT.sol#L22) is not in mixedCase

contracts/MAIN_ACCOUNT.sol#L22


 - [ ] ID-143
Variable [FUSION_RELEASE._fusionList](contracts/FUSION_RELEASE.sol#L161) is not in mixedCase

contracts/FUSION_RELEASE.sol#L161


 - [ ] ID-144
Function [ERC20Upgradeable.__ERC20_init_unchained(string,string)](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol#L59-L62) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol#L59-L62


 - [ ] ID-145
Variable [FUSION_RELEASE._state](contracts/FUSION_RELEASE.sol#L151) is not in mixedCase

contracts/FUSION_RELEASE.sol#L151


 - [ ] ID-146
Function [ERC20Upgradeable.__ERC20_init(string,string)](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol#L55-L57) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol#L55-L57


 - [ ] ID-147
Function [ReentrancyGuardUpgradeable.__ReentrancyGuard_init()](node_modules/@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol#L40-L42) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol#L40-L42


 - [ ] ID-148
Function [ContextUpgradeable.__Context_init_unchained()](node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#L21-L22) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#L21-L22


 - [ ] ID-149
Variable [FUSION_RELEASE._priorityTime](contracts/FUSION_RELEASE.sol#L184) is not in mixedCase

contracts/FUSION_RELEASE.sol#L184


 - [ ] ID-150
Variable [FUSION_RELEASE._investor](contracts/FUSION_RELEASE.sol#L163) is not in mixedCase

contracts/FUSION_RELEASE.sol#L163


 - [ ] ID-151
Variable [ERC20Upgradeable.__gap](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol#L400) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol#L400


 - [ ] ID-152
Variable [ReentrancyGuardUpgradeable.__gap](node_modules/@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol#L80) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol#L80


 - [ ] ID-153
Variable [ERC20BurnableUpgradeable.__gap](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol#L51) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol#L51


 - [ ] ID-154
Function [IERC20Permit.DOMAIN_SEPARATOR()](node_modules/@openzeppelin/contracts/token/ERC20/extensions/draft-IERC20Permit.sol#L59) is not in mixedCase

node_modules/@openzeppelin/contracts/token/ERC20/extensions/draft-IERC20Permit.sol#L59


 - [ ] ID-155
Variable [CONVERT_POOL._currency](contracts/CONVERT_POOL.sol#L29) is not in mixedCase

contracts/CONVERT_POOL.sol#L29


 - [ ] ID-156
Variable [FUSION_RELEASE._manager](contracts/FUSION_RELEASE.sol#L188) is not in mixedCase

contracts/FUSION_RELEASE.sol#L188


 - [ ] ID-157
Variable [FUSION_RELEASE._incomeForDay](contracts/FUSION_RELEASE.sol#L167) is not in mixedCase

contracts/FUSION_RELEASE.sol#L167


 - [ ] ID-158
Variable [MAIN_ACCOUNT._releaseTotal](contracts/MAIN_ACCOUNT.sol#L30) is not in mixedCase

contracts/MAIN_ACCOUNT.sol#L30


 - [ ] ID-159
Variable [MAIN_ACCOUNT._attenuation](contracts/MAIN_ACCOUNT.sol#L34) is not in mixedCase

contracts/MAIN_ACCOUNT.sol#L34


 - [ ] ID-160
INFO:Slither:. analyzed (45 contracts with 85 detectors), 203 result(s) found
Variable [MAIN_ACCOUNT._startTime](contracts/MAIN_ACCOUNT.sol#L20) is not in mixedCase

contracts/MAIN_ACCOUNT.sol#L20


 - [ ] ID-161
Variable [CONVERT_POOL._manager](contracts/CONVERT_POOL.sol#L27) is not in mixedCase

contracts/CONVERT_POOL.sol#L27


 - [ ] ID-162
Variable [NFT._nftTotalSupply](contracts/NFT.sol#L23) is not in mixedCase

contracts/NFT.sol#L23


 - [ ] ID-163
Variable [FUSION_RELEASE._lockTime](contracts/FUSION_RELEASE.sol#L176) is not in mixedCase

contracts/FUSION_RELEASE.sol#L176


 - [ ] ID-164
Variable [FUSION_RELEASE._openStart](contracts/FUSION_RELEASE.sol#L174) is not in mixedCase

contracts/FUSION_RELEASE.sol#L174


 - [ ] ID-165
Function [ERC721.__unsafe_increaseBalance(address,uint256)](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L503-L505) is not in mixedCase

node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L503-L505


 - [ ] ID-166
Function [OwnableUpgradeable.__Ownable_init_unchained()](node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#L33-L35) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#L33-L35


 - [ ] ID-167
Contract [FUSION_RELEASE](contracts/FUSION_RELEASE.sol#L17-L668) is not in CapWords

contracts/FUSION_RELEASE.sol#L17-L668


 - [ ] ID-168
Variable [MAIN_ACCOUNT._convertAddr](contracts/MAIN_ACCOUNT.sol#L18) is not in mixedCase

contracts/MAIN_ACCOUNT.sol#L18


 - [ ] ID-169
Variable [FUSION_RELEASE._maxOrderCountForDay](contracts/FUSION_RELEASE.sol#L178) is not in mixedCase

contracts/FUSION_RELEASE.sol#L178


 - [ ] ID-170
Variable [CONVERT_POOL._convertHistory](contracts/CONVERT_POOL.sol#L33) is not in mixedCase

contracts/CONVERT_POOL.sol#L33


 - [ ] ID-171
Variable [FUSION_RELEASE._collect](contracts/FUSION_RELEASE.sol#L186) is not in mixedCase

contracts/FUSION_RELEASE.sol#L186


 - [ ] ID-172
Variable [STACK._currency](contracts/STACK.sol#L71) is not in mixedCase

contracts/STACK.sol#L71


 - [ ] ID-173
Variable [FUSION_RELEASE._refundList](contracts/FUSION_RELEASE.sol#L171) is not in mixedCase

contracts/FUSION_RELEASE.sol#L171


 - [ ] ID-174
Variable [STACK._manager](contracts/STACK.sol#L77) is not in mixedCase

contracts/STACK.sol#L77


 - [ ] ID-175
Event [FUSION_RELEASEremoveWhiteListEvent(address)](contracts/FUSION_RELEASE.sol#L111-L113) is not in CapWords

contracts/FUSION_RELEASE.sol#L111-L113


 - [ ] ID-176
Contract [MAIN_ACCOUNT](contracts/MAIN_ACCOUNT.sol#L13-L86) is not in CapWords

contracts/MAIN_ACCOUNT.sol#L13-L86


 - [ ] ID-177
Event [FUSION_RELEASEaddWhiteListEvent(address,uint256)](contracts/FUSION_RELEASE.sol#L106-L109) is not in CapWords

contracts/FUSION_RELEASE.sol#L106-L109


 - [ ] ID-178
Function [ContextUpgradeable.__Context_init()](node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#L18-L19) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#L18-L19


 - [ ] ID-179
Function [ERC20BurnableUpgradeable.__ERC20Burnable_init_unchained()](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol#L19-L20) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol#L19-L20


 - [ ] ID-180
Variable [STACK._penaltyHistory](contracts/STACK.sol#L69) is not in mixedCase

contracts/STACK.sol#L69


 - [ ] ID-181
Variable [STACK._users](contracts/STACK.sol#L61) is not in mixedCase

contracts/STACK.sol#L61


 - [ ] ID-182
Variable [STACK._nftAddress](contracts/STACK.sol#L79) is not in mixedCase

contracts/STACK.sol#L79


## similar-names
Impact: Informational
Confidence: Medium
 - [ ] ID-183
Variable [STACK._nftAddress](contracts/STACK.sol#L79) is too similar to [STACK.changeNFTAddress(address).nftAddress_](contracts/STACK.sol#L364)

contracts/STACK.sol#L79


 - [ ] ID-184
Variable [ERC721Tradable.constructor(string,string,address)._proxyRegistryAddress](opensea/ERC721Tradable.sol#L44) is too similar to [NFT.setProxyRegistryAddress(address).proxyRegistryAddress_](contracts/NFT.sol#L41)

opensea/ERC721Tradable.sol#L44


 - [ ] ID-185
Variable [ERC721Tradable.constructor(string,string,address)._proxyRegistryAddress](opensea/ERC721Tradable.sol#L44) is too similar to [ERC721Tradable._setProxyRegistryAddress(address).proxyRegistryAddress_](opensea/ERC721Tradable.sol#L52)

opensea/ERC721Tradable.sol#L44


 - [ ] ID-186
Variable [MAIN_ACCOUNT._convertAddr](contracts/MAIN_ACCOUNT.sol#L18) is too similar to [MAIN_ACCOUNT.constructor(MOM_TOKEN,address,uint256,uint256,uint256,uint256).convertAddr_](contracts/MAIN_ACCOUNT.sol#L46)

contracts/MAIN_ACCOUNT.sol#L18


 - [ ] ID-187
Variable [MAIN_ACCOUNT._convertAddr](contracts/MAIN_ACCOUNT.sol#L18) is too similar to [MAIN_ACCOUNT.changeConfig(address).convertAddr_](contracts/MAIN_ACCOUNT.sol#L77)

contracts/MAIN_ACCOUNT.sol#L18


 - [ ] ID-188
Variable [MAIN_ACCOUNT._attenuation](contracts/MAIN_ACCOUNT.sol#L34) is too similar to [MAIN_ACCOUNT.constructor(MOM_TOKEN,address,uint256,uint256,uint256,uint256).attenuation_](contracts/MAIN_ACCOUNT.sol#L50)

contracts/MAIN_ACCOUNT.sol#L34


 - [ ] ID-189
Variable [FUSION_RELEASE._orderAmountLimit](contracts/FUSION_RELEASE.sol#L180) is too similar to [FUSION_RELEASE.changeConfig2(uint256,uint256,uint256,address,address).orderAmountLimit_](contracts/FUSION_RELEASE.sol#L291)

contracts/FUSION_RELEASE.sol#L180


## too-many-digits
Impact: Informational
Confidence: Medium
 - [ ] ID-190
[STACK.initData(IERC20Upgradeable,address,address,address)](contracts/STACK.sol#L91-L173) uses literals with too many digits:
	- [_quantityLevel.push(125000000000000000000000)](contracts/STACK.sol#L103)

contracts/STACK.sol#L91-L173


 - [ ] ID-191
[STACK.initData(IERC20Upgradeable,address,address,address)](contracts/STACK.sol#L91-L173) uses literals with too many digits:
	- [_quantityLevel.push(500000000000000000000)](contracts/STACK.sol#L100)

contracts/STACK.sol#L91-L173


 - [ ] ID-192
[MOM_TOKEN.constructor()](contracts/MOM_TOKEN.sol#L10-L12) uses literals with too many digits:
	- [_mint(msg.sender,10000000000 * 10 ** decimals())](contracts/MOM_TOKEN.sol#L11)

contracts/MOM_TOKEN.sol#L10-L12


 - [ ] ID-193
[STACK.initData(IERC20Upgradeable,address,address,address)](contracts/STACK.sol#L91-L173) uses literals with too many digits:
	- [_quantityLevel.push(2500000000000000000000)](contracts/STACK.sol#L101)

contracts/STACK.sol#L91-L173


 - [ ] ID-194
[STACK.initData(IERC20Upgradeable,address,address,address)](contracts/STACK.sol#L91-L173) uses literals with too many digits:
	- [_quantityLevel.push(25000000000000000000000)](contracts/STACK.sol#L102)

contracts/STACK.sol#L91-L173


## unused-state
Impact: Informational
Confidence: High
 - [ ] ID-195
[ERC20BurnableUpgradeable.__gap](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol#L51) is never used in [ERC20BurnableUpgradeable](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol#L15-L52)

node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol#L51


## immutable-states
Impact: Optimization
Confidence: High
 - [ ] ID-196
[MAIN_ACCOUNT._attenuation](contracts/MAIN_ACCOUNT.sol#L34) should be immutable 

contracts/MAIN_ACCOUNT.sol#L34


 - [ ] ID-197
[MAIN_ACCOUNT._cycle](contracts/MAIN_ACCOUNT.sol#L22) should be immutable 

contracts/MAIN_ACCOUNT.sol#L22


 - [ ] ID-198
[Lock.unlockTime](contracts/Lock.sol#L8) should be immutable 

contracts/Lock.sol#L8


 - [ ] ID-199
[MAIN_ACCOUNT._startTime](contracts/MAIN_ACCOUNT.sol#L20) should be immutable 

contracts/MAIN_ACCOUNT.sol#L20


 - [ ] ID-200
[MAIN_ACCOUNT._currency](contracts/MAIN_ACCOUNT.sol#L28) should be immutable 

contracts/MAIN_ACCOUNT.sol#L28


 - [ ] ID-201
[Lock.owner](contracts/Lock.sol#L9) should be immutable 

contracts/Lock.sol#L9


 - [ ] ID-202
[CONVERT_POOL._currency](contracts/CONVERT_POOL.sol#L29) should be immutable 

contracts/CONVERT_POOL.sol#L29



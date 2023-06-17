#   密码学

非对称加密

## 加密

​	用对方的公钥加密，对方用自己的私钥解密

## 签名

​	用我的私钥加密，对方用我的公钥验证



# ETH

## component

- P2P
- Transaction
- （以太坊虚拟机）EVM
- （数据库）Blockchain
- 客户端

## concept

- EVM (ETHerm virtual machine)

  以太坊虚拟机（EVM）是以太坊中智能合约的运行环境。它是  以太坊项目中的另一个主要创新。

- Account
  - (普通账户)EOA
  - （合约账户）Contract

- 消息
  - 以 ‹     太坊虚拟机（EVM）是以太坊中智能合约的运行环境。它是以太坊项目中的另一个主要创新。

- Address  

- Transaction
  - 可以发送以太币和信息
  - 向合约发送的交易可以调用合约代码，并以信息数据作为函数参数
  - 向空用户发送信息，可以自动生成以信息为代码块的合约账户

- Gas

- Dapp

  - 智能合约（smart Contract）来创建
  - 以太坊的构想是成为DApps编程开发的平台
  - DApp至少由以下组成
    - 区块链上的智能合约
    - Web前端界面用户界面

- 私钥（Private Key）

  以太坊私钥事实上只是一个256位的随机数，用于发送以太的交易中创建签名来证明自己对资金的所有权。

  **在实践中，私钥可以由账户密码和keyStore文件得到**

- 公钥（Public Key）

  公钥是由私钥通过椭圆曲线加密secp256k1算法单向生成的512位（64字节）数。

- 地址（Adress）

  地址是由公钥的Keccak-256单向哈希，取最后20个字节（160位）派生出来的标识符。

## 2 实践

## 2.1 clef

Manage accounts

## 2.2 geth

Geth (short for Go Ethereum) is a command-line interface for running an Ethereum node and interacting with the Ethereum network. It can be used to:

1. Mine Ethereum blocks and validate transactions
2. Store and manage the Ethereum blockchain
3. Deploy and interact with smart contracts on the Ethereum network
4. Transfer and manage Ether and other Ethereum-based tokens
5. Explore and search the Ethereum blockchain

Geth is written in the Go programming language and is one of the most popular client implementations for the Ethereum network. It can be used to run a full Ethereum node, which means that you can have a full copy of the Ethereum blockchain on your computer and participate in the consensus process by validating transactions and blocks.



**常用命令**

1. Initialize the Private Network: Use the following command to initialize your private network using the Genesis file.

   The gensis file is as following:

   ```json
   {
       "config": {
           "chainId": 12345,
           "homesteadBlock": 0,
           "eip150Block": 0,
           "eip155Block": 0,
           "eip158Block": 0
       },
       "alloc": {
           "0x0000000000000000000000000000000000000001": {
               "balance": "1000000000000000000"
           },
           "0x0000000000000000000000000000000000000002": {
               "balance": "1000000000000000000"
           }
       },
       "coinbase": "0x0000000000000000000000000000000000000000",
       "difficulty": "0x20000",
       "extraData": "",
       "gasLimit": "0x2fefd8",
       "nonce": "0x0000000000000042",
       "mixhash": "0x0000000000000000000000000000000000000000000000000000000000000000",
       "parentHash": "0x0000000000000000000000000000000000000000000000000000000000000000",
       "timestamp": "0x00"
   }
   ```

   In this example, the `chainId` field specifies the network ID for the private network. The `alloc` field defines the initial allocations of Ether to addresses. In this case, two addresses have been allocated 1 Ether each. The `difficulty` field specifies the initial difficulty for mining blocks, and the `gasLimit` field sets the maximum gas limit for each block. The other fields in the Genesis file specify various parameters for the network, such as the coinbase address, the nonce, and the timestamp.

   Note that the exact configuration of the Genesis file will depend on your specific use case and requirements. You can refer to the Ethereum documentation for more information on the Genesis file and the available configuration options.

   ***Q : what the coinsbase means ?***

   ***A*** : The coinbase in Ethereum is the address that receives the block rewards for mining a block. In other words, the miner who successfully mines a block is rewarded with a certain amount of Ether, and this reward is sent to the coinbase address.

   The coinbase address is specified in the Genesis file when you initialize your private Ethereum blockchain. It is important to note that the coinbase address is not a real address in the sense that it can be used to hold or transfer funds. Instead, it is a placeholder for the block reward, and it is automatically updated with each new block that is mined.

   In a public Ethereum network, the coinbase address is typically set to an address controlled by the miner who successfully mines the block. In a private network, you can set the coinbase address to any address you choose. For example, in a test or development environment, you might set the coinbase address to an address controlled by your development team, so that the rewards from mining can be used for testing purposes. 

   

```shell
geth --datadir=<path to data directory> init <path to Genesis file>
```

2. Start the Geth Node: To start your private network, you will need to run a Geth node. You can use the following command to start the node:

```shell
geth --datadir=<path to data directory> --networkid <network ID> - --http --nodiscover console
```

3. Interact with Geth

   https://geth.ethereum.org/docs/getting-started#interact-with-geth

## 比特币和以太坊的区别

- 比特币是一种数字货币，以太坊是一种平台
- 比特币是一种去中心化的货币，以太坊是一种去中心化的应用平台
- 比特币是一种点对点的货币，以太坊是一种点对点的应用平台

# UTXO vs Account

- UTXO

  - 每个交易都是一个UTXO
  - 每个UTXO都有一个唯一的ID
  - 每个UTXO都有一个金额
  - 每个UTXO都有一个锁定脚本
  - 每个UTXO都有一个解锁脚本

- Account
  - 每个账户都有一个唯一的地址
  - 每个账户都有一个余额
  - 每个账户都有一个nonce
  - 每个账户都有一个锁定脚本
  - 每个账户都有一个解锁脚本
  - 每个账户都有一个交易记录
  - 每个账户都有一个状态树
  - 每个账户都有一个代码
  - 每个账户都有一个存储

# ETH账户类型

- 普通账户
  - 有私钥
  - 有地址
  - 有余额
  - 可发送交易（转币或触发合约代码）
  - 有交易记录
  - 有状态树
  - 有代码
  - 有存储
  - 有nonce
  - 有锁定脚本
  - 有解锁脚本

- 合约账户

# 以太坊交易

签名的数据包，由EOA发起，包含以下内容：
- 消息的接收方地址
- 消息的发送方地址
- 消息的发送方签名
- 消息的发送方nonce
- 消息的发送方gasPrice
- 消息的发送方gasLimit（start gas）
- 消息的发送方value
- 消息的发送方data

交易是由外部拥有的账户发起的签名消息，由以太坊网络传输，并被序列化后记录在以太坊区块链上。

# 消息

合约可以向其他合约发送"消息"
消息是不会被序列化的虚拟对象，只存在于以太坊执行环境(EVM)中
消息包含以下内容：
- 消息的接收方地址
- 消息发送方
- 金额（value)
- 数据（data)
- gasLimit（start gas)

## 以太坊的应用

- 金融
- 保险

# EVM

## EVM的数据存储

- Storage
  - 每个账户都有一块持久化的存储空间，将256位字映射到256位字的key-value存储区，可以理解为合约的数据库
  - 永久存储在区块链中，由于会永久保存合约状态变量，所以读写的gas开销也最大。
- Memory
  - 每一次消息调用，都会分配一块内存空间，用于存储临时数据，比如函数参数、返回值、中间变量等。
  - 生命周期仅为一次消息调用，仅保存临时变量，调用结束后会被释放，所以读写的gas开销也较小。
- Stack
  - EVM不是基于寄存器的，而是基于栈的。
  - 存放部分局部值类型变量，几乎免费使用的内存，但有数量限制。

## EVM的指令集

- 指令集
  - 以太坊的虚拟机EVM是基于栈的，指令集也是基于栈的，指令集的每一条指令都会对栈进行操作，比如压栈、出栈、复制栈顶元素等。
  - 指令集的每一条指令都有一个唯一的操作码，比如0x01代表STOP指令，0x02代表ADD指令，0x03代表MUL指令，0x04代表SUB指令，0x05代表DIV指令，0x06代表SDIV指令，0x07代表MOD指令，0x08代表SMOD指令，0x09代表ADDMOD指令，0x0a代表MULMOD指令，0x0b代表EXP指令，0x0c代表SIGNEXTEND指令，0x10代表LT指令，0x11代表GT指令，0x12代表SLT指令，0x13代表SGT指令，0x14代表EQ指令，0x15代表ISZERO指令，0x16代表AND指令，0x17代表OR指令，0x18代表XOR指令，0x19代表NOT指令，0x1a代表BYTE指令，0x20代表SHA3指令，0x30代表ADDRESS指令，0x31代表BALANCE指令，0x32代表ORIGIN指令，0x33代表CALLER指令，0x34代表CALLVALUE指令，0x35代表CALLDATALOAD指令，0x36代表CALLDATASIZE指令，0x37代表CALLDATACOPY指令，0x38代表CODESIZE指令，0x39代表CODECOPY指令，0x3a代表GASPRICE指令，0x3
- 所有的指令都是针对"256位的字（word）"这个基本的数据类型来进行操作。
- 具备常用的算术、位、逻辑和比较操作，也可以做到有条件和无条件跳转。
- 合约可以访问当前区块的相关属性，比如区块的高度、区块的时间戳、区块的难度等。

## 消息调用

- 合约调用
  - 合约可以调用其他合约，也可以调用外部账户。
  - 合约调用的gas开销是最大的，因为合约调用会产生一个新的EVM实例，新的EVM实例会复制当前合约的状态，然后执行合约调用的代码，执行完毕后，会将新的状态写回到当前合约的状态中。
- 外部账户调用
- 以太坊的消息调用是基于栈的，消息调用的参数和返回值都是通过栈来传递的。
- 消息调用的参数和返回值都是以256位字为单位的，也就是说，如果消息调用的参数是一个32字节的数组，那么这个数组会被分成32个256位字，每个256位字都会被压入栈中。

## 委托调用

- 委托调用是一种特殊的消息调用，它的gas开销是最小的，因为委托调用不会产生新的EVM实例，也不会复制当前合约的状态，而是直接使用当前合约的状态。
- 目标地址的代码将在发起调用的合约的上下文中执行，并且msg.sender和msg.value将与发起调用的合约相同。
- 可以由此实现合约的升级，比如合约A调用合约B，合约B的代码发生了变化，那么合约A调用合约B的时候，就会调用合约B的新代码。
- 可以由此实现"库"，可以将复用的代码库抽取出来，然后通过委托调用的方式来调用这些代码库。

## 合约的创建与自毁

- 通过一个特殊的消息调用来创建合约，这个特殊的消息调用的目标地址是0x0，这个消息调用的数据就是合约的代码。
- 通过create calls，合约可以创建其他合约。
- 合约创建其他合约，不会写在区块链上，在内存里面，l而是写在交易的日志中。
- 合约代码从区块链上移除的唯一方式就是自毁，通过selfdestruct指令来实现自毁。



# solidity

## 子货币

```solidity
pragma solidity ^0.4.22;

contract Coin{
    address public minter;
    mapping (address => uint) public balances;

    event Sent(address from, address to, uint amount);

    constructor() public {
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        require(amount < 1e60);
        balances[receiver] += amount;
    }

    function send(address receiver, uint amount) public {
        require(amount <= balances[msg.sender], "Insufficient balance.");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}
```



## 数据结构

- 字符数组

  - 定长
    - 值类型，bytes1, bytes2, .... bytes32 分别代表了长度为1到32的字节序列
    - 有一个.length属性，返回数组长度
  - 变长
    - 引用类型
    - 包括bytes，string， 不同的是bytes是Hex字符串，string是UTF-8编码的字符串

- 枚举 （Enum）

  - 枚举类型用来用户自定义二一组常量值

  - 与C语言的枚举类型非常相似，对应整型值

    ```solidity
    pragma solidity >=0.4.0 <0.6.0
    contract Purchase {
    	enum State {Created, Locked, Inactive}
    }
    ```

- 数组 （Array)

  - 固定大小k和元素类型T的数组被写为`T[K]`, 动态大小的数组为`T[]`。
    - 一个由5个uint动态数组组成的数组是`uint[][5]` 
    - 如果要添加新元素，则必须使用.push() 或将.length增大
    - 变长的storage数组和bytes （不包括string）有一个push()方法，可以将一个新元素附加到数组末端，返回值为当前长度。

- 结构 （Struct)

  - 结构类型可以在映射和数组中使用，它们本身可以包含映射和数组

  - 结构不能包含自己类型的成员，但可以作为自己数组成员的类型，也可以作为自己映射成员的值类型

    ```solidity
    pragma solidity >=0.4.0 <0.6.0;
    contract Ballot {
    	struct Voter {
    		uint weight;
    		bool voted;
    		uint vote;
    	}
    }
    ```

- 映射 （Mapping）

  - 声明一个映射：mapping (_KeyType => _ValueType)

  - _KeyType可以是任何基本类型，内置类型加上字节和字符串，不允许使用用户定义的复杂类型，如枚举，映射，结构以及除bytes和string之外的任何数组类型

  - _ValueType可以是任何类型，包括映射。

    ```solidity
    pragma solidity >=0.4.0 <0.6.0;
    contract MappingExample {
    	mapping(address => uint) public balances;
    	function update(uint newBalance) public {
    		balances[msg.sender] = newBalance;
    	}
    }
    	
    	contract MappingUser {
    		function f() public returns (uint) {
    			MappingExample m = new MappingExample();
    			m.update(100);
    			return m.balances(address(this));
    		}
    	}
    ```

## 数据位置

- 所有的复杂类型，即数组、结构和映射类型，都有一个额外属性，“数据位置”， 用来说明数据是保存在内存memory中还是存储storage中
- 根据上下文不同，大多数时候数据有默认的位置，但也可以通过在类型名后增加关键字storage或memory进行修改
- 函数参数（包括返回的参数）的数据位置默认是memory，局部变量的数据位置默认是storage，状态变量的数据位置强制是storage
- 第三种数据位置，calldata，这是一块只读的且不会永久存储的位置，用来存储函数参数。外部函数的参数（非返回参数）的数据位置被强制指定为calldata,效果跟memory差不多。

**总结：**

- 强制指定的数据位置
  - 外部函数的参数（不包括返回参数）：calldata
  - 状态变量：storage
- 默认数据位置
  - 函数参数（包括返回参数）：memory
  - 引用类型的局部变量：storage
  - 值类型的局部变量：栈（stack)
- 特别要求
  - 公开可见（public visible）的函数参数一定是memory类型，如果要求是storage类型，则必须是private或者internal函数，防止随意地公开调用占用资源。 

## 函数声明和类型

```solidity
				 // 函数名称 // 函数 类型 // 返回类型
function getBrand() public view returns (string) {
	return brand;
}
```

函数的值类型有两类： - 内部（internal）函数 和 外部 （external）函数

- 内部函数只能在当前合约内被调用 （更具体来说，在当前代码块内，包括内部库函数和继承的函数中），因为它们不能在当前合约上下文的外部被执行。
- 外部函数由有一个地址和一个函数签名组成，可以通过外部函数调用传递或者返回
- 调用内部函数： 直接使用名字f
- 调用外部函数：this.f (当前合约)，a.f(外部合约)

### 函数可见性

函数可见性可以指定为external，public，internal或者private, 对于状态变量， 不能设置为external，默认是internal.

- external：外部函数作为合约接口的一部分，意味着可以从其他合约和交易中调用。一个外部函数f不能从内部调用（即f不起作用，但this.f()可以）。当收到大量数据时，外部函数才更有效率。
- public：public函数是合约接口的一部分，可以在内部或者通过消息调用，对于public 状态变量，会自动生成一个getter函数。
- Internal：这些函数和状态变量只能是内部访问（即从当前合约内部或从它派生的合约访问），不能使用this调用。
- private：private函数和状态变量仅在当前定义它们的和雨中使用，并且不能被派生合约使用。

### 函数的状态可变性

- pure：纯函数，不允许修改或访问状态
- view：不允许修改状态
- Payable：允许从消息调用中接收以太币Ether
- constant：与view相同，一般指修饰状态变量，除初始化外，不允许赋值

#### 修改状态

- 修改状态变量
- 产生事件
- 创建其他合约
- 使用selfdestruct
- 通过调用发送以太币
- 调用任何没有标记为view或者pure的函数
- 使用低级调用
- 使用包含特定操作码的内联汇编
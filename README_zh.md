# Furnace 示例

该项目是使用 Furnace 交易库的示例实现，展示了如何有效地连接和与加密货币交易所进行交互。

# Furnace

Furnace 是一个高性能的量化交易库，提供类似于 CCXT 的功能，使开发人员能够轻松连接和与多个加密货币交易所进行交互。它提供了一个简单的 API，以便高效的策略开发和部署。

# 特点

1. **高性能架构**：利用 Rust 的 [`monoio`](https://github.com/bytedance/monoio) 驱动 HTTP 客户端和 WebSocket 连接，确保在单核单线程模式下高效绑定 CPU，以获得最佳性能。

2. **统一日志**：集成 Rust 的 [`ftlog`](https://github.com/nonconvextech/ftlog) 库，以标准化 Rust 和 Mojo 之间的日志记录，提供简单的配置以增强调试和监控。

3. **精确时间戳**：采用 [`tscns`](https://github.com/f0cii/tscns-rs) 快速获取时间戳，延迟仅为 7ns，精度为 0.3ns，支持高频交易策略。

4. **ID 生成**：集成 `nanoid` 和 `idgen_next_id` 函数，用于高效且唯一的标识符生成，便于交易跟踪。

5. **定点算术**：实现了一个 `Fixed` 结构，支持高达 999999.999999999999 的数值，满足金融计算的精度需求。

6. **跨线程通信**：基于 [`ringbuf`](https://github.com/agerasev/ringbuf) 特性实现跨线程通信机制，允许灵活的实现替换，以适应各种应用需求。

7. **交易所集成**：目前实现了 Gate.io API，计划扩展对其他交易平台的支持，增强交易操作的灵活性。

8. **Mojo 语言接口**：底层架构已封装，允许完全基于 Mojo 开发交易所接口和交易策略，Mojo 是一种语法类似于 Python、性能与 C++ 和 Rust 相当的语言。

9. **全面支持**：提供完整的技术支持和售后服务，并提供 Mojo 技术指导，以确保成功实施和使用。

# 注意

Furnace 项目是一个非开源项目。要获取完整的源代码，请联系我。

# 系统要求

以下操作系统已通过测试：

* Ubuntu 24.04

# 环境配置

1. 复制环境配置文件：
   ```bash
   cp .env.example .env
   ```

2. 配置 API 密钥：
   - 打开 `.env` 文件
   - 设置您的 Gate.io API 凭证：
     ```
     GATEIO_API_KEY=你的API密钥
     GATEIO_API_SECRET=你的API密钥密文
     GATEIO_TESTNET=True  # 生产环境请设置为 False
     ```
   - 您可以从 [Gate.io](https://www.gate.io/myaccount/apiv4keys) 获取 API 密钥和密文

# 安装依赖

构建和运行示例所需的以下软件包：

* 对于 Debian/Ubuntu 系统：

```bash
sudo apt-get install zlib1g-dev
```

* 对于 Red Hat/CentOS 系统：

```bash
sudo yum install zlib-devel
```

* 对于 Fedora 系统：

```bash
sudo dnf install zlib-devel
```

安装 magic
参考: https://docs.modular.com/magic/

# 测试
```bash
magic shell
source init.sh
mojo test
```

# 使用

```bash
# 1. 打开 magic 终端
magic shell

# 2. 加载 init.sh
source init.sh

# 运行示例

# 1. 同步示例
mojo run gateio-main.mojo
# 2. 异步示例
mojo run gateio-main-async.mojo
# 3. WebSocket 示例
mojo run gateio-ws.mojo
```

# 运行日志 (Run Log)

以下是运行过程中的日志记录示例：

```bash
2025-01-09 00:52:00.276247 0ms DEBUG  [gateio-main.mojo:124] fetch_ticker Time: 4.927818ms
2025-01-09 00:52:00.276275 0ms DEBUG  [gateio-main.mojo:129] Ticker(symbol=BTC_USDT, timestamp=1736383920276, datetime=1970-01-01T00:00:00.000000+00:00, high=97306.5, low=92000, bid=95006.6, bidVolume=0, ask=95006.7, askVolume=0, vwap=0, open=0, close=95006.6, last=95006.6, previousClose=0)
2025-01-09 00:52:00.482160 0ms DEBUG  [gateio-main.mojo:124] fetch_ticker Time: 4.748098ms
2025-01-09 00:52:00.482216 0ms DEBUG  [gateio-main.mojo:129] Ticker(symbol=BTC_USDT, timestamp=1736383920482, datetime=1970-01-01T00:00:00.000000+00:00, high=97306.5, low=92000, bid=95006.6, bidVolume=0, ask=95006.7, askVolume=0, vwap=0, open=0, close=95006.6, last=95006.6, previousClose=0)
2025-01-09 00:52:00.687803 0ms DEBUG  [gateio-main.mojo:124] fetch_ticker Time: 4.463707ms
2025-01-09 00:52:00.687828 0ms DEBUG  [gateio-main.mojo:129] Ticker(symbol=BTC_USDT, timestamp=1736383920687, datetime=1970-01-01T00:00:00.000000+00:00, high=97306.5, low=92000, bid=95006.6, bidVolume=0, ask=95006.7, askVolume=0, vwap=0, open=0, close=95006.6, last=95006.6, previousClose=0)
2025-01-09 00:52:00.893866 0ms DEBUG  [gateio-main.mojo:124] fetch_ticker Time: 4.903219ms
2025-01-09 00:52:00.893892 0ms DEBUG  [gateio-main.mojo:129] Ticker(symbol=BTC_USDT, timestamp=1736383920893, datetime=1970-01-01T00:00:00.000000+00:00, high=97306.5, low=92000, bid=95006.6, bidVolume=0, ask=95006.7, askVolume=0, vwap=0, open=0, close=95006.6, last=95006.6, previousClose=0)
2025-01-09 00:52:01.099758 0ms DEBUG  [gateio-main.mojo:124] fetch_ticker Time: 4.740757ms
2025-01-09 00:52:01.099783 0ms DEBUG  [gateio-main.mojo:129] Ticker(symbol=BTC_USDT, timestamp=1736383921099, datetime=1970-01-01T00:00:00.000000+00:00, high=97306.5, low=92000, bid=95006.6, bidVolume=0, ask=95006.7, askVolume=0, vwap=0, open=0, close=95006.6, last=95006.6, previousClose=0)
2025-01-09 00:52:01.309441 0ms DEBUG  [gateio-main.mojo:124] fetch_ticker Time: 8.435361ms
2025-01-09 00:52:01.309476 0ms DEBUG  [gateio-main.mojo:129] Ticker(symbol=BTC_USDT, timestamp=1736383921309, datetime=1970-01-01T00:00:00.000000+00:00, high=97306.5, low=92000, bid=95006.6, bidVolume=0, ask=95006.7, askVolume=0, vwap=0, open=0, close=95006.6, last=95006.6, previousClose=0)
2025-01-09 00:52:01.515916 0ms DEBUG  [gateio-main.mojo:124] fetch_ticker Time: 5.269196ms
2025-01-09 00:52:01.515942 0ms DEBUG  [gateio-main.mojo:129] Ticker(symbol=BTC_USDT, timestamp=1736383921515, datetime=1970-01-01T00:00:00.000000+00:00, high=97306.5, low=92000, bid=95006.6, bidVolume=0, ask=95006.7, askVolume=0, vwap=0, open=0, close=95006.6, last=95006.6, previousClose=0)
2025-01-09 00:52:01.721698 0ms DEBUG  [gateio-main.mojo:124] fetch_ticker Time: 4.628394ms
2025-01-09 00:52:01.721725 0ms DEBUG  [gateio-main.mojo:129] Ticker(symbol=BTC_USDT, timestamp=1736383921721, datetime=1970-01-01T00:00:00.000000+00:00, high=97306.5, low=92000, bid=95006.6, bidVolume=0, ask=95006.7, askVolume=0, vwap=0, open=0, close=95006.6, last=95006.6, previousClose=0)
2025-01-09 00:52:01.927482 0ms DEBUG  [gateio-main.mojo:124] fetch_ticker Time: 4.612245ms
2025-01-09 00:52:01.927509 0ms DEBUG  [gateio-main.mojo:129] Ticker(symbol=BTC_USDT, timestamp=1736383921927, datetime=1970-01-01T00:00:00.000000+00:00, high=97306.5, low=92000, bid=95006.6, bidVolume=0, ask=95006.7, askVolume=0, vwap=0, open=0, close=95006.6, last=95006.6, previousClose=0)
2025-01-09 00:52:02.133872 0ms DEBUG  [gateio-main.mojo:124] fetch_ticker Time: 5.178685ms
2025-01-09 00:52:02.133924 0ms DEBUG  [gateio-main.mojo:129] Ticker(symbol=BTC_USDT, timestamp=1736383922133, datetime=1970-01-01T00:00:00.000000+00:00, high=97306.5, low=92000, bid=95006.6, bidVolume=0, ask=95006.7, askVolume=0, vwap=0, open=0, close=95006.6, last=95006.6, previousClose=0)
2025-01-09 00:52:02.340160 0ms DEBUG  [gateio-main.mojo:124] fetch_ticker Time: 5.061009ms
2025-01-09 00:52:02.340226 0ms DEBUG  [gateio-main.mojo:129] Ticker(symbol=BTC_USDT, timestamp=1736383922340, datetime=1970-01-01T00:00:00.000000+00:00, high=97306.5, low=92000, bid=95006.6, bidVolume=0, ask=95006.7, askVolume=0, vwap=0, open=0, close=95006.6, last=95006.6, previousClose=0)
2025-01-09 00:52:02.546359 0ms DEBUG  [gateio-main.mojo:124] fetch_ticker Time: 4.970496ms
2025-01-09 00:52:02.546386 0ms DEBUG  [gateio-main.mojo:129] Ticker(symbol=BTC_USDT, timestamp=1736383922546, datetime=1970-01-01T00:00:00.000000+00:00, high=97306.5, low=92000, bid=95006.6, bidVolume=0, ask=95006.7, askVolume=0, vwap=0, open=0, close=95006.6, last=95006.6, previousClose=0)
2025-01-09 00:52:02.761993 0ms DEBUG  [gateio-main.mojo:124] fetch_ticker Time: 14.418381ms
2025-01-09 00:52:02.762018 0ms DEBUG  [gateio-main.mojo:129] Ticker(symbol=BTC_USDT, timestamp=1736383922761, datetime=1970-01-01T00:00:00.000000+00:00, high=97306.5, low=92000, bid=95006.6, bidVolume=0, ask=95006.7, askVolume=0, vwap=0, open=0, close=95006.6, last=95006.6, previousClose=0)
2025-01-09 00:52:02.967835 0ms DEBUG  [gateio-main.mojo:124] fetch_ticker Time: 4.669663ms
2025-01-09 00:52:02.967876 0ms DEBUG  [gateio-main.mojo:129] Ticker(symbol=BTC_USDT, timestamp=1736383922967, datetime=1970-01-01T00:00:00.000000+00:00, high=97306.5, low=92000, bid=95006.6, bidVolume=0, ask=95006.7, askVolume=0, vwap=0, open=0, close=95006.6, last=95006.6, previousClose=0)
2025-01-09 00:52:03.177797 0ms DEBUG  [gateio-main.mojo:124] fetch_ticker Time: 8.749468ms
2025-01-09 00:52:03.177825 0ms DEBUG  [gateio-main.mojo:129] Ticker(symbol=BTC_USDT, timestamp=1736383923177, datetime=1970-01-01T00:00:00.000000+00:00, high=97306.5, low=92000, bid=95006.6, bidVolume=0, ask=95006.7, askVolume=0, vwap=0, open=0, close=95006.6, last=95006.6, previousClose=0)
2025-01-09 00:52:03.383684 0ms DEBUG  [gateio-main.mojo:124] fetch_ticker Time: 4.692723ms
2025-01-09 00:52:03.383710 0ms DEBUG  [gateio-main.mojo:129] Ticker(symbol=BTC_USDT, timestamp=1736383923383, datetime=1970-01-01T00:00:00.000000+00:00, high=97306.5, low=92000, bid=95006.6, bidVolume=0, ask=95006.7, askVolume=0, vwap=0, open=0, close=95006.6, last=95006.6, previousClose=0)
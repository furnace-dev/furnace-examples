# Furnace Example

[中文说明](README_zh.md)

This project is an example implementation using the Furnace trading library, showcasing how to connect and interact with cryptocurrency exchanges effectively.

# Furnace

Furnace is a high-performance quantitative trading library that provides features similar to CCXT, allowing developers to connect and interact with multiple cryptocurrency exchanges easily. It offers a simple API for efficient strategy development and deployment.

# Features

1. **High-Performance Architecture**: Utilizes Rust's [`monoio`](https://github.com/bytedance/monoio) to drive HTTP clients and WebSocket connections, ensuring efficient CPU binding in a single-core, single-threaded mode for optimal performance.

2. **Unified Logging**: Integrates the Rust [`ftlog`](https://github.com/nonconvextech/ftlog) library to standardize logging across both Rust and Mojo, offering simple configuration for enhanced debugging and monitoring.

3. **Precision Timestamping**: Employs [`tscns`](https://github.com/f0cii/tscns-rs) for rapid timestamp acquisition with a latency of only 7ns and a precision of 0.3ns, enabling high-frequency trading strategies.

4. **ID Generation**: Incorporates `nanoid` and `idgen_next_id` functions for efficient and unique identifier generation, essential for transaction tracking.

5. **Fixed-Point Arithmetic**: Implements a `Fixed` structure that supports numerical values up to 999999.999999999999, catering to the precision needs of financial calculations.

6. **Cross-Thread Communication**: Features a cross-thread communication mechanism based on [`ringbuf`](https://github.com/agerasev/ringbuf), allowing for flexible implementation replacements to suit various application needs.

7. **Exchange Integration**: Currently implements the Gate.io API, with plans to expand support to additional trading platforms, enhancing versatility in trading operations.

8. **Mojo Language Interface**: The underlying architecture is encapsulated, enabling the development of exchange interfaces and trading strategies entirely in Mojo, a language with Python-like syntax and performance comparable to C++ and Rust.

9. **Comprehensive Support**: Provides complete technical support and after-sales service, along with guidance on Mojo technology to ensure successful implementation and usage.

# Note

The Furnace project is a non-open-source project. For access to the complete source code, please contact me.

# System Requirements

The following operating systems have been tested:

* Ubuntu 24.04

# Environment Setup

1. Copy the environment configuration file:
   ```bash
   cp .env.example .env
   ```

2. Configure your API keys:
   - Open the `.env` file
   - Set your Gate.io API credentials:
     ```
     GATEIO_API_KEY=your_api_key
     GATEIO_API_SECRET=your_api_secret
     GATEIO_TESTNET=True  # Set to False for production
     ```
   - You can obtain your API key and secret from [Gate.io](https://www.gate.io/myaccount/apiv4keys)

# Installing Dependencies

The following packages are required to build and run example:

* For Debian/Ubuntu systems:
```bash
sudo apt-get install zlib1g-dev
```

* For Red Hat/CentOS systems：
```bash
sudo yum install zlib-devel
```

* For Fedora systems：
```bash
sudo dnf install zlib-devel
```

# Installing magic
Refer to: https://docs.modular.com/magic/

# Testing
```bash
magic shell
source init.sh
# mojo test (二进制发行版不支持)

```

# Usage
```bash
# 1. Open the magic terminal
magic shell

# 2. Load init.sh
source init.sh

# 3. Compiling examples

# 1. Sync example
./build.sh gateio-main.mojo
./build.sh binance-main.mojo
# 2. Async example
./build.sh gateio-main-async.mojo
# 3. WebSocket example
./build.sh gateio-ws.mojo
```

# Run Log

Below is an example of the log output during the run:

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
```
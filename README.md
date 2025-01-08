# Furnace Example

[中文版本](README_zh.md)

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
mojo test
```

# Usage
```bash
magic shell
source init.sh
mojo run gateio-main.mojo
```

# Run Log

Below is an example of the log output during the run:

```bash
2025-01-08 03:47:49.336029 0ms DEBUG  [gateio-main.mojo:124] fetch_ticker Time: 45.928654ms
2025-01-08 03:47:49.336088 0ms DEBUG  [gateio-main.mojo:129] Ticker(symbol=BTC_USDT, timestamp=1736308069336, datetime=1970-01-01T00:00:00.000000+00:00, high=101969.1, low=96131, bid=96295.6, bidVolume=0, ask=96299.6, askVolume=0, vwap=0, open=0, close=96295.6, last=96295.6, previousClose=0)
2025-01-08 03:47:49.584862 0ms DEBUG  [gateio-main.mojo:124] fetch_ticker Time: 47.310287ms
2025-01-08 03:47:49.584999 0ms DEBUG  [gateio-main.mojo:129] Ticker(symbol=BTC_USDT, timestamp=1736308069584, datetime=1970-01-01T00:00:00.000000+00:00, high=101969.1, low=96131, bid=96295.6, bidVolume=0, ask=96299.6, askVolume=0, vwap=0, open=0, close=96295.6, last=96295.6, previousClose=0)
2025-01-08 03:47:49.833282 0ms DEBUG  [gateio-main.mojo:124] fetch_ticker Time: 46.603162ms
2025-01-08 03:47:49.833354 0ms DEBUG  [gateio-main.mojo:129] Ticker(symbol=BTC_USDT, timestamp=1736308069833, datetime=1970-01-01T00:00:00.000000+00:00, high=101969.1, low=96131, bid=96295.6, bidVolume=0, ask=96299.6, askVolume=0, vwap=0, open=0, close=96295.6, last=96295.6, previousClose=0)
2025-01-08 03:47:50.080156 0ms DEBUG  [gateio-main.mojo:124] fetch_ticker Time: 45.994368ms
2025-01-08 03:47:50.080282 0ms DEBUG  [gateio-main.mojo:129] Ticker(symbol=BTC_USDT, timestamp=1736308070080, datetime=1970-01-01T00:00:00.000000+00:00, high=101969.1, low=96131, bid=96295.6, bidVolume=0, ask=96299.6, askVolume=0, vwap=0, open=0, close=96295.6, last=96295.6, previousClose=0)
```
https://github.com/ccxt/ccxt/blob/master/python/ccxt/base/types.py
https://github.com/ccxt/ccxt/wiki/Manual#order-structure

                                 User
    +-------------------------------------------------------------+
    |                            CCXT                             |
    +------------------------------+------------------------------+
    |            Public            |           Private            |
    +=============================================================+
    │                              .                              |
    │                    The Unified CCXT API                     |
    │                              .                              |
    |       loadMarkets            .           fetchBalance       |
    |       fetchMarkets           .            createOrder       |
    |       fetchCurrencies        .            cancelOrder       |
    |       fetchTicker            .             fetchOrder       |
    |       fetchTickers           .            fetchOrders       |
    |       fetchOrderBook         .        fetchOpenOrders       |
    |       fetchOHLCV             .      fetchClosedOrders       |
    |       fetchStatus            .          fetchMyTrades       |
    |       fetchTrades            .                deposit       |
    |                              .               withdraw       |
    │                              .                              |
    +=============================================================+
    │                              .                              |
    |                     Custom Exchange API                     |
    |         (Derived Classes And Their Implicit Methods)        |
    │                              .                              |
    |       publicGet...           .          privateGet...       |
    |       publicPost...          .         privatePost...       |
    |                              .          privatePut...       |
    |                              .       privateDelete...       |
    |                              .                   sign       |
    │                              .                              |
    +=============================================================+
    │                              .                              |
    |                      Base Exchange Class                    |
    │                              .                              |
    +=============================================================+


https://github.com/ccxt/ccxt/wiki/ccxt.pro.manual
                                 User

    +-------------------------------------------------------------+
    |                          CCXT Pro                           |
    +------------------------------+------------------------------+
    |            Public            .           Private            |
    +=============================================================+
    │                              .                              |
    │                  The Unified CCXT Pro API                   |
    |                              .                              |
    |     loadMarkets              .         watchBalance         |
    |     watchTicker              .         watchOrders          |
    |     watchTickers             .         watchMyTrades        |
    |     watchOrderBook           .         watchPositions       |
    |     watchOHLCV               .         createOrderWs        |
    |     watchStatus              .         editOrderWs          |
    |     watchTrades              .         cancelOrderWs        |
    │     watchOHLCVForSymbols     .         cancelOrdersWs       |
    │     watchTradesForSymbols    .         cancelAllOrdersWs    |
    │     watchOrderBookForSymbols .                              |
    │                              .                              |
    +=============================================================+
    │                          unWatch                            |
    │                   (to stop **watch** method)                |
    +=============================================================+
    │                              .                              |
    |            The Underlying Exchange-Specific APIs            |
    |         (Derived Classes And Their Implementations)         |
    │                              .                              |
    +=============================================================+
    │                              .                              |
    |                 CCXT Pro Base Exchange Class                |
    │                              .                              |
    +=============================================================+

    +-------------------------------------------------------------+
    |                                                             |
    |                            CCXT                             |
    |                                                             |
    +=============================================================+

bbo就是1档行情
那现货就取tickers.symbol，合约就取orderbook 1档

反正你弄成on_orders，on_ticker就行
我只用这两个ws api
其中on_ticker表示bbo
别的ws API都不需要了

subscribe，on_message
进来进handle函数。而parse函数负责解析
弄成on_orders，on_ticker就行


# 以下接口暂时不需要实现
# fetch_closed_orders，fetch_my_trades，fetch_ticker，fetch_tickers，fetch_ohlcv，fetch_status，fetch_currencies，deposit，withdraw

# 以下2个偶尔用用
# fetch_funding_rate
# transfer

# ws
# 把watch函数理解成subscribe，on_message进来进handle函数。而parse函数负责解析。
```


工具:
pip install pytype -i https://pypi.tuna.tsinghua.edu.cn/simple/
pytype file_or_directory

Int128
https://github.com/shabbyrobe/go-num
https://github.com/flang-compiler/flang/blob/master/include/int128.h

https://github.com/i4de/go-ops

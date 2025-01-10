from collections import Dict
from os import getenv
from time import perf_counter_ns
from testing import assert_equal, assert_true
from memory import UnsafePointer, stack_allocation
from mojoenv import load_mojo_env
from ccxt.base.types import *
from monoio_connect import *
from ccxt.base.pro_exchangeable import TradingContext, ExchangeId
from ccxt.foundation.gate import Gate


fn on_order(trading_context: TradingContext, order: Order) -> None:
    logd("on_order start")
    logd("exchange_id: " + str(trading_context.exchange_id))
    logd("account_id: " + trading_context.account_id)
    logd("trader_id: " + trading_context.trader_id)
    logd("=============")
    logd("id: " + order.id)
    logd("symbol: " + order.symbol)
    logd("type: " + order.type)
    logd("side: " + str(order.side))
    logd("amount: " + str(order.amount))
    logd("price: " + str(order.price))
    logd("on_order end")


fn run() raises:
    logd("run")
    # 绑定cpu
    bind_to_cpu_set(0)
    # 创建monoio runtime
    var rt = create_monoio_runtime()

    # 读取配置
    var env_vars = load_mojo_env(".env")
    var api_key = env_vars["GATEIO_API_KEY"]
    var api_secret = env_vars["GATEIO_API_SECRET"]
    var testnet = parse_bool(env_vars["GATEIO_TESTNET"])

    var config = Dict[String, Any]()

    config["api_key"] = api_key
    config["api_secret"] = api_secret
    config["testnet"] = testnet

    # 交易上下文，表示交易所，交易账号和交易机器人id(自定义id)
    var trading_context = TradingContext(
        exchange_id=ExchangeId.gateio, account_id="1", trader_id="1"
    )
    var gate = Gate(config, trading_context, rt, debug=False)
    var params = Dict[String, Any]()

    # 设置异步下单的回调
    gate.set_on_order(on_order)

    # 获取市场
    var market = gate.fetch_markets(params)
    for m in market:
        logd(str(m[].value()))

    # 获取币种
    var currencies = gate.fetch_currencies(params)
    for c in currencies:
        logd(str(c[].value()))

    # 获取ticker
    var ticker = gate.fetch_ticker("BTC_USDT")
    logd(str(ticker))

    # 获取tickers
    var symbols = List[String](capacity=2)
    symbols.append("BTC_USDT")
    var tickers = gate.fetch_tickers(symbols, params)
    for t in tickers:
        logd(str(t[]))

    # 获取order_book
    var order_book = gate.fetch_order_book("BTC_USDT", 10, params)
    for a in order_book.asks:
        logd("a: " + str(a[]))
    for b in order_book.bids:
        logd("b: " + str(b[]))

    # 获取trades
    # var trades = gate.fetch_trades("BTC_USDT", None, None, params)
    # for t in trades:
    #     logd(str(t[]))

    # 获取balance
    var balance = gate.fetch_balance(params)
    logd(str(balance))

    # 下限价单
    # logd("create_order")
    # try:
    #     var order = gate.create_order(
    #         "BTC_USDT",
    #         OrderType.Limit,
    #         OrderSide.Buy,
    #         Fixed(1.0),
    #         Fixed(93000),
    #         params,
    #     )
    #     logd(str(order))
    # except e:
    #     logd("create_order error: " + str(e))
    # logd("create_order end")

    # 撤单
    # var cancel_order = gate.cancel_order(
    #     String("58828270140601928"), String("BTC_USDT"), params
    # )
    # logd(str(cancel_order))

    logd("start")

    # 主循环
    while True:
        try:
            var start = perf_counter_ns()
            var ticker = gate.fetch_ticker("BTC_USDT")
            var end = perf_counter_ns()
            logd(
                String.write(
                    "fetch_ticker Time: ", (end - start) / 1000000, "ms"
                )
            )
            logd(str(ticker))
        except e:
            logd(str(e))

        # 休息
        sleep_ms(rt, 200)


fn main() raises:
    # 初始化日志
    var logger = init_logger(LogLevel.Debug, "", "")
    run()
    # 销毁日志
    destroy_logger(logger)

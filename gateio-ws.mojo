from os import abort
from collections import Dict
from os import getenv
from time import perf_counter_ns
from testing import assert_equal, assert_true
from memory import UnsafePointer, stack_allocation
from sys.ffi import _Global
from utils import Variant
from mojoenv import load_mojo_env
from monoio_connect import *
from ccxt.base.types import Any, OrderType, OrderSide, Num, Order, Ticker
from ccxt.foundation.bybit import Bybit
from ccxt.foundation.gate import Gate
from ccxt.pro.gate import Gate as GatePro
from ccxt.base.pro_exchangeable import TradingContext, ExchangeId
from monoio_connect.pthread import *
from monoio_connect import *
from ccxt.foundation.async_trading_operations import (
    run_async_trading_thread,
)


var gate_client: UnsafePointer[Gate] = UnsafePointer[Gate]()
# flag
var flag = False


fn on_order(trading_context: TradingContext, order: Order) -> None:
    logd("on_order start")
    logd("trading_context: " + str(trading_context))
    logd("order: " + str(order))
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


fn on_ticker(trading_context: TradingContext, ticker: Ticker) -> None:
    logi("on_ticker: " + str(trading_context) + " " + str(ticker))

    if not flag:
        flag = True
        try:
            var params1 = Dict[String, Any]()
            var ok = gate_client[].submit_order(
                "BTC_USDT",
                OrderType.Limit,
                OrderSide.Buy,
                Fixed(1.0),
                Fixed(93000),
                params1,
            )
            logd("ok: " + str(ok))
        except e:
            logd(str(e))


fn init_client() raises:
    var env_vars = load_mojo_env(".env")
    var api_key = env_vars["GATEIO_API_KEY"]
    var api_secret = env_vars["GATEIO_API_SECRET"]
    var testnet = parse_bool(env_vars["GATEIO_TESTNET"])

    var config = Dict[String, Any]()

    config["api_key"] = api_key
    config["api_secret"] = api_secret
    config["testnet"] = testnet

    var trading_context = TradingContext(
        exchange_id=ExchangeId.gateio, account_id="1", trader_id="1"
    )
    gate_client = UnsafePointer[Gate].alloc(1)
    __get_address_as_uninit_lvalue(gate_client.address) = Gate(
        config, trading_context
    )
    gate_client[].set_on_order(on_order)


fn run_ws() raises:
    var rt = create_monoio_runtime()
    var config_pro = Dict[String, Any]()

    var env_vars = load_mojo_env(".env")
    var api_key = env_vars["GATEIO_API_KEY"]
    var api_secret = env_vars["GATEIO_API_SECRET"]
    var testnet = parse_bool(env_vars["GATEIO_TESTNET"])

    config_pro["api_key"] = api_key
    config_pro["api_secret"] = api_secret
    config_pro["testnet"] = testnet
    config_pro["settle"] = "usdt"

    var trading_context = TradingContext(
        exchange_id=ExchangeId.gateio, account_id="1", trader_id="1"
    )
    var gate_pro = GatePro(config_pro, trading_context)
    gate_pro.set_on_ticker(on_ticker)
    gate_pro.set_on_order(on_order)

    # Subscribe to order book depth data
    # var params0 = Dict[String, Any]()
    # params0["interval"] = "100ms"  # Update interval is 100ms
    # gate_pro.subscribe_order_book("BTC_USDT", params0)  # Subscribe to BTC/USDT order book

    # Subscribe to real-time ticker data
    var params1 = Dict[String, Any]()
    gate_pro.subscribe_ticker(
        "BTC_USDT", params1
    )  # Subscribe to BTC/USDT real-time ticker

    # Subscribe to order data
    # var params2 = Dict[String, Any]()
    # gate_pro.subscribe_order("BTC_USDT", params2)  # Subscribe to BTC/USDT order

    gate_pro.connect(rt)


fn main() raises:
    var logger = init_logger(LogLevel.Debug, "", "")

    init_client()

    run_async_trading_thread()

    # run()
    run_ws()

    logd("OK")
    time.sleep(1000000.0)
    destroy_logger(logger)

    # test_rest(api_key, api_secret, testnet)
    # time.sleep(1000000.0)

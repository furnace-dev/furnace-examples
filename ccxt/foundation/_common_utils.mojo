from sys.ffi import _Global
from memory import UnsafePointer
from utils import Variant
from monoio_connect.channel import Channel
from monoio_connect import Fixed
from ccxt.base.types import OrderType, OrderSide, ExchangeId
from ccxt.base.exchangeable import Exchangeable


@value
struct SubmitOrderData:
    var symbol: String
    var order_type: OrderType
    var order_side: OrderSide
    var amount: Fixed
    var price: Fixed

    fn __init__(
        out self,
        symbol: String,
        order_type: OrderType,
        order_side: OrderSide,
        amount: Fixed,
        price: Fixed,
    ):
        self.symbol = symbol
        self.order_type = order_type
        self.order_side = order_side
        self.amount = amount
        self.price = price


@value
struct SubmitCancelOrderData:
    var symbol: String
    var order_id: String

    fn __init__(out self, symbol: String, order_id: String):
        self.symbol = symbol
        self.order_id = order_id


@value
struct AsyncTradingRequest:
    var type: Int  # 0-下单 1-撤单
    var data: Variant[SubmitOrderData, SubmitCancelOrderData]
    var exchange_id: ExchangeId
    var exchange: UnsafePointer[UInt8]

    fn __init__[
        T: Exchangeable
    ](
        out self,
        type: Int,
        data: Variant[SubmitOrderData, SubmitCancelOrderData],
        exchange: UnsafePointer[T],
    ):
        self.type = type
        self.data = data
        self.exchange_id = exchange[].id()
        self.exchange = exchange.bitcast[UInt8]()

    fn bitcast[T: Exchangeable](self) -> UnsafePointer[T]:
        return self.exchange.bitcast[T]()


alias _ASYNC_TRADING_CHANNEL = _Global[
    "_ASYNC_TRADING_CHANNEL",
    Channel,
    _init_async_trading_channel,
]


fn _init_async_trading_channel() -> Channel:
    return Channel(1024)


fn async_trading_channel_ptr() -> UnsafePointer[Channel]:
    return _ASYNC_TRADING_CHANNEL.get_or_create_ptr()


fn save_text_to_file(file_name: String, text: String):
    """Save text to file."""
    try:
        with open(file_name, "w") as f:
            f.write(text)
    except e:
        print("save_text_to_file error: " + str(e))

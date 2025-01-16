from memory import UnsafePointer
from monoio_connect.fixed import Fixed
from ccxt.base.types import *


# 定义 Exchangeable 接口
trait Exchangeable:
    # 公共方法
    fn id(self) -> ExchangeId:
        ...

    fn load_markets(self, mut params: Dict[String, Any]) raises -> List[Market]:
        ...

    fn fetch_markets(
        self, mut params: Dict[String, Any]
    ) raises -> List[Market]:
        ...

    fn fetch_currencies(
        self, mut params: Dict[String, Any]
    ) raises -> List[Currency]:
        ...

    fn fetch_ticker(self: Self, symbol: String) raises -> Ticker:
        ...

    fn fetch_tickers(
        self, symbols: Strings, mut params: Dict[String, Any]
    ) raises -> List[Ticker]:
        ...

    fn fetch_order_book(
        self,
        symbol: String,
        limit: IntOpt,
        mut params: Dict[String, Any],
    ) raises -> OrderBook:
        ...

    # fn fetch_ohlcv(self: Self, symbol: String, timeframe: String, since: Int, limit: Int) -> List[OHLCV]:
    #     ...

    # fn fetch_status(self: Self) -> Status:
    #     ...

    fn fetch_trades(
        self,
        symbol: String,
        since: IntOpt,
        limit: IntOpt,
        mut params: Dict[String, Any],
    ) raises -> List[Trade]:
        ...

    # 私有方法
    fn fetch_balance(self, mut params: Dict[String, Any]) raises -> Balances:
        ...

    fn create_order(
        self,
        symbol: String,
        type: OrderType,
        side: OrderSide,
        amount: Fixed,
        price: Fixed,
        mut params: Dict[String, Any],
    ) raises -> Order:
        ...

    fn cancel_order(
        self, id: String, symbol: Str, mut params: Dict[String, Any]
    ) raises -> Order:
        ...

    fn fetch_order(
        self, id: String, symbol: Str, mut params: Dict[String, Any]
    ) raises -> Order:
        ...

    fn fetch_orders(
        self,
        symbol: Str,
        since: IntOpt,
        limit: IntOpt,
        mut params: Dict[String, Any],
    ) raises -> List[Order]:
        ...

    fn fetch_open_orders(
        self,
        symbol: Str,
        since: IntOpt,
        limit: IntOpt,
        mut params: Dict[String, Any],
    ) raises -> List[Order]:
        ...

    fn fetch_closed_orders(
        self,
        symbol: Str,
        since: IntOpt,
        limit: IntOpt,
        mut params: Dict[String, Any],
    ) raises -> List[Order]:
        ...

    fn fetch_my_trades(
        self,
        symbol: Str,
        since: IntOpt,
        limit: IntOpt,
        mut params: Dict[String, Any],
    ) raises -> List[Trade]:
        ...

    # fn deposit(self: Self, currency: String, amount: Float64) -> Bool:
    #     ...

    # fn withdraw(self: Self, currency: String, amount: Float64) -> Bool:
    #     ...

    fn create_order_async(
        self,
        symbol: String,
        type: OrderType,
        side: OrderSide,
        amount: Fixed,
        price: Fixed,
        mut params: Dict[String, Any],
    ) raises -> None:
        ...

    fn cancel_order_async(
        self, id: String, symbol: String, mut params: Dict[String, Any]
    ) raises -> None:
        ...

    fn on_order(self, order: Order) -> None:
        ...


struct SubmitOrderRequest[T: Exchangeable]:
    """
    提交订单请求.
    """

    var symbol: String
    var type: OrderType
    var side: OrderSide
    var amount: Fixed
    var price: Fixed
    var params: Dict[String, Any]
    var exchange: UnsafePointer[T]

    fn __init__(
        out self,
        symbol: String,
        type: OrderType,
        side: OrderSide,
        amount: Fixed,
        price: Fixed,
        params: Dict[String, Any],
        exchange: UnsafePointer[T],
    ):
        self.symbol = symbol
        self.type = type
        self.side = side
        self.amount = amount
        self.price = price
        self.params = params
        self.exchange = exchange


struct CancelOrderRequest[T: Exchangeable]:
    """
    取消订单请求.
    """

    var id: String
    var symbol: String
    var params: Dict[String, Any]
    var exchange: UnsafePointer[T]

    fn __init__(
        out self,
        id: String,
        symbol: String,
        params: Dict[String, Any],
        exchange: UnsafePointer[T],
    ):
        self.id = id
        self.symbol = symbol
        self.params = params
        self.exchange = exchange

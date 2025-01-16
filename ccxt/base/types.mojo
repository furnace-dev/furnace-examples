from collections import List, Optional, Dict
from collections.optional import _NoneType
from collections.string import _calc_initial_buffer_size, _atol, _atof
from utils import Variant, StringRef
from sonic import JsonObject, JsonType, JsonArray
from monoio_connect import logd, logi, Fixed
from monoio_connect import Method

# alias Any = Variant[NoneType, String, Float64, Int, Bool]
# alias Any = String
alias IndexType = Variant[String, Int]
alias Num = Variant[_NoneType, String, Float64, Int]
alias Str = Optional[String]
alias Strings = Optional[List[String]]
alias IntOpt = Optional[Int]
alias BoolOpt = Optional[Bool]
# alias MarketType = Literal["spot", "margin", "swap", "future", "option"]
# alias SubType = Literal["linear", "inverse"]


@value
struct Any:
    alias Type = Variant[Int, Float64, String, Bool]
    var _data: Self.Type

    @implicit
    fn __init__(out self, owned v: Self.Type):
        self._data = v^

    @implicit
    fn __init__(out self, v: Int):
        self._data = v

    @implicit
    fn __init__(out self, v: Float64):
        self._data = v

    @implicit
    fn __init__(out self, owned v: String):
        self._data = v^

    @implicit
    fn __init__(out self, v: StringLiteral):
        self._data = String(v)

    @implicit
    fn __init__(out self, v: Bool):
        self._data = v

    fn __copyinit__(out self, other: Self):
        self._data = other._data

    fn __moveinit__(out self, owned other: Self):
        self._data = other._data^

    fn __eq__(self, other: Self) -> Bool:
        if self._data._get_discr() != other._data._get_discr():
            return False

        if self.isa[Int]() and other.isa[Int]():
            return self.int() == other.int()
        elif self.isa[Float64]() and other.isa[Float64]():
            return self.float() == other.float()
        elif self.isa[String]() and other.isa[String]():
            return self.string() == other.string()
        elif self.isa[Bool]() and other.isa[Bool]():
            return self.bool() == other.bool()
        return False

    fn __ne__(self, other: Self) -> Bool:
        return not self == other

    fn isa[T: CollectionElement](self) -> Bool:
        return self._data.isa[T]()

    fn get[T: CollectionElement](ref [_]self) -> ref [self._data] T:
        return self._data[T]

    fn int(ref [_]self) -> ref [self._data] Int:
        return self.get[Int]()

    fn string(ref [_]self) -> ref [self._data] String:
        return self.get[String]()

    fn float(ref [_]self) -> ref [self._data] Float64:
        return self.get[Float64]()

    fn bool(ref [_]self) -> ref [self._data] Bool:
        return self.get[Bool]()

    fn write_to[W: Writer](self, mut writer: W):
        if self.isa[Int]():
            self.int().write_to(writer)
        elif self.isa[Float64]():
            self.float().write_to(writer)
        elif self.isa[String]():
            self.string().write_to(writer)
        elif self.isa[Bool]():
            var b = self.bool()
            ("true").write_to(writer) if b else ("false").write_to(writer)

    fn _pretty_to_as_element[W: Writer](self, mut writer: W, indent: String):
        self.write_to(writer)

    fn pretty_to[W: Writer](self, mut writer: W, indent: String):
        self.write_to(writer)

    fn min_size_for_string(self) -> Int:
        if self.isa[Int]():
            return _calc_initial_buffer_size(self.int()) - 1
        elif self.isa[Float64]():
            return _calc_initial_buffer_size(self.float()) - 1
        elif self.isa[String]():
            return len(self.string()) + 2  # include the surrounding quotes
        elif self.isa[Bool]():
            return 4 if self.bool() else 5

        return 0

    @always_inline
    fn __str__(self) -> String:
        var output = String()
        self.write_to(output)
        return output^

    @always_inline
    fn __repr__(self) -> String:
        return self.__str__()


@value
@register_passable("trivial")
struct OrderSide(Stringable):
    var _value: Int8

    alias Buy = OrderSide(0)
    alias Sell = OrderSide(1)

    fn __eq__(self, other: OrderSide) -> Bool:
        return self._value == other._value

    fn __str__(self) -> String:
        if self == OrderSide.Buy:
            return "buy"
        elif self == OrderSide.Sell:
            return "sell"
        else:
            return "unknown"


@value
@register_passable("trivial")
struct OrderType(Stringable):
    var _value: Int8

    alias Limit = OrderType(0)
    alias Market = OrderType(1)

    fn __eq__(self, other: OrderType) -> Bool:
        return self._value == other._value

    fn __str__(self) -> String:
        if self == OrderType.Limit:
            return "limit"
        elif self == OrderType.Market:
            return "market"
        else:
            return "unknown"


@value
@register_passable("trivial")
struct PositionSide(Stringable):
    var _value: Int8

    alias Long = PositionSide(0)
    alias Short = PositionSide(1)

    fn __eq__(self, other: PositionSide) -> Bool:
        return self._value == other._value

    fn __str__(self) -> String:
        if self == PositionSide.Long:
            return "long"
        elif self == PositionSide.Short:
            return "short"
        else:
            return "unknown"


@value
@register_passable("trivial")
struct ApiType(Stringable):
    var _value: Int8

    alias Public = ApiType(0)
    alias Private = ApiType(1)

    fn __eq__(self, other: ApiType) -> Bool:
        return self._value == other._value

    fn __str__(self) -> String:
        if self == ApiType.Public:
            return "public"
        elif self == ApiType.Private:
            return "private"
        else:
            return "unknown"


@value
struct Entry:
    var name: Optional[String]
    var path: String
    var api: ApiType
    var method: Method
    var config: Dict[String, Any]

    fn __init__(
        out self,
        path: String,
        api: String,
        method: String,
        config: String,
    ):
        # logd("Entry init")
        self.name = None
        self.path = path
        # logd("path: " + path)
        if api.startswith("["):
            # '["public", "margin"]'
            # '["private", "unified"]'
            var arr = JsonArray(api)
            var api_type = arr.get_str(0)
            if api_type == "public":
                self.api = ApiType.Public
            elif api_type == "private":
                self.api = ApiType.Private
            else:
                self.api = ApiType.Public
            var sub_api = arr.get_str(1)
            self.path = sub_api + "/" + path
        elif api == "public":
            self.api = ApiType.Public
        elif api == "private":
            self.api = ApiType.Private
        elif api.startswith("fapi"):
            # 以下是币安期货API的命名规则
            # fapiPublic
            # fapiPublicV2
            # fapiPrivate
            # fapiPrivateV2
            # fapiPrivateV3
            # logd("path: " + path + ", api=" + api)
            var api_ = api.replace("fapi", "")
            if api_.startswith("Public"):
                self.api = ApiType.Public
                api_ = api_.replace("Public", "")
            elif api_.startswith("Private"):
                self.api = ApiType.Private
                api_ = api_.replace("Private", "")
            else:
                self.api = ApiType.Public
                api_ = api_.replace("Public", "")
            if api_.startswith("V2"):
                self.path = "/fapi/v2/" + path
            elif api_.startswith("V3"):
                self.path = "/fapi/v3/" + path
            else:
                self.path = "/fapi/v1/" + path
        elif api.startswith("dapi"):
            # dapiPrivate
            # dapiPrivateV2
            # dapiPublic
            # dapiPublicV2
            var api_ = api.replace("dapi", "")
            if api_.startswith("Private"):
                self.api = ApiType.Private
                api_ = api_.replace("Private", "")
            else:
                self.api = ApiType.Public
                api_ = api_.replace("Public", "")
            if api_.startswith("V2"):
                self.path = "/dapi/v2/" + path
            else:
                self.path = "/dapi/v1/" + path
        else:
            self.api = ApiType.Public

        if method == "GET":
            self.method = Method.METHOD_GET
        elif method == "POST":
            self.method = Method.METHOD_POST
        elif method == "PUT":
            self.method = Method.METHOD_PUT
        elif method == "DELETE":
            self.method = Method.METHOD_DELETE
        else:
            # raise Error("Invalid method: " + method)
            self.method = Method.METHOD_GET
        # logd("config=" + config)
        var doc = JsonObject(config)
        var keys = doc.keys()
        self.config = Dict[String, Any]()
        for key in keys:
            var s_ref = StringRef(key[].unsafe_ptr(), len(key[]))
            var value = doc.get_value(s_ref)
            var v_type = value.get_type()
            if v_type == JsonType.JsonType_String:
                self.config[key[]] = value.as_str()
            elif v_type == JsonType.JsonType_Boolean:
                self.config[key[]] = value.as_bool()
            elif v_type == JsonType.JsonType_Number:
                var f = value.as_f64()
                if f == float(int(f)):
                    self.config[key[]] = int(f)
                else:
                    self.config[key[]] = f
            elif v_type == JsonType.JsonType_Array:
                pass
            else:
                logi("unknown type: " + str(v_type._value))
        # logd("Entry init end")

    fn __set_name__(mut self, name: String) -> None:
        self.name = name


@value
@register_passable("trivial")
struct MarketType(Stringable):
    var _value: Int8

    alias Spot = MarketType(0)
    alias Margin = MarketType(1)
    alias Swap = MarketType(2)
    alias Future = MarketType(3)
    alias Option = MarketType(4)

    fn __eq__(self, other: MarketType) -> Bool:
        return self._value == other._value

    fn __str__(self) -> String:
        if self == MarketType.Spot:
            return "spot"
        elif self == MarketType.Margin:
            return "margin"
        elif self == MarketType.Swap:
            return "swap"
        elif self == MarketType.Future:
            return "future"
        elif self == MarketType.Option:
            return "option"
        else:
            return "unknown"


@value
@register_passable("trivial")
struct SubType(Stringable):
    var _value: Int8

    alias Linear = SubType(0)
    alias Inverse = SubType(1)

    fn __eq__(self, other: SubType) -> Bool:
        return self._value == other._value

    fn __str__(self) -> String:
        if self == SubType.Linear:
            return "linear"
        elif self == SubType.Inverse:
            return "inverse"
        else:
            return "unknown"


@value
struct FeeInterface:
    var currency: String
    var cost: Num
    # var rate: NotRequired[Num]


alias Fee = Optional[FeeInterface]


@value
struct TradingFeeInterface:
    var info: Dict[String, Any]
    var symbol: String
    var maker: Num
    var taker: Num
    var percentage: Bool
    var tierBased: Bool


@value
struct Balance(Stringable):
    var free: Fixed
    var used: Fixed
    var total: Fixed

    fn __init__(out self):
        self.free = Fixed.zero
        self.used = Fixed.zero
        self.total = Fixed.zero

    fn __init__(out self, free: Fixed, used: Fixed, total: Fixed):
        self.free = free
        self.used = used
        self.total = total

    fn __str__(self) -> String:
        return String.write(
            "Balance(free=",
            str(self.free),
            ", used=",
            str(self.used),
            ", total=",
            str(self.total),
            ")",
        )


@value
struct BalanceAccount:
    var free: String
    var used: String
    var total: String


@value
struct Account:
    var id: String
    var type: String
    var code: String
    var info: Dict[String, Any]


@value
struct Trade(Stringable):
    var info: Dict[String, Any]
    var amount: Fixed
    var datetime: Str
    var id: String
    var order: Str
    var price: Fixed
    var timestamp: Int
    var type: Str
    var side: String
    var symbol: String
    var takerOrMaker: Str
    var cost: Fixed
    var fee: Fee

    fn __str__(self) -> String:
        return String.write(
            "Trade(id=",
            self.id,
            ", symbol=",
            str(self.symbol),
            ", side=",
            str(self.side),
            ", amount=",
            str(self.amount),
            ", price=",
            str(self.price),
            ", cost=",
            str(self.cost),
            ")",
        )


@value
struct Position:
    var info: Dict[String, Any]
    var symbol: Str
    var id: Str
    var timestamp: Int
    var datetime: Str
    var contracts: Num
    var contractSize: Num
    var side: Str
    var notional: Num
    var leverage: Num
    var unrealizedPnl: Num
    var realizedPnl: Num
    var collateral: Num
    var entryPrice: Num
    var markPrice: Num
    var liquidationPrice: Num
    var hedged: Bool
    var maintenanceMargin: Num
    var initialMargin: Num
    var initialMarginPercentage: Num
    var marginMode: Str
    var marginRatio: Num
    var lastUpdateTimestamp: Int
    var lastPrice: Num
    var percentage: Num
    var stopLossPrice: Num
    var takeProfitPrice: Num


@value
struct OrderRequest:
    var symbol: String
    var type: String
    var side: String
    var amount: Optional[Num]
    var price: Optional[Num]
    var params: Dict[String, Any]


@value
struct CancellationRequest:
    var id: String
    var symbol: String
    var clientOrderId: String


@value
struct Order(Stringable):
    var info: Dict[String, Any]
    var id: String
    var clientOrderId: String
    var datetime: String
    var timestamp: Int
    var lastTradeTimestamp: Int
    var lastUpdateTimestamp: Int
    var status: String
    var symbol: String
    var type: String
    var timeInForce: String
    var side: OrderSide
    var price: Fixed
    var average: Fixed
    var amount: Fixed
    var filled: Fixed
    var remaining: Fixed
    var stopPrice: Fixed
    var takeProfitPrice: Fixed
    var stopLossPrice: Fixed
    var cost: Fixed
    var trades: List[Trade]
    var reduceOnly: Bool
    var postOnly: Bool
    var fee: Fee

    fn __init__(out self):
        self.info = Dict[String, Any]()
        self.id = ""
        self.clientOrderId = ""
        self.datetime = ""
        self.timestamp = 0
        self.lastTradeTimestamp = 0
        self.lastUpdateTimestamp = 0
        self.status = ""
        self.symbol = ""
        self.type = ""
        self.timeInForce = ""
        self.side = OrderSide.Buy
        self.price = Fixed.zero
        self.average = Fixed.zero
        self.amount = Fixed.zero
        self.filled = Fixed.zero
        self.remaining = Fixed.zero
        self.stopPrice = Fixed.zero
        self.takeProfitPrice = Fixed.zero
        self.stopLossPrice = Fixed.zero
        self.cost = Fixed.zero
        self.trades = List[Trade]()
        self.reduceOnly = False
        self.postOnly = False
        self.fee = None

    fn __init__(
        out self,
        info: Dict[String, Any],
        id: String,
        clientOrderId: String,
        datetime: String,
        timestamp: Int,
        lastTradeTimestamp: Int,
        lastUpdateTimestamp: Int,
        status: String,
        symbol: String,
        type: String,
        timeInForce: String,
        side: OrderSide,
        price: Fixed,
        average: Fixed,
        amount: Fixed,
        filled: Fixed,
        remaining: Fixed,
        stopPrice: Fixed,
        takeProfitPrice: Fixed,
        stopLossPrice: Fixed,
        cost: Fixed,
        trades: List[Trade],
        reduceOnly: Bool,
        postOnly: Bool,
        fee: Fee,
    ):
        self.info = info
        self.id = id
        self.clientOrderId = clientOrderId
        self.datetime = datetime
        self.timestamp = timestamp
        self.lastTradeTimestamp = lastTradeTimestamp
        self.lastUpdateTimestamp = lastUpdateTimestamp
        self.status = status
        self.symbol = symbol
        self.type = type
        self.timeInForce = timeInForce
        self.side = side
        self.price = price
        self.average = average
        self.amount = amount
        self.filled = filled
        self.remaining = remaining
        self.stopPrice = stopPrice
        self.takeProfitPrice = takeProfitPrice
        self.stopLossPrice = stopLossPrice
        self.cost = cost
        self.trades = trades
        self.reduceOnly = reduceOnly
        self.postOnly = postOnly
        self.fee = fee

    fn __str__(self) -> String:
        return String.write(
            "Order(id=",
            self.id,
            ", symbol=",
            self.symbol,
            ", type=",
            self.type,
            ", side=",
            str(self.side),
            ", amount=",
            str(self.amount),
            ", price=",
            str(self.price),
            ")",
        )


@value
struct Liquidation:
    var info: Dict[String, Any]
    var symbol: Str
    var timestamp: Int
    var datetime: Str
    var price: Num
    var baseValue: Num
    var quoteValue: Num


@value
struct FundingHistory:
    var info: Dict[String, Any]
    var symbol: Str
    var code: Str
    var timestamp: Int
    var datetime: Str
    var id: Str
    var amount: Num


@value
struct Balances(Stringable):
    var data: Dict[String, Balance]
    var datetime: String
    var timestamp: Int

    fn __init__(out self):
        self.data = Dict[String, Balance]()
        self.datetime = String("")
        self.timestamp = 0

    fn __str__(self) -> String:
        var data = String("")
        var n = len(self.data)
        for k_v in self.data.items():
            if n > 0:
                data += ", "
            data += String.write(k_v[].key, ": ", str(k_v[].value))
            n -= 1
        return String.write(
            "Balances(datetime=",
            self.datetime,
            ", timestamp=",
            str(self.timestamp),
            ", data=",
            data,
            ")",
        )


@value
struct OrderbookEntry(Stringable):
    var price: Fixed
    var amount: Fixed

    fn __init__(out self, price: Fixed, amount: Fixed):
        self.price = price
        self.amount = amount

    fn __str__(self) -> String:
        return String.write(
            "OrderbookEntry(price=",
            str(self.price),
            ", amount=",
            str(self.amount),
            ")",
        )


@value
struct OrderBook(Stringable):
    var asks: List[OrderbookEntry]
    var bids: List[OrderbookEntry]
    var datetime: Str
    var timestamp: Int
    var nonce: Int
    var symbol: Str

    fn __init__(out self):
        self.asks = List[OrderbookEntry]()
        self.bids = List[OrderbookEntry]()
        self.datetime = None
        self.timestamp = 0
        self.nonce = 0
        self.symbol = None

    fn __str__(self) -> String:
        return String.write(
            "OrderBook(symbol=",
            self.symbol.value() if self.symbol else "",
            ", timestamp=",
            str(self.timestamp),
            ", datetime=",
            self.datetime.value() if self.datetime else "",
            # ", asks=",
            # str(self.asks),
            # ", bids=",
            # str(self.bids),
            ")",
        )


@value
struct Transaction:
    var info: Dict[String, Any]
    var id: Str
    var txid: Str
    var timestamp: Int
    var datetime: Str
    var address: Str
    var addressFrom: Str
    var addressTo: Str
    var tag: Str
    var tagFrom: Str
    var tagTo: Str
    var type: Str
    var amount: Num
    var currency: Str
    var status: Str
    var updated: Int
    var fee: Fee
    var network: Str
    var comment: Str
    var internal: Bool


@value
struct TransferEntry:
    var info: Dict[String, Any]
    var id: Str
    var timestamp: Int
    var datetime: Str
    var currency: Str
    var amount: Num
    var fromAccount: Str
    var toAccount: Str
    var status: Str


@value
struct Ticker(Stringable):
    var info: Dict[String, Any]
    var symbol: Str
    var timestamp: Int
    var datetime: Str
    var high: Fixed
    var low: Fixed
    var bid: Fixed
    var bidVolume: Fixed
    var ask: Fixed
    var askVolume: Fixed
    var vwap: Fixed
    var open: Fixed
    var close: Fixed
    var last: Fixed
    var previousClose: Fixed
    var change: Fixed
    var percentage: Fixed
    var average: Fixed
    var quoteVolume: Fixed
    var baseVolume: Fixed
    var markPrice: Fixed
    var indexPrice: Fixed

    fn __init__(out self):
        self.info = Dict[String, Any]()
        self.symbol = None
        self.timestamp = 0
        self.datetime = None
        self.high = Fixed.zero
        self.low = Fixed.zero
        self.bid = Fixed.zero
        self.bidVolume = Fixed.zero
        self.ask = Fixed.zero
        self.askVolume = Fixed.zero
        self.vwap = Fixed.zero
        self.open = Fixed.zero
        self.close = Fixed.zero
        self.last = Fixed.zero
        self.previousClose = Fixed.zero
        self.change = Fixed.zero
        self.percentage = Fixed.zero
        self.average = Fixed.zero
        self.quoteVolume = Fixed.zero
        self.baseVolume = Fixed.zero
        self.markPrice = Fixed.zero
        self.indexPrice = Fixed.zero

    fn __init__(
        out self,
        info: Dict[String, Any],
        symbol: Str,
        timestamp: Int,
        datetime: Str,
        high: Fixed,
        low: Fixed,
        bid: Fixed,
        bidVolume: Fixed,
        ask: Fixed,
        askVolume: Fixed,
        vwap: Fixed,
        open: Fixed,
        close: Fixed,
        last: Fixed,
        previousClose: Fixed,
        change: Fixed,
        percentage: Fixed,
        average: Fixed,
        quoteVolume: Fixed,
        baseVolume: Fixed,
        markPrice: Fixed,
        indexPrice: Fixed,
    ):
        self.info = info
        self.symbol = symbol
        self.timestamp = timestamp
        self.datetime = datetime
        self.high = high
        self.low = low
        self.bid = bid
        self.bidVolume = bidVolume
        self.ask = ask
        self.askVolume = askVolume
        self.vwap = vwap
        self.open = open
        self.close = close
        self.last = last
        self.previousClose = previousClose
        self.change = change
        self.percentage = percentage
        self.average = average
        self.quoteVolume = quoteVolume
        self.baseVolume = baseVolume
        self.markPrice = markPrice
        self.indexPrice = indexPrice

    fn __str__(self) -> String:
        var datetime_str = String(
            ""
        ) if self.datetime is None else self.datetime.value()
        var symbol_str = String(
            ""
        ) if self.symbol is None else self.symbol.value()
        return String.write(
            "Ticker(symbol=",
            symbol_str,
            ", timestamp=",
            self.timestamp,
            ", datetime=",
            datetime_str,
            ", high=",
            str(self.high),
            ", low=",
            str(self.low),
            ", bid=",
            str(self.bid),
            ", bidVolume=",
            str(self.bidVolume),
            ", ask=",
            str(self.ask),
            ", askVolume=",
            str(self.askVolume),
            ", vwap=",
            str(self.vwap),
            ", open=",
            str(self.open),
            ", close=",
            str(self.close),
            ", last=",
            str(self.last),
            ", previousClose=",
            str(self.previousClose),
            ")",
        )


alias Tickers = Dict[String, Ticker]


@value
struct MarginMode:
    var info: Dict[String, Any]
    var symbol: String
    var marginMode: String


alias MarginModes = Dict[String, MarginMode]


@value
struct Leverage:
    var info: Dict[String, Any]
    var symbol: Str
    var marginMode: Str
    var longLeverage: Num
    var shortLeverage: Num


alias Leverages = Dict[String, Leverage]


@value
struct Greeks:
    var symbol: Str
    var timestamp: Int
    var datetime: Str
    var delta: Num
    var gamma: Num
    var theta: Num
    var vega: Num
    var rho: Num
    var bidSize: Num
    var askSize: Num
    var bidImpliedVolatility: Num
    var askImpliedVolatility: Num
    var markImpliedVolatility: Num
    var bidPrice: Num
    var askPrice: Num
    var markPrice: Num
    var lastPrice: Num
    var underlyingPrice: Num
    var info: Dict[String, Any]


@value
struct Conversion:
    var info: Dict[String, Any]
    var timestamp: Int
    var datetime: Str
    var id: Str
    var fromCurrency: Str
    var fromAmount: Num
    var toCurrency: Str
    var toAmount: Num
    var price: Num
    var fee: Num


@value
struct Option:
    var info: Dict[String, Any]
    var currency: Str
    var symbol: Str
    var timestamp: Int
    var datetime: Str
    var impliedVolatility: Num
    var openInterest: Num
    var bidPrice: Num
    var askPrice: Num
    var midPrice: Num
    var markPrice: Num
    var lastPrice: Num
    var underlyingPrice: Num
    var change: Num
    var percentage: Num
    var baseVolume: Num
    var quoteVolume: Num


alias OptionChain = Dict[String, Option]


@value
struct MarketMarginModes:
    var cross: Bool
    var isolated: Bool

    fn __init__(out self, cross: Bool, isolated: Bool):
        self.cross = cross
        self.isolated = isolated


@value
struct MinMax:
    var min: Num
    var max: Num


@value
struct MarketLimits:
    var amount: Optional[MinMax]
    var cost: Optional[MinMax]
    var leverage: Optional[MinMax]
    var price: Optional[MinMax]
    var market: Optional[MinMax]


@value
struct MarketInterface(Stringable):
    var info: Dict[String, Any]
    var id: Str
    var symbol: Str
    var base: Str
    var quote: Str
    var baseId: Str
    var quoteId: Str
    var active: Bool
    var type: Str
    var subType: Str
    var spot: Bool
    var margin: Bool
    var marginModes: MarketMarginModes
    var swap: Bool
    var future: Bool
    var option: Bool
    var contract: Bool
    var settle: Str
    var settleId: Str
    var contractSize: Fixed
    var linear: Bool
    var inverse: Bool
    var expiry: Num
    var expiryDatetime: Str
    var strike: Num
    var optionType: Str
    var taker: Fixed
    var maker: Fixed
    var percentage: Bool
    var tierBased: Bool
    var feeSide: Str
    var precision: Any
    var limits: MarketLimits
    var created: Int

    fn __init__(out self):
        self.info = Dict[String, Any]()
        self.id = None
        self.symbol = None
        self.base = None
        self.quote = None
        self.baseId = None
        self.quoteId = None
        self.active = False
        self.type = None
        self.subType = None
        self.spot = False
        self.margin = False
        self.marginModes = MarketMarginModes(False, False)
        self.swap = False
        self.future = False
        self.option = False
        self.contract = False
        self.settle = None
        self.settleId = None
        self.contractSize = Fixed.zero
        self.linear = False
        self.inverse = False
        self.expiry = _NoneType()
        self.expiryDatetime = None
        self.strike = _NoneType()
        self.optionType = None
        self.taker = Fixed.zero
        self.maker = Fixed.zero
        self.percentage = False
        self.tierBased = False
        self.feeSide = None
        self.precision = 0
        self.limits = MarketLimits(None, None, None, None, None)
        self.created = 0

    fn __init__(
        out self,
        info: Dict[String, Any],
        id: Str,
        symbol: Str,
        base: Str,
        quote: Str,
        baseId: Str,
        quoteId: Str,
        active: Bool,
        type: Str,
        subType: Str,
        spot: Bool,
        margin: Bool,
        marginModes: MarketMarginModes,
        swap: Bool,
        future: Bool,
        option: Bool,
        contract: Bool,
        settle: Str,
        settleId: Str,
        contractSize: Fixed,
        linear: Bool,
        inverse: Bool,
        expiry: Num,
        expiryDatetime: Str,
        strike: Num,
        optionType: Str,
        taker: Fixed,
        maker: Fixed,
        percentage: Bool,
        tierBased: Bool,
        feeSide: Str,
        precision: Any,
        limits: MarketLimits,
        created: Int,
    ):
        self.info = info
        self.id = id
        self.symbol = symbol
        self.base = base
        self.quote = quote
        self.baseId = baseId
        self.quoteId = quoteId
        self.active = active
        self.type = type
        self.subType = subType
        self.spot = spot
        self.margin = margin
        self.marginModes = marginModes
        self.swap = swap
        self.future = future
        self.option = option
        self.contract = contract
        self.settle = settle
        self.settleId = settleId
        self.contractSize = contractSize
        self.linear = linear
        self.inverse = inverse
        self.expiry = expiry
        self.expiryDatetime = expiryDatetime
        self.strike = strike
        self.optionType = optionType
        self.taker = taker
        self.maker = maker
        self.percentage = percentage
        self.tierBased = tierBased
        self.feeSide = feeSide
        self.precision = precision
        self.limits = limits
        self.created = created

    fn __str__(self) -> String:
        var symbol_str = String(
            ""
        ) if self.symbol is None else self.symbol.value()
        return String.write(
            "MarketInterface(symbol=",
            symbol_str,
            ", contractSize=",
            str(self.contractSize),
            ", precision=",
            str(self.precision),
            ")",
        )


@value
struct Limit:
    var min: Num
    var max: Num


@value
struct CurrencyLimits:
    var amount: Limit
    var withdraw: Limit


@value
struct CurrencyInterface(Stringable):
    var id: Str
    var code: Str
    var numericId: Int
    var precision: Fixed
    var type: Str
    var margin: Bool
    var name: Str
    var active: Bool
    var deposit: Bool
    var withdraw: Bool
    var fee: Fixed
    var limits: CurrencyLimits
    var networks: Dict[String, Any]
    var info: Any

    fn __init__(out self):
        self.id = None
        self.code = None
        self.numericId = 0
        self.precision = Fixed.zero
        self.type = None
        self.margin = False
        self.name = None
        self.active = False
        self.deposit = False
        self.withdraw = False
        self.fee = Fixed.zero
        self.limits = CurrencyLimits(
            Limit(min=_NoneType(), max=_NoneType()),
            Limit(min=_NoneType(), max=_NoneType()),
        )
        self.networks = Dict[String, Any]()
        self.info = ""

    fn __str__(self) -> String:
        return String.write(
            "CurrencyInterface(id=",
            "" if self.id is None else self.id.value(),
            ", code=",
            "" if self.code is None else self.code.value(),
            ", numericId=",
            self.numericId,
            ", precision=",
            str(self.precision),
            ", type=",
            "" if self.type is None else self.type.value(),
            ", margin=",
            self.margin,
            ", name=",
            "" if self.name is None else self.name.value(),
            ", active=",
            self.active,
            ", deposit=",
            self.deposit,
            ", withdraw=",
            self.withdraw,
            ")",
        )


@value
struct LastPrice:
    var symbol: Str
    var timestamp: Int
    var datetime: Str
    var price: Num
    var side: OrderSide
    var info: Dict[String, Any]


@value
struct MarginModificationType(Stringable):
    var _value: Int8

    alias Add = MarginModificationType(0)
    alias Reduce = MarginModificationType(1)
    alias Set = MarginModificationType(2)

    fn __eq__(self, other: MarginModificationType) -> Bool:
        return self._value == other._value

    fn __str__(self) -> String:
        if self == MarginModificationType.Add:
            return "add"
        elif self == MarginModificationType.Reduce:
            return "reduce"
        elif self == MarginModificationType.Set:
            return "set"
        else:
            return "unknown"


@value
struct MarginModificationMode(Stringable):
    var _value: Int8

    alias Isolated = MarginModificationMode(0)
    alias Cross = MarginModificationMode(1)

    fn __eq__(self, other: MarginModificationMode) -> Bool:
        return self._value == other._value

    fn __str__(self) -> String:
        if self == MarginModificationMode.Isolated:
            return "isolated"
        elif self == MarginModificationMode.Cross:
            return "cross"
        else:
            return "unknown"


@value
struct MarginModification:
    var info: Dict[String, Any]
    var symbol: Str
    var type: Optional[MarginModificationType]
    var marginMode: Optional[MarginModificationMode]
    var amount: Optional[Float64]
    var code: Str
    var status: Str
    var timestamp: Int
    var datetime: Str


@value
struct CrossBorrowRate:
    var info: Dict[String, Any]
    var currency: Str
    var rate: Float64
    var period: Optional[Float64]
    var timestamp: Int
    var datetime: Str


@value
struct IsolatedBorrowRate:
    var info: Dict[String, Any]
    var symbol: Str
    var base: Str
    var baseRate: Float64
    var quote: Str
    var quoteRate: Float64
    var period: Int
    var timestamp: Int
    var datetime: Str


@value
struct FundingRate:
    var symbol: Str
    var timestamp: Int
    var fundingRate: Num
    var datetime: Str
    var markPrice: Num
    var indexPrice: Num
    var interestRate: Num
    var estimatedSettlePrice: Num
    var fundingTimestamp: Int
    var fundingDatetime: Str
    var nextFundingTimestamp: Int
    var nextFundingDatetime: Str
    var nextFundingRate: Num
    var previousFundingTimestamp: Int
    var previousFundingDatetime: Str
    var previousFundingRate: Num
    var info: Dict[String, Any]
    var interval: Str


@value
struct LeverageTier:
    var tier: Num
    var symbol: Str
    var currency: Str
    var minNotional: Num
    var maxNotional: Num
    var maintenanceMarginRate: Num
    var maxLeverage: Num
    var info: Dict[String, Any]


@value
struct LedgerEntry:
    var id: Str
    var info: Any
    var timestamp: Int
    var datetime: Str
    var direction: Str
    var account: Str
    var referenceId: Str
    var referenceAccount: Str
    var type: Str
    var currency: Str
    var amount: Num
    var before: Num
    var after: Num
    var status: Str
    var fee: Fee


@value
struct DepositAddress:
    var info: Any
    var currency: Str
    var network: Optional[Str]
    var address: Str
    var tag: Optional[Str]


@value
struct LongShortRatio:
    var info: Any
    var symbol: Str
    var timestamp: Optional[Int]
    var datetime: Optional[Str]
    var timeframe: Optional[Str]
    var longShortRatio: Float64


@value
struct BorrowInterest:
    var info: Any
    var symbol: Optional[Str]
    var currency: Optional[Str]
    var interest: Optional[Num]
    var interestRate: Optional[Num]
    var amountBorrowed: Optional[Num]
    var marginMode: Optional[Str]
    var timestamp: Optional[Int]
    var datetime: Optional[Str]


alias FundingRates = Dict[String, FundingRate]
alias LastPrices = Dict[String, LastPrice]
alias Currencies = Dict[String, CurrencyInterface]
alias TradingFees = Dict[String, TradingFeeInterface]
alias IsolatedBorrowRates = Dict[String, IsolatedBorrowRate]
alias CrossBorrowRates = Dict[String, CrossBorrowRate]
alias LeverageTiers = Dict[String, List[LeverageTier]]

alias Market = Optional[MarketInterface]
alias Currency = Optional[CurrencyInterface]


@value
struct ExchangeId(Intable, Stringable):
    """ExchangeId, the id of the exchange."""

    var _value: UInt8

    alias gateio = ExchangeId(0)
    alias binance = ExchangeId(1)
    alias kucoin = ExchangeId(2)
    alias bybit = ExchangeId(3)
    alias okx = ExchangeId(4)
    alias huobi = ExchangeId(5)
    alias bitmex = ExchangeId(6)
    alias deribit = ExchangeId(7)

    fn __eq__(self, other: ExchangeId) -> Bool:
        return self._value == other._value

    fn __init__(out self, value: UInt8):
        self._value = value

    fn __int__(self) -> Int:
        return int(self._value)

    fn __str__(self) -> String:
        if self == ExchangeId.gateio:
            return "gateio"
        elif self == ExchangeId.binance:
            return "binance"
        elif self == ExchangeId.kucoin:
            return "kucoin"
        elif self == ExchangeId.bybit:
            return "bybit"
        elif self == ExchangeId.okx:
            return "okx"
        elif self == ExchangeId.huobi:
            return "huobi"
        elif self == ExchangeId.bitmex:
            return "bitmex"
        elif self == ExchangeId.deribit:
            return "deribit"
        else:
            return "unknown"


@value
struct TradingContext(Stringable):
    """
    交易上下文.
    """

    var exchange_id: ExchangeId
    var account_id: String
    var trader_id: String

    fn __init__(
        out self, exchange_id: ExchangeId, account_id: String, trader_id: String
    ):
        self.exchange_id = exchange_id
        self.account_id = account_id
        self.trader_id = trader_id

    fn __str__(self) -> String:
        return (
            "TradingContext(exchange_id="
            + str(self.exchange_id)
            + ", account_id="
            + self.account_id
            + ", trader_id="
            + self.trader_id
            + ")"
        )


alias OnTicker = fn (trading_context: TradingContext, ticker: Ticker) -> None
alias OnTickers = fn (
    trading_context: TradingContext, tickers: List[Ticker]
) -> None
alias OnOrderBook = fn (
    trading_context: TradingContext, order_book: OrderBook
) -> None
alias OnTrade = fn (trading_context: TradingContext, trade: Trade) -> None
alias OnBalance = fn (trading_context: TradingContext, balance: Balance) -> None
alias OnOrder = fn (trading_context: TradingContext, order: Order) -> None
alias OnMyTrade = fn (trading_context: TradingContext, trade: Trade) -> None

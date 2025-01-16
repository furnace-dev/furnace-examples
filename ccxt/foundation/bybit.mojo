from memory import UnsafePointer
from monoio_connect import logi
from monoio_connect.httpclient import Headers
from monoio_connect import HttpClientOptions, HttpClient, Method
from ccxt.base.types import *
from ccxt.base.exchangeable import Exchangeable
from ccxt.abstract.bybit import ImplicitAPI


struct Bybit(Exchangeable):
    var default_type: String
    var _client: UnsafePointer[HttpClient]
    var _api: ImplicitAPI

    fn __init__(out self, config: Dict[String, Any]):
        var base_url = "https://api.bybit.com"
        # var proxy = str(config["proxy"]) if 'proxy' in config else String()
        var options = HttpClientOptions(base_url)
        # self.default_type = config["defaultType"][
        #     String
        # ] if "defaultType" in config else String("future")
        self.default_type = String("future")
        self._client = UnsafePointer[HttpClient].alloc(1)
        __get_address_as_uninit_lvalue(self._client.address) = HttpClient(
            options
        )
        self._api = ImplicitAPI()

    fn __del__(owned self):
        pass

    fn __moveinit__(out self, owned other: Self):
        self.default_type = other.default_type
        self._client = other._client
        # self.options = other.options
        self._api = other._api^

    fn id(self) -> ExchangeId:
        return ExchangeId.bybit

    @always_inline
    fn _request(self, entry: Entry) raises -> String:
        logi("entry: " + entry.path)
        var path = "/" + entry.path
        var method = Method.METHOD_GET
        var headers = Headers()
        var payload = String()
        var response = self._client[].request(path, method, headers, payload)
        return response.text

    # 公共方法
    fn load_markets(self, mut params: Dict[String, Any]) raises -> List[Market]:
        raise Error("NotImplemented")

    fn fetch_markets(
        self, mut params: Dict[String, Any]
    ) raises -> List[Market]:
        # {'category': 'linear'}
        # {'category': 'inverse'}
        var p = Dict[String, Any]()
        p["category"] = String("linear")
        return self.fetch_derivatives_markets(p)

    fn fetch_spot_markets(self, mut params: Dict[String, Any]) raises -> Market:
        raise Error("NotImplemented")

    fn fetch_derivatives_markets(
        self, mut params: Dict[String, Any]
    ) raises -> List[Market]:
        params["limit"] = 1000  # minimize number of requests
        var text = self._request(self._api.v5_market_instruments_info)
        var result = List[Market]()
        var doc = JsonObject(text)
        # 解析json
        result.append(None)
        return result

    fn fetch_currencies(
        self, mut params: Dict[String, Any]
    ) raises -> List[Currency]:
        raise Error("NotImplemented")

    fn fetch_ticker(self, symbol: String) raises -> Ticker:
        raise Error("NotImplemented")

    fn fetch_tickers(
        self, symbols: Strings, mut params: Dict[String, Any]
    ) raises -> List[Ticker]:
        raise Error("NotImplemented")

    fn fetch_order_book(
        self, symbol: String, limit: IntOpt, mut params: Dict[String, Any]
    ) raises -> OrderBook:
        raise Error("NotImplemented")

    # fn fetch_ohlcv(self, symbol: String, timeframe: String, since: Int, limit: Int) -> List[OHLCV]:
    #     ...

    # fn fetch_status(self) -> Status:
    #     ...

    fn fetch_trades(
        self,
        symbol: String,
        since: IntOpt,
        limit: IntOpt,
        mut params: Dict[String, Any],
    ) raises -> List[Trade]:
        raise Error("NotImplemented")

    # 私有方法
    fn fetch_balance(self, mut params: Dict[String, Any]) raises -> Balances:
        raise Error("NotImplemented")

    fn create_order(
        self,
        symbol: String,
        type: OrderType,
        side: OrderSide,
        amount: Fixed,
        price: Fixed,
        mut params: Dict[String, Any],
    ) raises -> Order:
        raise Error("NotImplemented")

    fn cancel_order(
        self, id: String, symbol: Str, mut params: Dict[String, Any]
    ) raises -> Order:
        raise Error("NotImplemented")

    fn fetch_order(
        self, id: String, symbol: Str, mut params: Dict[String, Any]
    ) raises -> Order:
        raise Error("NotImplemented")

    fn fetch_orders(
        self,
        symbol: Str,
        since: IntOpt,
        limit: IntOpt,
        mut params: Dict[String, Any],
    ) raises -> List[Order]:
        raise Error("NotImplemented")

    fn fetch_open_orders(
        self,
        symbol: Str,
        since: IntOpt,
        limit: IntOpt,
        mut params: Dict[String, Any],
    ) raises -> List[Order]:
        raise Error("NotImplemented")

    fn fetch_closed_orders(
        self,
        symbol: Str,
        since: IntOpt,
        limit: IntOpt,
        mut params: Dict[String, Any],
    ) raises -> List[Order]:
        raise Error("NotImplemented")

    fn fetch_my_trades(
        self,
        symbol: Str,
        since: IntOpt,
        limit: IntOpt,
        mut params: Dict[String, Any],
    ) raises -> List[Trade]:
        raise Error("NotImplemented")

    fn create_order_async(
        self,
        symbol: String,
        type: OrderType,
        side: OrderSide,
        amount: Fixed,
        price: Fixed,
        mut params: Dict[String, Any],
    ) raises -> None:
        pass

    fn cancel_order_async(
        self, id: String, symbol: String, mut params: Dict[String, Any]
    ) raises -> None:
        pass

    fn on_order(self, order: Order) -> None:
        pass

    fn keep_alive(self) -> None:
        pass

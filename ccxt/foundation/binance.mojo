import time
from collections.optional import _NoneType
from memory import stack_allocation
from monoio_connect import *
from ccxt.base.types import *
from ccxt.base.exchange import Exchange
from ccxt.base.exchangeable import (
    Exchangeable,
    SubmitOrderRequest,
    CancelOrderRequest,
)
from ccxt.abstract.binance import ImplicitAPI
from sonic import *
from ._common_utils import *


fn empty_on_order(trading_context: TradingContext, order: Order) -> None:
    pass


struct Binance(Exchangeable):
    var _default_type: String
    var _client: UnsafePointer[HttpClient]
    var _api: ImplicitAPI
    var _base: Exchange
    var _api_key: String
    var _api_secret: String
    var _on_order: OnOrder
    var _trading_context: TradingContext
    var _host: String
    var _testnet: Bool

    fn __init__(
        out self,
        config: Dict[String, Any],
        trading_context: TradingContext,
        rt: MonoioRuntimePtr = MonoioRuntimePtr(),
    ):
        # Reference: https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/general-info
        self._testnet = config.get("testnet", False).bool()
        var base_url = "https://fapi.binance.com" if not self._testnet else "https://testnet.binancefuture.com"
        # logd("base_url: " + str(base_url))
        self._host = String(base_url).replace("https://", "")
        self._default_type = String("future")
        self._client = UnsafePointer[HttpClient].alloc(1)
        var options = HttpClientOptions(base_url)
        __get_address_as_uninit_lvalue(self._client.address) = HttpClient(
            options, rt
        )
        self._api = ImplicitAPI()
        self._base = Exchange(config)
        self._api_key = str(config.get("api_key", String()))
        self._api_secret = str(config.get("api_secret", String()))
        self._on_order = empty_on_order
        self._trading_context = trading_context

    fn __del__(owned self):
        self._client.destroy_pointee()
        self._client.free()

    fn __moveinit__(out self, owned other: Self):
        self._host = other._host
        self._default_type = other._default_type
        self._client = other._client
        other._client = UnsafePointer[HttpClient]()
        self._api = other._api^
        self._base = other._base^
        self._api_key = other._api_key
        self._api_secret = other._api_secret
        self._on_order = other._on_order
        self._trading_context = other._trading_context
        self._testnet = other._testnet

    fn id(self) -> ExchangeId:
        return ExchangeId.binance

    fn set_on_order(mut self: Self, on_order: OnOrder) raises -> None:
        self._on_order = on_order

    @always_inline
    fn _request(
        self,
        entry: Entry,
        params: Dict[String, Any],
        query: String,
        payload: String,
        v: String = "v1",
    ) raises -> String:
        # logd("entry: " + entry.path)
        return self._request(
            entry.method, entry.path, params, query, payload, entry.api
        )

    @always_inline
    fn _request(
        self,
        method: Method,
        path: String,
        params: Dict[String, Any],
        query: String,
        payload: String,
        api: ApiType = ApiType.Public,
    ) raises -> String:
        # logd("entry: " + str(method) + " " + path)
        var full_path = path
        var headers = Headers()

        # headers["Accept"] = "application/json"
        # headers["Content-Type"] = "application/json"
        headers["host"] = self._host
        headers["user-agent"] = "monoio-http"
        headers["content-type"] = "application/json"
        headers["accept-encoding"] = "gzip, deflate"

        if api == ApiType.Private:
            var query_ = self._sign(headers, query)
            full_path += "?" + query_
        elif query != "":
            full_path += "?" + query

        logt("full_path: " + full_path)
        var response = self._client[].request(
            full_path, method, headers, payload
        )
        if response.status_code == 0:
            raise Error("HTTP status code: " + str(response.status_code))
        if response.status_code >= 200 and response.status_code < 300:
            return response.text
        elif response.status_code >= 400 and response.status_code < 500:
            logt("response.text: " + response.text)
            if response.text.startswith("{") and response.text.endswith("}"):
                var doc = JsonObject(response.text)
                var code = doc.get_i64("code")
                var message = doc.get_str("msg")
                # raise Error(label + ": " + message)
                return response.text
            else:
                # raise Error("HTTP status code: " + str(response.status_code))
                return response.text
        return response.text

    @always_inline
    fn _sign(self, mut headers: Headers, data: String) raises -> String:
        var ts_str = "recvWindow=5000&timestamp=" + str(now_ms())
        var payload = data + "&" + ts_str if data != "" else ts_str
        var signature = compute_hmac_sha256_hex(payload, self._api_secret)
        headers["X-MBX-APIKEY"] = self._api_key
        return payload + "&signature=" + signature

    fn load_markets(self, mut params: Dict[String, Any]) raises -> List[Market]:
        raise Error("NotImplemented")

    fn fetch_markets(
        self, mut params: Dict[String, Any]
    ) raises -> List[Market]:
        """Retrieves data on all markets for binance.

        https://developers.binance.com/docs/binance-spot-api-docs/rest-api#exchange-information                             # spot
        https://developers.binance.com/docs/derivatives/usds-margined-futures/market-data/rest-api/Exchange-Information     # swap
        https://developers.binance.com/docs/derivatives/coin-margined-futures/market-data/Exchange-Information              # future
        https://developers.binance.com/docs/derivatives/option/market-data/Exchange-Information                             # option
        https://developers.binance.com/docs/margin_trading/market-data/Get-All-Cross-Margin-Pairs                             # cross margin
        https://developers.binance.com/docs/margin_trading/market-data/Get-All-Isolated-Margin-Symbol                             # isolated margin

        :param dict [params]: extra parameters specific to the exchange API endpoint
        :returns dict[]: an array of objects representing market data.
        """
        return self.fapi_get_exchange_info(params)

    fn fapi_get_exchange_info(
        self, mut params: Dict[String, Any]
    ) raises -> List[Market]:
        var settleId = "usdt"
        params["settle"] = settleId
        var text = self._request(
            self._api.fapipublic_get_exchangeinfo, params, "", ""
        )
        logt("text: " + text)
        if len(text) == 0:
            return List[Market]()

        # save_text_to_file("data/binance_exchange_info.json", text)

        """
        {
            "timezone": "UTC",
            "serverTime": 1736413129786,
            "futuresType": "U_MARGINED",
            "rateLimits": [{
                    "rateLimitType": "REQUEST_WEIGHT",
                    "interval": "MINUTE",
                    "intervalNum": 1,
                    "limit": 6000
                }, {
                    "rateLimitType": "ORDERS",
                    "interval": "MINUTE",
                    "intervalNum": 1,
                    "limit": 1200
                }, {
                    "rateLimitType": "ORDERS",
                    "interval": "SECOND",
                    "intervalNum": 10,
                    "limit": 300
                }
            ],
            "exchangeFilters": [],
            "assets": [{
                    "asset": "USDT",
                    "marginAvailable": true,
                    "autoAssetExchange": "-100"
                }, {
                    "asset": "BTC",
                    "marginAvailable": true,
                    "autoAssetExchange": "-0.00100000"
                }, {
                    "asset": "BNB",
                    "marginAvailable": true,
                    "autoAssetExchange": "-0.00100000"
                }, {
                    "asset": "ETH",
                    "marginAvailable": true,
                    "autoAssetExchange": "-0.00100000"
                }, {
                    "asset": "USDC",
                    "marginAvailable": true,
                    "autoAssetExchange": "-0.10000000"
                }, {
                    "asset": "FDUSD",
                    "marginAvailable": true,
                    "autoAssetExchange": "0"
                }, {
                    "asset": "BNFCR",
                    "marginAvailable": true,
                    "autoAssetExchange": "-5000"
                }
            ],
            "symbols": [{
                    "symbol": "BTCUSDT",
                    "pair": "BTCUSDT",
                    "contractType": "PERPETUAL",
                    "deliveryDate": 4133404802000,
                    "onboardDate": 1569398400000,
                    "status": "TRADING",
                    "maintMarginPercent": "2.5000",
                    "requiredMarginPercent": "5.0000",
                    "baseAsset": "BTC",
                    "quoteAsset": "USDT",
                    "marginAsset": "USDT",
                    "pricePrecision": 2,
                    "quantityPrecision": 3,
                    "baseAssetPrecision": 8,
                    "quotePrecision": 8,
                    "underlyingType": "COIN",
                    "underlyingSubType": [],
                    "triggerProtect": "0.0500",
                    "liquidationFee": "0.020000",
                    "marketTakeBound": "0.30",
                    "maxMoveOrderLimit": 1000,
                    "filters": [{
                            "maxPrice": "809484",
                            "minPrice": "261.10",
                            "filterType": "PRICE_FILTER",
                            "tickSize": "0.10"
                        }, {
                            "maxQty": "1000",
                            "minQty": "0.001",
                            "filterType": "LOT_SIZE",
                            "stepSize": "0.001"
                        }, {
                            "filterType": "MARKET_LOT_SIZE",
                            "minQty": "0.001",
                            "maxQty": "1000",
                            "stepSize": "0.001"
                        }, {
                            "filterType": "MAX_NUM_ORDERS",
                            "limit": 200
                        }, {
                            "limit": 10,
                            "filterType": "MAX_NUM_ALGO_ORDERS"
                        }, {
                            "filterType": "MIN_NOTIONAL",
                            "notional": "100"
                        }, {
                            "multiplierDown": "0.5000",
                            "multiplierUp": "1.5000",
                            "filterType": "PERCENT_PRICE",
                            "multiplierDecimal": "4"
                        }
                    ],
                    "orderTypes": ["LIMIT", "MARKET", "STOP", "STOP_MARKET", "TAKE_PROFIT", "TAKE_PROFIT_MARKET", "TRAILING_STOP_MARKET"],
                    "timeInForce": ["GTC", "IOC", "FOK", "GTX", "GTD"]
                }
            ]
        }
        """

        var doc = JsonObject(text)
        var symbols = doc.get_array_mut("symbols")
        var n = symbols.len()
        var result = List[Market](capacity=n)
        for i in range(n):
            var symbol_info = symbols.get(i)
            var symbol_view = JsonValueRefObjectView(symbol_info)
            var market = self.parse_exchange_info(symbol_view, settleId)
            result.append(market)
            _ = symbol_info^
        _ = symbols^
        _ = doc^
        return result

    fn parse_exchange_info(
        self, symbol_view: JsonValueRefObjectView, settleId: String
    ) raises -> MarketInterface:
        """
        {
            "symbol": "BTCUSDT",
            "pair": "BTCUSDT",
            "contractType": "PERPETUAL",
            "deliveryDate": 4133404802000,
            "onboardDate": 1569398400000,
            "status": "TRADING",
            "maintMarginPercent": "2.5000",
            "requiredMarginPercent": "5.0000",
            "baseAsset": "BTC",
            "quoteAsset": "USDT",
            "marginAsset": "USDT",
            "pricePrecision": 2,
            "quantityPrecision": 3,
            "baseAssetPrecision": 8,
            "quotePrecision": 8,
            "underlyingType": "COIN",
            "underlyingSubType": [],
            "triggerProtect": "0.0500",
            "liquidationFee": "0.020000",
            "marketTakeBound": "0.30",
            "maxMoveOrderLimit": 1000,
            "filters": [{
                    "maxPrice": "809484",
                    "minPrice": "261.10",
                    "filterType": "PRICE_FILTER",
                    "tickSize": "0.10"
                }, {
                    "maxQty": "1000",
                    "minQty": "0.001",
                    "filterType": "LOT_SIZE",
                    "stepSize": "0.001"
                }, {
                    "filterType": "MARKET_LOT_SIZE",
                    "minQty": "0.001",
                    "maxQty": "1000",
                    "stepSize": "0.001"
                }, {
                    "filterType": "MAX_NUM_ORDERS",
                    "limit": 200
                }, {
                    "limit": 10,
                    "filterType": "MAX_NUM_ALGO_ORDERS"
                }, {
                    "filterType": "MIN_NOTIONAL",
                    "notional": "100"
                }, {
                    "multiplierDown": "0.5000",
                    "multiplierUp": "1.5000",
                    "filterType": "PERCENT_PRICE",
                    "multiplierDecimal": "4"
                }
            ],
            "orderTypes": ["LIMIT", "MARKET", "STOP", "STOP_MARKET", "TAKE_PROFIT", "TAKE_PROFIT_MARKET", "TRAILING_STOP_MARKET"],
            "timeInForce": ["GTC", "IOC", "FOK", "GTX", "GTD"]
        }
        """
        var symbol = symbol_view.get_str("symbol")
        var contractType = symbol_view.get_str("contractType")
        var id = symbol
        var base = symbol_view.get_str("baseAsset")
        var quote = symbol_view.get_str("quoteAsset")
        var settle = symbol_view.get_str("marginAsset")
        var baseId = base
        var quoteId = quote
        var is_linear = quote == settle
        var taker = Fixed(0)
        var maker = Fixed(0)
        var expiry = 0
        var price_precision = symbol_view.get_i64("pricePrecision")
        var quantity_precision = symbol_view.get_i64("quantityPrecision")

        return MarketInterface(
            info=Dict[String, Any](),
            id=id,
            symbol=symbol,
            base=base,
            quote=quote,
            settle=settle,
            baseId=baseId,
            quoteId=quoteId,
            settleId=settleId,
            type=contractType,
            subType=String(""),  # ?
            spot=False,
            margin=False,
            marginModes=MarketMarginModes(cross=False, isolated=False),
            swap=contractType == "PERPETUAL",
            future=contractType == "CONTRACT",
            option=contractType == "OPTION",
            active=True,
            contract=True,
            linear=is_linear,
            inverse=not is_linear,
            taker=taker,
            # onehundred,  # Fee is in %, so divide by 100
            maker=maker,
            percentage=False,
            tierBased=False,
            feeSide=String("maker"),
            contractSize=Fixed(quantity_precision),
            expiry=expiry,
            expiryDatetime=self._base.iso8601(expiry),
            strike=_NoneType(),
            optionType=None,
            precision=int(price_precision),
            limits=MarketLimits(
                market=MinMax(
                    min=_NoneType(),
                    max=_NoneType(),
                ),
                leverage=MinMax(
                    min=float(0),
                    max=float(0),
                ),
                amount=MinMax(
                    min=int(0),
                    max=int(0),
                ),
                price=MinMax(
                    min=_NoneType(),
                    max=_NoneType(),
                ),
                cost=MinMax(
                    min=_NoneType(),
                    max=_NoneType(),
                ),
            ),
            created=0,
        )

    fn fetch_currencies(
        self, mut params: Dict[String, Any]
    ) raises -> List[Currency]:
        """Fetches all available currencies on an exchange.

        https://developers.binance.com/docs/wallet/capital/all-coins-info
        https://developers.binance.com/docs/margin_trading/market-data/Get-All-Margin-Assets

        :param dict [params]: extra parameters specific to the exchange API endpoint
        :returns dict: an associative dictionary of currencies.
        """
        return List[Currency]()

    fn fetch_ticker(self, symbol: String) raises -> Ticker:
        var text: String
        var params = Dict[String, Any]()
        var query = "symbol=" + symbol
        text = self._request(
            self._api.fapipublic_get_ticker_24hr, params, query, ""
        )
        logt(text)
        # {"code":-1121,"msg":"Invalid symbol."}
        # {"symbol":"BTCUSDT","priceChange":"-454.50","priceChangePercent":"-0.472","weightedAvgPrice":"95569.51","lastPrice":"95771.60","lastQty":"0.012","openPrice":"96226.10","highPrice":"97241.30","lowPrice":"92000.00","volume":"5315.893","quoteVolume":"508037300.13","openTime":1736496420000,"closeTime":1736582843623,"firstId":294643039,"lastId":294680807,"count":37500}

        var doc = JsonObject(text)
        var code = doc.get_i64("code")
        if code != 0:
            var msg = doc.get_str("msg")
            raise Error(msg)
        var obj_view = JsonValueObjectView(doc)
        var ticker = self.parse_ticker(obj_view)
        _ = doc^
        ticker.timestamp = int(now_ms())
        return ticker

    fn parse_ticker(self, doc: JsonValueObjectView) raises -> Ticker:
        """Parse a ticker from a JSON response.

        :param dict [doc]: associative dictionary of the JSON response
        :returns dict: a dictionary of ticker info.
        """

        """
        {
            "symbol": "BTCUSDT",
            "priceChange": "-454.50",
            "priceChangePercent": "-0.472",
            "weightedAvgPrice": "95569.51",
            "lastPrice": "95771.60",
            "lastQty": "0.012",
            "openPrice": "96226.10",
            "highPrice": "97241.30",
            "lowPrice": "92000.00",
            "volume": "5315.893",
            "quoteVolume": "508037300.13",
            "openTime": 1736496420000,
            "closeTime": 1736582843623,
            "firstId": 294643039,
            "lastId": 294680807,
            "count": 37500
        }
        """
        var timestamp = doc.get_i64("closeTime")
        # var marketType = "swap"
        var marketId = doc.get_str("symbol")
        var symbol = marketId
        var last = doc.get_str("lastPrice")
        # var wAvg = doc.get_str('weightedAvgPrice')
        var baseVolume = doc.get_str("volume")
        var quoteVolume = doc.get_str("quoteVolume")
        var high = doc.get_str("highPrice")
        var low = doc.get_str("lowPrice")
        var percentage = doc.get_str("priceChangePercent")
        return Ticker(
            info=Dict[String, Any](),
            symbol=symbol,
            timestamp=int(timestamp),
            datetime=String(""),
            high=Fixed(high),
            low=Fixed(low),
            bid=Fixed(0),
            bidVolume=Fixed(0),
            ask=Fixed(0),
            askVolume=Fixed(0),
            vwap=Fixed.zero,
            open=Fixed.zero,
            close=Fixed(last),
            last=Fixed(last),
            previousClose=Fixed.zero,
            change=Fixed.zero,
            percentage=Fixed(percentage),
            average=Fixed.zero,
            baseVolume=Fixed(baseVolume),
            quoteVolume=Fixed(quoteVolume),
            markPrice=Fixed(0),
            indexPrice=Fixed(0),
        )

    fn parse_ticker(self, doc: JsonValueRefObjectView) raises -> Ticker:
        """Parse a ticker from a JSON response.

        :param dict [doc]: associative dictionary of the JSON response
        :returns dict: a dictionary of ticker info.
        """

        """
        {
            "symbol": "BTCUSDT",
            "priceChange": "-454.50",
            "priceChangePercent": "-0.472",
            "weightedAvgPrice": "95569.51",
            "lastPrice": "95771.60",
            "lastQty": "0.012",
            "openPrice": "96226.10",
            "highPrice": "97241.30",
            "lowPrice": "92000.00",
            "volume": "5315.893",
            "quoteVolume": "508037300.13",
            "openTime": 1736496420000,
            "closeTime": 1736582843623,
            "firstId": 294643039,
            "lastId": 294680807,
            "count": 37500
        }
        """
        var timestamp = doc.get_i64("closeTime")
        # var marketType = "swap"
        var marketId = doc.get_str("symbol")
        var symbol = marketId
        var last = doc.get_str("lastPrice")
        # var wAvg = doc.get_str('weightedAvgPrice')
        var baseVolume = doc.get_str("volume")
        var quoteVolume = doc.get_str("quoteVolume")
        var high = doc.get_str("highPrice")
        var low = doc.get_str("lowPrice")
        var percentage = doc.get_str("priceChangePercent")
        return Ticker(
            info=Dict[String, Any](),
            symbol=symbol,
            timestamp=int(timestamp),
            datetime=String(""),
            high=Fixed(high),
            low=Fixed(low),
            bid=Fixed(0),
            bidVolume=Fixed(0),
            ask=Fixed(0),
            askVolume=Fixed(0),
            vwap=Fixed.zero,
            open=Fixed.zero,
            close=Fixed(last),
            last=Fixed(last),
            previousClose=Fixed.zero,
            change=Fixed.zero,
            percentage=Fixed(percentage),
            average=Fixed.zero,
            baseVolume=Fixed(baseVolume),
            quoteVolume=Fixed(quoteVolume),
            markPrice=Fixed(0),
            indexPrice=Fixed(0),
        )

    fn fetch_tickers(
        self, symbols: Strings, mut params: Dict[String, Any]
    ) raises -> List[Ticker]:
        """Fetches price tickers for multiple markets, statistical information calculated over the past 24 hours for each market.

        https://developers.binance.com/docs/binance-spot-api-docs/rest-api#24hr-ticker-price-change-statistics                          # spot
        https://developers.binance.com/docs/derivatives/usds-margined-futures/market-data/rest-api/24hr-Ticker-Price-Change-Statistics  # swap
        https://developers.binance.com/docs/derivatives/coin-margined-futures/market-data/24hr-Ticker-Price-Change-Statistics           # future
        https://developers.binance.com/docs/derivatives/option/market-data/24hr-Ticker-Price-Change-Statistics                          # option

        :param str[] [symbols]: unified symbols of the markets to fetch the ticker for, all market tickers are returned if not assigned
        :param dict [params]: extra parameters specific to the exchange API endpoint
        :param str [params.subType]: "linear" or "inverse"
        :param str [params.type]: 'spot', 'option', use params["subType"] for swap and future markets
        :returns dict: a dictionary of `ticker structures <https://docs.ccxt.com/#/?id=ticker-structure>`.
        """
        var text = self._request(
            self._api.fapipublic_get_ticker_24hr, params, "", ""
        )
        logt(text)
        # save_text_to_file("data/binance_tickers.json", text)
        var doc = JsonObject(text)
        var arr = JsonValueArrayView(doc)
        var n = arr.len()
        var result = List[Ticker](capacity=n)
        var timestamp = int(now_ms())
        for i in range(0, n):
            var obj = arr.get(i)
            var obj_view = JsonValueRefObjectView(obj)
            var ticker = self.parse_ticker(obj_view)
            if symbols:
                if ticker.symbol.value() in symbols.value():
                    ticker.timestamp = timestamp
                    result.append(ticker)
            else:
                print("2")
                result.append(ticker)
            _ = obj^
            pass
        _ = arr^
        _ = doc^
        return result

    fn fetch_order_book(
        self,
        symbol: String,
        limit: IntOpt,
        mut params: Dict[String, Any],
    ) raises -> OrderBook:
        """Fetches information on open orders with bid(buy) and ask(sell) prices, volumes and other data.

        https://developers.binance.com/docs/binance-spot-api-docs/rest-api#order-book                           # spot
        https://developers.binance.com/docs/derivatives/usds-margined-futures/market-data/rest-api/Order-Book   # swap
        https://developers.binance.com/docs/derivatives/coin-margined-futures/market-data/Order-Book            # future
        https://developers.binance.com/docs/derivatives/option/market-data/Order-Book                           # option

        :param str symbol: unified symbol of the market to fetch the order book for
        :param int [limit]: the maximum amount of order book entries to return
        :param dict [params]: extra parameters specific to the exchange API endpoint
        :returns dict: A dictionary of `order book structures <https://docs.ccxt.com/#/?id=order-book-structure>` indexed by market symbols.
        """
        var query = Dict[String, Any]()
        query["symbol"] = symbol
        if limit is not None:
            query["limit"] = limit.value()
        var query_str = self._base.url_encode(query)
        logt("query_str: " + query_str)
        var text = self._request(
            self._api.fapipublic_get_depth, params, query_str, ""
        )

        logt(text)

        # {"lastUpdateId":37528941958,"E":1736586508705,"T":1736586508697,"bids":[["96053.50","0.020"],["95900.10","0.005"],["95890.10","0.100"],["95708.00","0.005"],["95707.30","0.083"],["95646.10","0.013"],["95550.00","0.010"],["95535.50","0.100"],["95488.00","0.010"],["95480.00","0.260"]],"asks":[["96174.30","0.180"],["96174.40","2.938"],["96174.50","2.346"],["96174.60","18.000"],["96174.70","1.572"],["96174.90","3.976"],["96175.00","5.609"],["96178.10","1.900"],["96178.30","7.288"],["96178.40","18.000"]]}

        """
        {
            "lastUpdateId": 1027024,
            "E": 1589436922972,   // Message output time
            "T": 1589436922959,   // Transaction time
            "bids": [
                [
                "4.00000000",     // PRICE
                "431.00000000"    // QTY
                ]
            ],
            "asks": [
                [
                "4.00000200",
                "12.00000000"
                ]
            ]
        }
        """

        # {"code":-1102,"msg":"Mandatory parameter 'symbol' was not sent, was empty/null, or malformed."}

        var doc = JsonObject(text)

        var code = doc.get_i64("code")
        if code != 0:
            var msg = str(doc.get_str_ref("msg"))
            raise Error(msg)

        var result = OrderBook()
        var timestamp = int(doc.get_i64("E"))
        var id = int(doc.get_i64("lastUpdateId"))
        result.timestamp = timestamp
        result.symbol = symbol
        result.nonce = id
        var ask_arr = doc.get_array_mut("asks")
        for i in range(0, ask_arr.len()):
            var ask = ask_arr.get(i)
            var ask_view = JsonValueRefArrayView(ask)
            var p = ask_view.get_str(0, "0")
            var s = ask_view.get_str(1, "0")
            var price = Fixed(p)
            var amount = Fixed(s)
            result.asks.append(OrderbookEntry(price, amount))
        var bid_arr = doc.get_array_mut("bids")
        for i in range(0, bid_arr.len()):
            var bid = bid_arr.get(i)
            var bid_view = JsonValueRefArrayView(bid)
            var p = bid_view.get_str(0, "0")
            var s = bid_view.get_str(1, "0")
            var price = Fixed(p)
            var amount = Fixed(s)
            result.bids.append(OrderbookEntry(price, amount))
        _ = doc^
        return result

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

    fn fetch_balance(self, mut params: Dict[String, Any]) raises -> Balances:
        """Query for balance and get the amount of funds available for trading or funds locked in orders.

        https://developers.binance.com/docs/binance-spot-api-docs/rest-api#account-information-user_data                    # spot
        https://developers.binance.com/docs/margin_trading/account/Query-Cross-Margin-Account-Details                       # cross margin
        https://developers.binance.com/docs/margin_trading/account/Query-Isolated-Margin-Account-Info                       # isolated margin
        https://developers.binance.com/docs/wallet/asset/funding-wallet                                                     # funding
        https://developers.binance.com/docs/derivatives/usds-margined-futures/account/rest-api/Futures-Account-Balance-V2   # swap
        https://developers.binance.com/docs/derivatives/usds-margined-futures/account/rest-api/Futures-Account-Balance-V3   # swap
        https://developers.binance.com/docs/derivatives/coin-margined-futures/account/Futures-Account-Balance               # future
        https://developers.binance.com/docs/derivatives/option/account/Option-Account-Information                           # option
        https://developers.binance.com/docs/derivatives/portfolio-margin/account/Account-Balance                            # portfolio margin

        :param dict [params]: extra parameters specific to the exchange API endpoint
        :param str [params.type]: 'future', 'delivery', 'savings', 'funding', or 'spot' or 'papi'
        :param str [params.marginMode]: 'cross' or 'isolated', for margin trading, uses self.options.defaultMarginMode if not passed, defaults to None/None/None
        :param str[]|None [params.symbols]: unified market symbols, only used in isolated margin mode
        :param boolean [params.portfolioMargin]: set to True if you would like to fetch the balance for a portfolio margin account
        :param str [params.subType]: 'linear' or 'inverse'
        :returns dict: a `balance structure <https://docs.ccxt.com/#/?id=balance-structure>`.
        """
        var text = self._request(
            self._api.fapiprivatev3_get_account, params, "", "", "v3"
        )
        logt(text)
        # {"code":-5000,"msg":"Path /fapi/v1/account, Method GET is invalid"}
        # {"code":-1021,"msg":"Timestamp for this request was 1000ms ahead of the server's time."}
        # {"code":-2015,"msg":"Invalid API-key, IP, or permissions for action"}
        # {"totalInitialMargin":"0.00000000","totalMaintMargin":"0.00000000","totalWalletBalance":"15000.00000000","totalUnrealizedProfit":"0.00000000","totalMarginBalance":"15000.00000000","totalPositionInitialMargin":"0.00000000","totalOpenOrderInitialMargin":"0.00000000","totalCrossWalletBalance":"15000.00000000","totalCrossUnPnl":"0.00000000","availableBalance":"15000.00000000","maxWithdrawAmount":"15000.00000000","assets":[{"asset":"FDUSD","walletBalance":"0.00000000","unrealizedProfit":"0.00000000","marginBalance":"0.00000000","maintMargin":"0.00000000","initialMargin":"0.00000000","positionInitialMargin":"0.00000000","openOrderInitialMargin":"0.00000000","crossWalletBalance":"0.00000000","crossUnPnl":"0.00000000","availableBalance":"0.00000000","maxWithdrawAmount":"0.00000000","updateTime":0},{"asset":"BNB","walletBalance":"0.00000000","unrealizedProfit":"0.00000000","marginBalance":"0.00000000","maintMargin":"0.00000000","initialMargin":"0.00000000","positionInitialMargin":"0.00000000","openOrderInitialMargin":"0.00000000","crossWalletBalance":"0.00000000","crossUnPnl":"0.00000000","availableBalance":"0.00000000","maxWithdrawAmount":"0.00000000","updateTime":0},{"asset":"ETH","walletBalance":"0.00000000","unrealizedProfit":"0.00000000","marginBalance":"0.00000000","maintMargin":"0.00000000","initialMargin":"0.00000000","positionInitialMargin":"0.00000000","openOrderInitialMargin":"0.00000000","crossWalletBalance":"0.00000000","crossUnPnl":"0.00000000","availableBalance":"0.00000000","maxWithdrawAmount":"0.00000000","updateTime":0},{"asset":"BTC","walletBalance":"0.00000000","unrealizedProfit":"0.00000000","marginBalance":"0.00000000","maintMargin":"0.00000000","initialMargin":"0.00000000","positionInitialMargin":"0.00000000","openOrderInitialMargin":"0.00000000","crossWalletBalance":"0.00000000","crossUnPnl":"0.00000000","availableBalance":"0.00000000","maxWithdrawAmount":"0.00000000","updateTime":0},{"asset":"USDT","walletBalance":"15000.00000000","unrealizedProfit":"0.00000000","marginBalance":"15000.00000000","maintMargin":"0.00000000","initialMargin":"0.00000000","positionInitialMargin":"0.00000000","openOrderInitialMargin":"0.00000000","crossWalletBalance":"15000.00000000","crossUnPnl":"0.00000000","availableBalance":"15000.00000000","maxWithdrawAmount":"15000.00000000","updateTime":1736591270429},{"asset":"USDC","walletBalance":"0.00000000","unrealizedProfit":"0.00000000","marginBalance":"0.00000000","maintMargin":"0.00000000","initialMargin":"0.00000000","positionInitialMargin":"0.00000000","openOrderInitialMargin":"0.00000000","crossWalletBalance":"0.00000000","crossUnPnl":"0.00000000","availableBalance":"0.00000000","maxWithdrawAmount":"0.00000000","updateTime":0}],"positions":[]}
        var doc = JsonObject(text)
        var code = doc.get_i64("code")
        if code != 0:
            var msg = str(doc.get_str_ref("msg"))
            raise Error(msg)

        var result = Balances()
        result.timestamp = int(doc.get_i64("updateTime"))
        var assets = doc.get_array_mut("assets")
        for i in range(0, assets.len()):
            var asset = assets.get(i)
            var asset_view = JsonValueRefObjectView(asset)
            var asset_name = asset_view.get_str("asset")
            var walletBalance = Fixed(asset_view.get_str("walletBalance"))
            var unrealizedProfit = Fixed(asset_view.get_str("unrealizedProfit"))
            var marginBalance = Fixed(asset_view.get_str("marginBalance"))
            result.data[asset_name] = Balance(
                free=walletBalance,
                used=unrealizedProfit,
                total=marginBalance,
            )
            _ = asset^
        _ = assets^
        _ = doc^
        return result

    fn create_order(
        self,
        symbol: String,
        type: OrderType,
        side: OrderSide,
        amount: Fixed,
        price: Fixed,
        mut params: Dict[String, Any],
    ) raises -> Order:
        """Create a trade order.
        :param str symbol: unified symbol of the market to create an order in
        :param str type: 'market' or 'limit'
        :param str side: 'buy' or 'sell'
        :param float amount: how much of currency you want to trade in units of base currency
        :param float price: the price at which the order is to be fullfilled, in units of the quote currency, ignored in market orders
        :param dict [params]: extra parameters specific to the binance api endpoint
        :param str [params.time_in_force]: 'GTC', 'IOC', 'FOK', or 'GTX'
        :param bool [params.reduce_only]: True or False, default False
        :returns Order

        有效方式 (timeInForce):

        GTC - Good Till Cancel 成交为止（下单后仅有1年有效期，1年后自动取消）
        IOC - Immediate or Cancel 无法立即成交(吃单)的部分就撤销
        FOK - Fill or Kill 无法全部立即成交就撤销
        GTX - Good Till Crossing 无法成为挂单方就撤销
        GTD - Good Till Date 在特定时间之前有效，到期自动撤销.
        """
        var query_values = QueryStringBuilder()
        query_values["symbol"] = symbol
        query_values["side"] = (
            "BUY" if side == OrderSide.Buy else "SELL"
        )  # SELL, BUY
        # 订单类型 LIMIT, MARKET, STOP, TAKE_PROFIT, STOP_MARKET, TAKE_PROFIT_MARKET, TRAILING_STOP_MARKET
        query_values["type"] = "LIMIT" if type == OrderType.Limit else "MARKET"
        # positionSide: 持仓方向，单向持仓模式下非必填，默认且仅可填BOTH;在双向持仓模式下必填,且仅可选择 LONG 或 SHORT
        if "position_side" in params:
            query_values["positionSide"] = params["position_side"].string()
        if not amount.is_zero():
            query_values["quantity"] = amount.to_string()
        if not price.is_zero():
            query_values["price"] = price.to_string()
        if "time_in_force" in params:
            query_values["timeInForce"] = params["time_in_force"].string()
        else:
            query_values["timeInForce"] = "GTC"
        if "reduce_only" in params and params["reduce_only"].bool():
            query_values["reduceOnly"] = "true"
        var query_str = query_values.to_string()
        logt("query_str: " + query_str)

        var params_ = Dict[String, Any]()
        var payload = String("")
        var text = self._request(
            self._api.fapiprivate_post_order,
            params_,
            query=query_str,
            payload=payload,
        )
        # logt(text)
        # {"code":-1102,"msg":"Mandatory parameter 'timeinforce' was not sent, was empty/null, or malformed."}
        var doc = JsonObject(text)
        var result = self.parse_order(doc)
        # logt("result: " + str(result))
        result.side = side
        return result

    fn cancel_order(
        self, id: String, symbol: Str, mut params: Dict[String, Any]
    ) raises -> Order:
        var query_values = QueryStringBuilder()
        query_values["symbol"] = symbol.value()
        query_values["orderId"] = id
        var query_str = query_values.to_string()
        logt("query_str: " + query_str)

        var params_ = Dict[String, Any]()
        var payload = String("")
        var text = self._request(
            self._api.fapiprivate_delete_order,
            params_,
            query=query_str,
            payload=payload,
        )
        logt(text)
        # {"code":-2011,"msg":"Unknown order sent."}
        # {"orderId":4077634200,"symbol":"BTCUSDT","status":"CANCELED","clientOrderId":"pRxDtGFyxElEV3emIYz1tb","price":"93000.00","avgPrice":"0.00","origQty":"1.000","executedQty":"0.000","cumQty":"0.000","cumQuote":"0.00000","timeInForce":"GTC","type":"LIMIT","reduceOnly":false,"closePosition":false,"side":"BUY","positionSide":"BOTH","stopPrice":"0.00","workingType":"CONTRACT_PRICE","priceProtect":false,"origType":"LIMIT","priceMatch":"NONE","selfTradePreventionMode":"NONE","goodTillDate":0,"updateTime":1736898322718}
        var doc = JsonObject(text)
        var result = self.parse_order(doc)
        return result

    @staticmethod
    fn parse_order(doc: JsonObject) raises -> Order:
        # {"code":-1102,"msg":"Mandatory parameter 'timeinforce' was not sent, was empty/null, or malformed."}
        var code = doc.get_i64("code")
        if code != 0:
            var msg = doc.get_str("msg")
            raise Error(String.format("code: {0}, msg: {1}", code, msg))

        # {"orderId":4077634200,"symbol":"BTCUSDT","status":"NEW","clientOrderId":"pRxDtGFyxElEV3emIYz1tb","price":"93000.00","avgPrice":"0.00","origQty":"1.000","executedQty":"0.000","cumQty":"0.000","cumQuote":"0.00000","timeInForce":"GTC","type":"LIMIT","reduceOnly":false,"closePosition":false,"side":"BUY","positionSide":"BOTH","stopPrice":"0.00","workingType":"CONTRACT_PRICE","priceProtect":false,"origType":"LIMIT","priceMatch":"NONE","selfTradePreventionMode":"NONE","goodTillDate":0,"updateTime":1736869853102}

        var symbol_ = str(doc.get_str_ref("symbol"))
        var id = doc.get_u64("orderId")
        var clientOrderId = str(doc.get_str_ref("clientOrderId"))
        var status = str(doc.get_str_ref("status"))
        var type_ = str(doc.get_str_ref("type"))
        var amount_ = Fixed(str(doc.get_str_ref("origQty")))
        var filled_amount = Fixed(str(doc.get_str_ref("executedQty")))
        var left = amount_ - filled_amount

        var price_ = Fixed(str(doc.get_str_ref("price")))
        # var avg_price = Fixed(0)
        var timestamp = int(doc.get_i64("updateTime"))
        var update_timestamp = timestamp
        var time_in_force = doc.get_str("time_in_force")
        var result = Order(
            info=Dict[String, Any](),
            id=str(id),
            clientOrderId=clientOrderId,
            datetime="",
            timestamp=timestamp,
            lastTradeTimestamp=update_timestamp,
            lastUpdateTimestamp=update_timestamp,
            status=status,
            symbol=symbol_,
            type=type_,
            timeInForce=time_in_force,
            side=OrderSide.Buy,  # todo: side
            price=price_,
            average=Fixed(0),
            amount=amount_,
            filled=filled_amount,
            remaining=left,
            stopPrice=Fixed(0),
            takeProfitPrice=Fixed(0),
            stopLossPrice=Fixed(0),
            cost=Fixed(0),
            trades=List[Trade](),
            reduceOnly=False,
            postOnly=False,
            fee=None,
        )
        return result

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
        var request = AsyncTradingRequest(
            type=0,
            data=SubmitOrderData(
                symbol=symbol,
                order_type=type,
                order_side=side,
                amount=amount,
                price=price,
            ),
            exchange=UnsafePointer.address_of(self),
        )
        _ = async_trading_channel_ptr()[].send(request)

    fn cancel_order_async(
        self, id: String, symbol: String, mut params: Dict[String, Any]
    ) raises -> None:
        var request = AsyncTradingRequest(
            type=1,
            data=SubmitCancelOrderData(symbol=symbol, order_id=id),
            exchange=UnsafePointer.address_of(self),
        )
        _ = async_trading_channel_ptr()[].send(request)

    fn on_order(self, order: Order) -> None:
        self._on_order(self._trading_context, order)

    fn keep_alive(self) -> None:
        pass

from collections.optional import _NoneType
from monoio_connect import logd, logi, Method
from monoio_connect.httpclient import Headers
from monoio_connect.fixed import Fixed
from ccxt.base.types import *
from ccxt.base.exchange import Exchange
from ccxt.base.exchangeable import (
    Exchangeable,
    SubmitOrderRequest,
    CancelOrderRequest,
)
from ccxt.abstract.bitmex import ImplicitAPI
from monoio_connect import now_ms
from sonic import *
from monoio_connect import compute_sha512_hex, compute_hmac_sha512_hex
from monoio_connect import HttpClientOptions, HttpClient, HttpResponsePtr
from monoio_connect import (
    MonoioRuntimePtr,
    http_response_status_code,
    http_response_body,
)


# 不可以用香港IP访问,否则可能返回:
# """
# <html>
# <head><title>301 Moved Permanently</title></head>
# <body>
# <center><h1>301 Moved Permanently</h1></center>
# <hr><center>cloudflare</center>
# </body>
# </html>
# """

# https://www.digitalocean.com/community/tools/dns?domain=testnet.bitmex.com
# A Records
# A records are the most basic type of DNS record and are used to point a domain or subdomain to an IPv4 address. These do NOT act as MX records, to receive e-mail, you need to set a MX record. Learn more

# Name	TTL 	Data
# testnet.bitmex.com.cdn.cloudflare.net
# 300
# 104.18.32.236
# Loading WHOIS data...

# testnet.bitmex.com.cdn.cloudflare.net
# 300
# 172.64.155.20
# Loading WHOIS data...

# testnet.bitmex.com
# 60
# testnet.bitmex.com.cdn.cloudflare.net. (172.64.155.20)
# Loading WHOIS data...

# https://testnet.bitmex.com/api/v1/instrument/active

# curl -v --tlsv1.2 --tls-max 1.2 https://www.bitmex.com/api/v1/instrument/active

# openssl s_client -connect testnet.bitmex.com:443 -tls1_1 (失败)
# openssl s_client -connect testnet.bitmex.com:443 -tls1_2 (成功)

# tls-stream.cpp:363|deal_error:SSL error: error:14094410:SSL routines:ssl3_read_bytes:sslv3 alert handshake failure

# 需要使用tls1_2


fn empty_on_order(trading_context: TradingContext, order: Order) -> None:
    pass


struct BitMEX(Exchangeable):
    var _default_type: String
    var _client: UnsafePointer[HttpClient]
    var _api: ImplicitAPI
    var _base: Exchange
    var _api_key: String
    var _api_secret: String
    var _on_order: OnOrder
    var _trading_context: TradingContext

    fn __init__(
        out self, config: Dict[String, Any], trading_context: TradingContext
    ):
        logd("BitMEX init")
        var testnet = config.get("testnet", False).bool()
        logd("testnet: " + str(testnet))
        var base_url = "https://www.bitmex.com" if not testnet else "https://testnet.bitmex.com"
        logd("base_url: " + str(base_url))
        var options = HttpClientOptions(base_url)
        self._default_type = String("future")
        self._client = UnsafePointer[HttpClient].alloc(1)
        __get_address_as_uninit_lvalue(self._client.address) = HttpClient(
            options
        )
        self._api = ImplicitAPI()
        self._base = Exchange(config)
        self._api_key = str(config.get("api_key", String()))
        self._api_secret = str(config.get("api_secret", String()))
        self._on_order = empty_on_order
        self._trading_context = trading_context
        logd("BitMEX init end")

    fn __del__(owned self):
        self._client.destroy_pointee()
        self._client.free()

    fn __moveinit__(out self, owned other: Self):
        self._default_type = other._default_type
        self._client = other._client
        other._client = UnsafePointer[HttpClient]()
        self._api = other._api^
        self._base = other._base^
        self._api_key = other._api_key
        self._api_secret = other._api_secret
        self._on_order = other._on_order
        self._trading_context = other._trading_context

    fn id(self) -> ExchangeId:
        return ExchangeId.bitmex

    fn set_on_order(mut self: Self, on_order: OnOrder) raises -> None:
        self._on_order = on_order

    @always_inline
    fn _request(
        self,
        entry: Entry,
        params: Dict[String, Any],
        query: String = "",
        payload: String = "",
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
        query: String = "",
        payload: String = "",
        api: ApiType = ApiType.Public,
    ) raises -> String:
        logd("path: " + path)
        var entry_path = path
        for key in params:
            # logi("key: " + key[] + ", value: " + str(params[key[]]))
            var value = params[key[]]
            entry_path = entry_path.replace("{" + key[] + "}", str(value))
        var path_ = "/api/v1/" + entry_path
        var full_path = path_
        if query != "":
            full_path += "?" + query
        logd("path: " + path_)
        var headers = Headers()

        headers["Accept"] = "application/json"
        headers["Content-Type"] = "application/json"

        if api == ApiType.Private:
            # headers["SIGN"] = self._api_secret
            var ts = int(now_ms() / 1000)
            var method_str = String("")
            if method == Method.METHOD_GET:
                method_str = "GET"
            elif method == Method.METHOD_POST:
                method_str = "POST"
            elif method == Method.METHOD_DELETE:
                method_str = "DELETE"
            else:
                raise Error("Invalid method: " + str(method))
            var sign = self._sign_payload(method_str, path_, query, payload, ts)
            headers["KEY"] = self._api_key
            headers["SIGN"] = sign
            headers["Timestamp"] = str(ts)
            headers["X-Gate-Channel-Id"] = "daniugege"
            # logd("sign: " + sign)
        # logd("payload: " + payload)

        var response = self._client[].request(
            full_path, method, headers, payload
        )
        if response.status_code == 0:
            raise Error("HTTP status code: " + str(response.status_code))
        if response.status_code >= 200 and response.status_code < 300:
            return response.text
        elif response.status_code >= 400 and response.status_code < 500:
            logd("response.text: " + response.text)
            if response.text.startswith("{") and response.text.endswith("}"):
                # {"label":"ORDER_NOT_FOUND"}
                var doc = JsonObject(response.text)
                var label = doc.get_str("label")
                var message = doc.get_str("message")
                # raise Error(label + ": " + message)
                return response.text
            else:
                # raise Error("HTTP status code: " + str(response.status_code))
                return response.text
        return response.text

    fn _sign_payload(
        self,
        method: String,
        path: String,
        param_string: String,
        data: String,
        ts: Int,
    ) raises -> String:
        # TODO: 需要实现
        var query_string = param_string

        # https://github.com/OnlyF0uR/OpenSSL-Mojo/blob/main/main.mojo

        var body_hash: String
        if len(data) > 0:
            body_hash = compute_sha512_hex(data)
        else:
            # 这里直接设置固定值，加快速度
            # body_hash = sha512_hex("")
            body_hash = "cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e"

        # s = f"{method}\n{path}\n{query_string}\n{body_hash}\n{ts}"
        # var s = method + "\n" + path + "\n" + query_string + "\n" + body_hash + "\n" + str(
        #     ts
        # )
        var s = String.write(
            method, "\n", path, "\n", query_string, "\n", body_hash, "\n", ts
        )
        # logd(s)
        return self._sign(s)

    @always_inline
    fn _sign(self, payload: String) raises -> String:
        # TODO: 需要实现
        return compute_hmac_sha512_hex(payload, self._api_secret)

    # 公共方法
    fn load_markets(self, mut params: Dict[String, Any]) raises -> List[Market]:
        raise Error("NotImplemented")

    fn fetch_markets(
        self, mut params: Dict[String, Any]
    ) raises -> List[Market]:
        return self.fetch_contract_markets(params)

    fn fetch_spot_markets(self, mut params: Dict[String, Any]) raises -> Market:
        raise Error("NotImplemented")

    fn fetch_contract_markets(
        self, mut params: Dict[String, Any]
    ) raises -> List[Market]:
        logd("fetch_contract_markets")
        var text = self._request(self._api.public_get_instrument_active, params)
        logi("text: " + text)
        if len(text) == 0:
            return List[Market]()
        # [{
        #     "funding_rate_indicative": "0.0001",
        #     "mark_price_round": "0.0001",
        #     "funding_offset": 0,
        #     "in_delisting": false,
        #     "risk_limit_base": "1000",
        #     "interest_rate": "0.0003",
        #     "index_price": "0.70315",
        #     "order_price_round": "0.0001",
        #     "order_size_min": 1,
        #     "ref_rebate_rate": "0.2",
        #     "name": "KNC_USDT",
        #     "ref_discount_rate": "0",
        #     "order_price_deviate": "0.3",
        #     "maintenance_rate": "0.009",
        #     "mark_type": "index",
        #     "funding_interval": 28800,
        #     "type": "direct",
        #     "risk_limit_step": "499000",
        #     "enable_bonus": false,
        #     "enable_credit": true,
        #     "leverage_min": "1",
        #     "funding_rate": "0.0001",
        #     "last_price": "0.7058",
        #     "mark_price": "0.7041",
        #     "order_size_max": 1000000,
        #     "funding_next_apply": 1733126400,
        #     "short_users": 86,
        #     "config_change_time": 1728632776,
        #     "create_time": 1647993600,
        #     "trade_size": 375608622,
        #     "position_size": 205522,
        #     "long_users": 76,
        #     "quanto_multiplier": "1",
        #     "funding_impact_value": "5000",
        #     "leverage_max": "55",
        #     "cross_leverage_default": "10",
        #     "risk_limit_max": "500000",
        #     "maker_fee_rate": "-0.0001",
        #     "taker_fee_rate": "0.00075",
        #     "orders_limit": 50,
        #     "trade_id": 2499959,
        #     "orderbook_id": 1778300516,
        #     "funding_cap_ratio": "2",
        #     "voucher_leverage": "2"
        # }]
        # 保存到文件
        # with open("data/contracts.json", "w") as f:
        #     f.write(text)
        # var doc = JsonObject(text)
        # var arr = JsonValueArrayView(doc)
        # var n = arr.len()
        var n = 0
        var result = List[Market](capacity=n)
        # for i in range(n):
        #     var obj = arr.get(i)
        #     var obj_view = JsonValueRefObjectView(obj)
        #     var market = self.parse_contract_market(obj_view, settleId)
        #     _ = obj^
        #     result.append(market)
        # _ = arr^
        # _ = doc^
        return result

    fn parse_contract_market(
        self, market: JsonValueRefObjectView, settleId: String
    ) raises -> MarketInterface:
        # TODO: 需要实现
        var id = market.get_str("name")
        var parts = id.split("_")
        var baseId = parts[0]
        var quoteId = parts[1]
        var date = parts[2] if len(parts) > 2 else ""
        var base = self._base.safe_currency_code(baseId)
        var quote = self._base.safe_currency_code(quoteId)
        var settle = self._base.safe_currency_code(settleId)
        # var expiry = self._base.safe_timestamp(market, 'expire_time')
        var expiry = int(market.get_i64("expire_time", 0))
        var symbol = String()
        var market_type = "swap"
        if date != "":
            symbol = (
                base
                + "/"
                + quote
                + ":"
                + settle
                + "-"
                + self._base.yymmdd(expiry, "")
            )
            market_type = "future"
        else:
            symbol = base + "/" + quote + ":" + settle
        var price_deviate = market.get_str("order_price_deviate")
        var mark_price = market.get_str("mark_price")
        var mark_price_p = Fixed(mark_price)
        var price_deviate_p = Fixed(price_deviate)
        var one = Fixed(1)
        # 100
        var onehundred = Fixed(100)
        var min_multiplier = one - price_deviate_p
        var max_multiplier = one - price_deviate_p
        var min_price = min_multiplier * mark_price_p
        var max_price = max_multiplier * mark_price_p
        var taker_percent = market.get_str("taker_fee_rate")
        var maker_percent = market.get_str(
            "maker_fee_rate",
            StringRef(taker_percent.unsafe_ptr(), len(taker_percent)),
        )
        var is_linear = quote == settle
        var taker = Fixed(taker_percent) / onehundred
        var maker = Fixed(maker_percent) / onehundred
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
            type=String(market_type),
            subType=String(""),  # ?
            spot=False,
            margin=False,
            marginModes=MarketMarginModes(cross=False, isolated=False),
            swap=market_type == "swap",
            future=market_type == "future",
            option=market_type == "option",
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
            contractSize=Fixed(market.get_str("quanto_multiplier")),
            expiry=expiry,
            expiryDatetime=self._base.iso8601(expiry),
            strike=_NoneType(),
            optionType=None,
            precision=0,
            # {
            #     amount= self.parse_number('1'),  # all contracts have self step size
            #     price= self.safe_number(market, 'order_price_round'),
            # },
            limits=MarketLimits(
                market=MinMax(
                    min=_NoneType(),
                    max=_NoneType(),
                ),
                leverage=MinMax(
                    min=float(market.get_str("leverage_min")),
                    max=float(market.get_str("leverage_max")),
                ),
                amount=MinMax(
                    min=int(market.get_i64("order_size_min")),
                    max=int(market.get_i64("order_size_max")),
                ),
                price=MinMax(
                    min=min_price.to_float(),
                    max=max_price.to_float(),
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
        # TODO: 需要实现
        var text = ""
        # var text = self._request(self._api.spot_get_currencies, params)
        if len(text) == 0:
            return List[Currency]()
        var doc = JsonObject(text)
        var arr = JsonValueArrayView(doc)
        var n = arr.len()
        var result = List[Currency](capacity=n)
        for i in range(0, n):
            var obj = arr.get(i)
            var obj_view = JsonValueRefObjectView(obj)
            var currencyId = obj_view.get_str("currency")
            # var currencyIdLower = currencyId.lower()
            var parts = currencyId.split("_")
            var currency_str = parts[0]
            var code = currency_str  # self._base.safe_currency_code(currency_str)
            var networkId = obj_view.get_str("chain")
            var networkCode: String
            if networkId != "":
                # networkCode = self._base.network_id_to_code(networkId, code)
                networkCode = String()
            else:
                networkCode = String()

            var delisted = obj_view.get_bool("delisted")
            var withdrawDisabled = obj_view.get_bool("withdraw_disabled", False)
            var depositDisabled = obj_view.get_bool("deposit_disabled", False)
            var tradeDisabled = obj_view.get_bool("trade_disabled", False)
            var withdrawEnabled = not withdrawDisabled
            var depositEnabled = not depositDisabled
            var tradeEnabled = not tradeDisabled
            var listed = not delisted
            var active = listed and tradeEnabled and withdrawEnabled and depositEnabled
            var currency = CurrencyInterface()
            currency.id = code.lower()
            currency.code = code
            currency.info = ""
            currency.name = currencyId
            currency.active = active
            currency.deposit = depositEnabled
            currency.withdraw = withdrawEnabled
            currency.fee = Fixed.zero
            currency.precision = Fixed(StringRef("0.0001"))
            currency.limits = CurrencyLimits(
                Limit(min=_NoneType(), max=_NoneType()),
                Limit(min=_NoneType(), max=_NoneType()),
            )
            currency.networks = Dict[String, Any]()
            var depositAvailable = obj_view.get_bool("deposit")
            depositAvailable = depositEnabled if (
                depositEnabled
            ) else depositAvailable
            var withdrawAvailable = obj_view.get_bool("withdraw")
            withdrawAvailable = withdrawEnabled if (
                withdrawEnabled
            ) else withdrawAvailable
            currency.networks = Dict[String, Any]()
            currency.info = ""
            currency.active = depositAvailable and withdrawAvailable
            currency.deposit = depositAvailable
            currency.withdraw = withdrawAvailable

            result.append(currency)

            _ = obj^

        _ = arr^
        _ = doc^

        return result

    fn fetch_ticker(self, symbol: String) raises -> Ticker:
        # TODO: 需要实现

        var params = Dict[String, Any]()
        params["settle"] = "usdt"
        var query = "contract=" + symbol
        var text = ""
        # var text = self._request(
        #     self._api.futures_get_settle_tickers, params, query
        # )
        logd(text)
        var doc = JsonObject(text)
        var arr = JsonValueArrayView(doc)
        var obj = arr.get(0)
        var obj_view = JsonValueRefObjectView(obj)
        var ticker = self.parse_ticker(obj_view)
        _ = obj^
        _ = arr^
        _ = doc^
        return ticker

    fn parse_ticker(self, obj_view: JsonValueRefObjectView) raises -> Ticker:
        # TODO: 需要实现
        var marketId = obj_view.get_str("contract")
        var symbol = marketId
        var last = Fixed(obj_view.get_str("last"))
        var ask = Fixed(obj_view.get_str("lowest_ask"))
        var bid = Fixed(obj_view.get_str("highest_bid"))
        var high = Fixed(obj_view.get_str("high_24h"))
        var low = Fixed(obj_view.get_str("low_24h"))
        var bidVolume = Fixed(obj_view.get_str("B"))
        var askVolume = Fixed(obj_view.get_str("A"))
        var timestamp = int(obj_view.get_i64("t"))
        var base_volume = obj_view.get_str("base_volume")
        var baseVolume = Fixed(base_volume) if base_volume != "" else Fixed.zero
        var quote_volume = obj_view.get_str("quote_volume")
        var quoteVolume = Fixed(
            quote_volume
        ) if quote_volume != "" else Fixed.zero
        var percentage = Fixed(obj_view.get_str("change_percentage"))
        return Ticker(
            info=Dict[String, Any](),
            symbol=symbol,
            timestamp=timestamp,
            datetime=self._base.iso8601(timestamp),
            high=high,
            low=low,
            bid=bid,
            bidVolume=bidVolume,
            ask=ask,
            askVolume=askVolume,
            vwap=Fixed.zero,
            open=Fixed.zero,
            close=last,
            last=last,
            previousClose=Fixed.zero,
            change=Fixed.zero,
            percentage=percentage,
            average=Fixed.zero,
            baseVolume=baseVolume,
            quoteVolume=quoteVolume,
            markPrice=Fixed(obj_view.get_str("mark_price")),
            indexPrice=Fixed(obj_view.get_str("index_price")),
        )

    fn fetch_tickers(
        self, symbols: Strings, mut params: Dict[String, Any]
    ) raises -> List[Ticker]:
        # TODO: 需要实现
        var text = ""
        # var text = self._request(self._api.futures_get_settle_tickers, params)
        logd(text)
        var doc = JsonObject(text)
        var arr = JsonValueArrayView(doc)
        var n = arr.len()
        var result = List[Ticker](capacity=n)
        for i in range(0, n):
            var obj = arr.get(i)
            var obj_view = JsonValueRefObjectView(obj)
            var ticker = self.parse_ticker(obj_view)
            if symbols:
                if ticker.symbol.value() in symbols.value():
                    result.append(ticker)
            else:
                result.append(ticker)
            _ = obj^
        _ = arr^
        _ = doc^
        return result

    fn fetch_order_book(
        self,
        symbol: String,
        limit: IntOpt,
        mut params: Dict[String, Any],
    ) raises -> OrderBook:
        # TODO: 需要实现
        var query = Dict[String, Any]()
        query["contract"] = symbol
        if limit is not None:
            query["limit"] = limit.value()  # default 10, max 100
        query["with_id"] = True
        var query_str = self._base.url_encode(query)
        params["settle"] = "usdt"
        var text = ""
        # var text = self._request(
        #     self._api.futures_get_settle_order_book, params, query_str
        # )
        # logd(text)

        var result = OrderBook()
        var doc = JsonObject(text)
        var timestamp = int(doc.get_f64("current") * 1000.0)
        var id = int(doc.get_i64("id"))
        result.timestamp = timestamp
        result.symbol = symbol
        result.nonce = id
        var ask_arr = doc.get_array_mut("asks")
        for i in range(0, ask_arr.len()):
            var ask = ask_arr.get(i)
            var ask_view = JsonValueRefObjectView(ask)
            var p = ask_view.get_str("p")
            var s = ask_view.get_i64("s")
            var price = Fixed(p)
            var amount = Fixed(s)
            result.asks.append(OrderbookEntry(price, amount))
        var bid_arr = doc.get_array_mut("bids")
        for i in range(0, bid_arr.len()):
            var bid = bid_arr.get(i)
            var bid_view = JsonValueRefObjectView(bid)
            var p = bid_view.get_str("p")
            var s = bid_view.get_i64("s")
            var price = Fixed(p)
            var amount = Fixed(s)
            result.bids.append(OrderbookEntry(price, amount))
        _ = doc^
        return result

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
        # TODO: 需要实现
        # params["settle"] = "usdt"
        # var text = self._request(self._api.futures_get_settle_accounts, params)
        # logd(text)
        # var result = Balance(free=Fixed.zero, used=Fixed.zero, total=Fixed.zero)
        # return result
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
        # TODO: 需要实现
        var data = JsonObject()
        data.insert_str("contract", symbol)
        data.insert_i64("size", amount.to_int())
        # if iceberg >= 0:
        #     data.insert_i64("iceberg", iceberg)
        if type == OrderType.Market:
            data.insert_str("price", "0")
        else:
            # price_to_precision
            data.insert_str("price", price.to_string())

        if "reduce_only" in params:
            data.insert_bool("reduce_only", params["reduce_only"].bool())
        if "tif" in params:
            data.insert_str("tif", params["tif"].string())
        if "text" in params:
            data.insert_str("text", params["text"].string())
        if "auto_size" in params:
            data.insert_str("auto_size", params["auto_size"].string())
        # if close:
        #     data.insert_bool("close", close)
        # if reduce_only:
        #     data.insert_bool("reduce_only", reduce_only)
        # if len(tif):
        #     data.insert_str("tif", tif)
        data.insert_str("tif", "gtc")
        # if len(text) > 0:
        #     data.insert_str("text", text)
        # if len(auto_size) > 0:
        #     data.insert_str("auto_size", auto_size)
        var payload = data.to_string()

        # logd(payload)

        params["settle"] = "usdt"

        # var text = self._request(
        #     self._api.futures_post_settle_orders, params, payload=payload
        # )
        var text = ""
        logd(text)
        var doc = JsonObject(text)
        var result = self.parse_order(doc)
        result.side = side
        return result

    fn cancel_order(
        self, id: String, symbol: Str, mut params: Dict[String, Any]
    ) raises -> Order:
        # TODO: 需要实现
        var payload = String("")
        params["settle"] = "usdt"
        var path = "futures/usdt/orders/" + id
        logd("cancel_order request start")
        var query = String("")
        var text = self._request(
            Method.METHOD_DELETE,
            path,
            params,
            query,
            payload=payload,
            api=ApiType.Private,
        )
        logd("cancel_order request end")
        logd(text)
        if "ORDER_NOT_FOUND" in text:
            logd("ORDER_NOT_FOUND")
            raise Error("ORDER_NOT_FOUND")
        logd("cancel_order request success")
        var doc = JsonObject(text)
        logd("parse_order start")
        if doc.contains_key("label"):
            var label = doc.get_str("label")
            if label == "ORDER_NOT_FOUND":
                raise Error("ORDER_NOT_FOUND")
            raise Error(label)
        var result = self.parse_order(doc)
        logd("parse_order end")
        logd(str(result))
        return result

    @staticmethod
    fn parse_order(doc: JsonObject) raises -> Order:
        # TODO: 需要实现
        if not doc.contains_key("id"):
            raise Error("error")

        var symbol_ = doc.get_str("contract")
        var id = doc.get_u64("id")
        var clientOrderId = doc.get_str("text")
        var status = doc.get_str("status")
        var type_ = doc.get_str("type")
        # var side = doc.get_str("side")
        # var left = doc.get_i64("left")
        # var amount_ = doc.get_str("amount", "0")
        var amount_ = doc.get_i64("size")
        var left = doc.get_i64("left")
        var filled_amount = amount_ - left
        var price_ = doc.get_str("price")
        var avg_price = doc.get_str("avg_deal_price")
        # var fee = doc.get_str("fee")
        # var cost = doc.get_str("cost")
        var datetime = doc.get_str("create_time")
        var timestamp = int(doc.get_i64("create_time"))
        var update_timestamp = int(doc.get_i64("update_time"))
        # var create_time_ms = int(doc.get_i64("create_time_ms"))
        # var update_time_ms = int(doc.get_i64("update_time_ms"))
        var time_in_force = doc.get_str("time_in_force")
        var result = Order(
            info=Dict[String, Any](),
            id=str(id),
            clientOrderId=clientOrderId,
            datetime=datetime,
            timestamp=timestamp,
            lastTradeTimestamp=update_timestamp,
            lastUpdateTimestamp=update_timestamp,
            status=status,
            symbol=symbol_,
            type=type_,
            timeInForce=time_in_force,
            side=OrderSide.Buy,  # todo: side
            price=Fixed(price_),
            average=Fixed(avg_price),
            amount=Fixed(amount_),
            filled=Fixed(filled_amount),
            remaining=Fixed(left),
            stopPrice=Fixed(0),
            takeProfitPrice=Fixed(0),
            stopLossPrice=Fixed(0),
            cost=Fixed(0),
            trades=List[Trade](),
            reduceOnly=False,
            postOnly=False,
            fee=None,
        )
        logd("==============")
        logd("id: " + result.id)
        logd("symbol: " + result.symbol)
        logd("type: " + result.type)
        logd("side: " + str(result.side))
        logd("amount: " + str(result.amount))
        logd("price: " + str(result.price))
        logd("==============")
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
        pass

    fn cancel_order_async(
        self, id: String, symbol: String, mut params: Dict[String, Any]
    ) raises -> None:
        pass

    fn on_order(self, order: Order) -> None:
        self._on_order(self._trading_context, order)

    fn keep_alive(self) -> None:
        pass

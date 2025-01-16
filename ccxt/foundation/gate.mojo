import time
from collections.optional import _NoneType
from memory import stack_allocation
from monoio_connect import logd, logi, logw
from monoio_connect.fixed import Fixed
from ccxt.base.types import *
from ccxt.base.exchange import Exchange
from ccxt.base.exchangeable import (
    Exchangeable,
    SubmitOrderRequest,
    CancelOrderRequest,
)
from ccxt.abstract.gate import ImplicitAPI
from monoio_connect import now_ms
from sonic import *
from monoio_connect import compute_sha512_hex, compute_hmac_sha512_hex
from monoio_connect import (
    HttpClientOptions,
    HttpClient,
    Method,
    HttpResponsePtr,
)
from monoio_connect import (
    MonoioRuntimePtr,
    http_response_status_code,
    http_response_body,
)
from monoio_connect import HttpResponseCallback, Headers
from ._common_utils import *


fn empty_on_order(trading_context: TradingContext, order: Order) -> None:
    pass


struct Gate(Exchangeable):
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
        self._testnet = config.get("testnet", False).bool()
        var base_url = "https://api.gateio.ws" if not self._testnet else "https://fx-api-testnet.gateio.ws"

        self._host = String(base_url).replace("https://", "")
        self._default_type = String("future")
        self._client = UnsafePointer[HttpClient].alloc(1)
        var options = HttpClientOptions(base_url)
        # self._client.init_pointee_move(PhotonHttpClient(options))
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
        return ExchangeId.gateio

    fn set_on_order(mut self: Self, on_order: OnOrder) raises -> None:
        self._on_order = on_order

    @always_inline
    fn _request(
        self,
        entry: Entry,
        params: Dict[String, Any],
        query: String,
        payload: String,
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
        # logd("entry: " + entry.path)
        var entry_path = path
        for key in params:
            # logi("key: " + key[] + ", value: " + str(params[key[]]))
            var value = params[key[]]
            entry_path = entry_path.replace("{" + key[] + "}", str(value))
        var path_ = "/api/v4/" + entry_path
        var full_path = path_
        if query != "":
            full_path += "?" + query
        # logd("path: " + path_)
        var headers = Headers()

        # headers["Accept"] = "application/json"
        # # headers["Content-Type"] = "application/json"
        # print(self._host)
        headers["host"] = self._host
        headers["user-agent"] = "monoio-http"
        headers["content-type"] = "application/json"
        headers["accept-encoding"] = "gzip, deflate"

        if api == ApiType.Private:
            var sign = String("")
            var method_str = String("")
            var ts = str(int(now_ms() / 1000))
            # headers["SIGN"] = self._api_secret
            if method == Method.METHOD_GET:
                method_str = "GET"
            elif method == Method.METHOD_POST:
                method_str = "POST"
            elif method == Method.METHOD_DELETE:
                method_str = "DELETE"
            else:
                raise Error("Invalid method: " + str(method))
            # log_nothing("method_str: " + method_str)
            # log_nothing("path_: " + path_)
            # log_nothing("query: " + query)

            # TODO: This line is necessary, without it there seems to be a Mojo language bug
            # logd("payload: " + payload)
            # log_nothing("ts: " + str(ts))
            var payload_ = payload
            sign = self._sign_payload(method_str, path_, query, payload_, ts)
            # logd("sign: " + sign)
            headers["KEY"] = self._api_key
            headers["SIGN"] = sign
            headers["Timestamp"] = ts
            # headers["X-Gate-Channel-Id"] = "daniugege"

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

    # @always_inline
    # fn _request_with_callback(
    #     self,
    #     method: Method,
    #     path: String,
    #     params: Dict[String, Any],
    #     query: String,
    #     payload: String,
    #     api: ApiType = ApiType.Public,
    #     callback: HttpResponseCallback = request_callback,
    # ) raises -> None:
    #     # logd("entry: " + entry.path)
    #     var entry_path = path
    #     for key in params:
    #         # logi("key: " + key[] + ", value: " + str(params[key[]]))
    #         var value = params[key[]]
    #         entry_path = entry_path.replace("{" + key[] + "}", str(value))
    #     var path_ = "/api/v4/" + entry_path
    #     # if self._debug:
    #     #     path_ = entry_path
    #     var full_path = path_
    #     if query != "":
    #         full_path += "?" + query
    #     # logd("path: " + path_)
    #     var headers = Headers()

    #     headers["Accept"] = "application/json"
    #     headers["Content-Type"] = "application/json"
    #     # headers["Host"] = self._host
    #     # logd("Host: " + self._host)

    #     if api == ApiType.Private:
    #         # headers["SIGN"] = self._api_secret
    #         var ts = str(int(now_ms() / 1000))
    #         var method_str = String("")
    #         if method == Method.METHOD_GET:
    #             method_str = "GET"
    #         elif method == Method.METHOD_POST:
    #             method_str = "POST"
    #         elif method == Method.METHOD_DELETE:
    #             method_str = "DELETE"
    #         else:
    #             raise Error("Invalid method: " + str(method))
    #         # logd("method_str: " + method_str)
    #         # logd("path_: " + path_)
    #         # logd("query: " + query)
    #         # TODO: This line is necessary, without it there seems to be a Mojo language bug
    #         # logd("payload: " + payload)
    #         # logd("ts: " + ts)
    #         var payload_ = payload
    #         var sign = self._sign_payload(
    #             method_str, path_, query, payload_, ts
    #         )
    #         # logd("sign: " + sign)
    #         headers["KEY"] = self._api_key
    #         headers["SIGN"] = sign
    #         headers["Timestamp"] = ts
    #         # headers["X-Gate-Channel-Id"] = "daniugege"

    #     # logd("body: " + payload)
    #     # logd("body_len: " + str(len(payload)))
    #     # headers["Content-Length"] = str(len(payload))
    #     self._client[].request_with_callback(
    #         full_path, method, headers, payload, 0, callback
    #     )

    @always_inline
    fn _sign_payload(
        self,
        method: String,
        path: String,
        param_string: String,
        data: String,
        ts: String,
    ) raises -> String:
        # var query_string = param_string

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
            method, "\n", path, "\n", param_string, "\n", body_hash, "\n", ts
        )
        # logd(s)
        return self._sign(s)

    @always_inline
    fn _sign(self, payload: String) raises -> String:
        return compute_hmac_sha512_hex(payload, self._api_secret)

    # 公共方法
    fn load_markets(self, mut params: Dict[String, Any]) raises -> List[Market]:
        raise Error("NotImplemented")

    fn fetch_markets(
        self, mut params: Dict[String, Any]
    ) raises -> List[Market]:
        # https://api.gateio.ws/api/v4/futures/usdt/contracts
        return self.fetch_contract_markets(params)
        # self.fetch_option_markets
        # self.fetch_spot_markets

    fn fetch_spot_markets(self, mut params: Dict[String, Any]) raises -> Market:
        raise Error("NotImplemented")

    fn fetch_contract_markets(
        self, mut params: Dict[String, Any]
    ) raises -> List[Market]:
        # {settle}/contracts
        var settleId = "usdt"
        # request = {
        #         'settle': settleId,
        #     }
        params["settle"] = settleId
        var text = self._request(
            self._api.futures_get_settle_contracts, params, "", ""
        )
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
        var doc = JsonObject(text)
        var arr = JsonValueArrayView(doc)
        var n = arr.len()
        var result = List[Market](capacity=n)
        for i in range(n):
            var obj = arr.get(i)
            var obj_view = JsonValueRefObjectView(obj)
            var market = self.parse_contract_market(obj_view, settleId)
            _ = obj^
            result.append(market)
        _ = arr^
        _ = doc^
        return result

    fn parse_contract_market(
        self, market: JsonValueRefObjectView, settleId: String
    ) raises -> MarketInterface:
        #
        #  Perpetual swap
        #
        #    {
        #        "name": "BTC_USDT",
        #        "type": "direct",
        #        "quanto_multiplier": "0.0001",
        #        "ref_discount_rate": "0",
        #        "order_price_deviate": "0.5",
        #        "maintenance_rate": "0.005",
        #        "mark_type": "index",
        #        "last_price": "38026",
        #        "mark_price": "37985.6",
        #        "index_price": "37954.92",
        #        "funding_rate_indicative": "0.000219",
        #        "mark_price_round": "0.01",
        #        "funding_offset": 0,
        #        "in_delisting": False,
        #        "risk_limit_base": "1000000",
        #        "interest_rate": "0.0003",
        #        "order_price_round": "0.1",
        #        "order_size_min": 1,
        #        "ref_rebate_rate": "0.2",
        #        "funding_interval": 28800,
        #        "risk_limit_step": "1000000",
        #        "leverage_min": "1",
        #        "leverage_max": "100",
        #        "risk_limit_max": "8000000",
        #        "maker_fee_rate": "-0.00025",
        #        "taker_fee_rate": "0.00075",
        #        "funding_rate": "0.002053",
        #        "order_size_max": 1000000,
        #        "funding_next_apply": 1610035200,
        #        "short_users": 977,
        #        "config_change_time": 1609899548,
        #        "trade_size": 28530850594,
        #        "position_size": 5223816,
        #        "long_users": 455,
        #        "funding_impact_value": "60000",
        #        "orders_limit": 50,
        #        "trade_id": 10851092,
        #        "orderbook_id": 2129638396
        #    }
        #
        #  Delivery Futures
        #
        #    {
        #        "name": "BTC_USDT_20200814",
        #        "underlying": "BTC_USDT",
        #        "cycle": "WEEKLY",
        #        "type": "direct",
        #        "quanto_multiplier": "0.0001",
        #        "mark_type": "index",
        #        "last_price": "9017",
        #        "mark_price": "9019",
        #        "index_price": "9005.3",
        #        "basis_rate": "0.185095",
        #        "basis_value": "13.7",
        #        "basis_impact_value": "100000",
        #        "settle_price": "0",
        #        "settle_price_interval": 60,
        #        "settle_price_duration": 1800,
        #        "settle_fee_rate": "0.0015",
        #        "expire_time": 1593763200,
        #        "order_price_round": "0.1",
        #        "mark_price_round": "0.1",
        #        "leverage_min": "1",
        #        "leverage_max": "100",
        #        "maintenance_rate": "1000000",
        #        "risk_limit_base": "140.726652109199",
        #        "risk_limit_step": "1000000",
        #        "risk_limit_max": "8000000",
        #        "maker_fee_rate": "-0.00025",
        #        "taker_fee_rate": "0.00075",
        #        "ref_discount_rate": "0",
        #        "ref_rebate_rate": "0.2",
        #        "order_price_deviate": "0.5",
        #        "order_size_min": 1,
        #        "order_size_max": 1000000,
        #        "orders_limit": 50,
        #        "orderbook_id": 63,
        #        "trade_id": 26,
        #        "trade_size": 435,
        #        "position_size": 130,
        #        "config_change_time": 1593158867,
        #        "in_delisting": False
        #    }
        #
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
        """
        Fetches all available currencies on an exchange.

        https://www.gate.io/docs/developers/apiv4/en/#list-all-currencies-details

        :param dict [params]: extra parameters specific to the exchange API endpoint
        :returns dict: an associative dictionary of currencies.
        """
        if self._testnet:
            logw("fetch_currencies not supported on testnet")
            return List[Currency]()

        var text = self._request(self._api.spot_get_currencies, params, "", "")
        logd("text: " + text)
        if len(text) == 0:
            return List[Currency]()

        # {
        #     "currency": "0DOG",
        #     "delisted": false,
        #     "withdraw_disabled": false,
        #     "withdraw_delayed": false,
        #     "deposit_disabled": false,
        #     "trade_disabled": false,
        #     "chain": "ETH"
        # }

        #
        #    {
        #        "currency": "BCN",
        #        "delisted": False,
        #        "withdraw_disabled": True,
        #        "withdraw_delayed": False,
        #        "deposit_disabled": True,
        #        "trade_disabled": False
        #    }
        #
        #    {
        #        "currency":"USDT_ETH",
        #        "delisted":false,
        #        "withdraw_disabled":false,
        #        "withdraw_delayed":false,
        #        "deposit_disabled":false,
        #        "trade_disabled":false,
        #        "chain":"ETH"
        #    }
        #
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
        """
        Fetches a price ticker, a statistical calculation with the information calculated over the past 24 hours for a specific market.

        https://www.gate.io/docs/developers/apiv4/en/#get-details-of-a-specifc-order
        https://www.gate.io/docs/developers/apiv4/en/#list-futures-tickers
        https://www.gate.io/docs/developers/apiv4/en/#list-futures-tickers-2
        https://www.gate.io/docs/developers/apiv4/en/#list-tickers-of-options-contracts

        :param str symbol: unified symbol of the market to fetch the ticker for
        :param dict [params]: extra parameters specific to the exchange API endpoint
        :returns dict: a `ticker structure <https://docs.ccxt.com/#/?id=ticker-structure>`.
        """
        var text: String
        var params = Dict[String, Any]()
        params["settle"] = "usdt"
        var query = "contract=" + symbol
        text = self._request(
            self._api.futures_get_settle_tickers, params, query, ""
        )
        # logd(text)
        # [{"last":"102969.5","low_24h":"94635","high_24h":"104597.4","volume_24h":"390181848","change_percentage":"7.45","funding_rate_indicative":"0.000178","index_price":"102796.9","volume_24h_base":"39016","volume_24h_quote":"4017682988","contract":"BTC_USDT","volume_24h_settle":"4017682988","funding_rate":"0.000178","mark_price":"102961.81","total_size":"196983402","highest_bid":"102984.6","highest_size":"110787","lowest_ask":"102984.7","lowest_size":"229255","quanto_multiplier":"0.0001"}]
        var doc = JsonObject(text)
        var arr = JsonValueArrayView(doc)
        var obj = arr.get(0)
        var obj_view = JsonValueRefObjectView(obj)
        var ticker = self.parse_ticker(obj_view)
        _ = obj^
        _ = arr^
        _ = doc^
        ticker.timestamp = int(now_ms())
        return ticker

    fn parse_ticker(self, obj_view: JsonValueRefObjectView) raises -> Ticker:
        #
        # SPOT
        #
        #     {
        #         "currency_pair": "KFC_USDT",
        #         "last": "7.255",
        #         "lowest_ask": "7.298",
        #         "highest_bid": "7.218",
        #         "change_percentage": "-1.18",
        #         "base_volume": "1219.053687865",
        #         "quote_volume": "8807.40299875455",
        #         "high_24h": "7.262",
        #         "low_24h": "7.095"
        #     }
        #
        # LINEAR/DELIVERY
        #
        #     {
        #         "contract": "BTC_USDT",
        #         "last": "6432",
        #         "low_24h": "6278",
        #         "high_24h": "6790",
        #         "change_percentage": "4.43",
        #         "total_size": "32323904",
        #         "volume_24h": "184040233284",
        #         "volume_24h_btc": "28613220",
        #         "volume_24h_usd": "184040233284",
        #         "volume_24h_base": "28613220",
        #         "volume_24h_quote": "184040233284",
        #         "volume_24h_settle": "28613220",
        #         "mark_price": "6534",
        #         "funding_rate": "0.0001",
        #         "funding_rate_indicative": "0.0001",
        #         "index_price": "6531"
        #     }
        #
        # bookTicker
        #    {
        #        "t": 1671363004228,
        #        "u": 9793320464,
        #        "s": "BTC_USDT",
        #        "b": "16716.8",  # best bid price
        #        "B": "0.0134",  # best bid size
        #        "a": "16716.9",  # best ask price
        #        "A": "0.0353"  # best ask size
        #     }
        #
        # option
        #
        #     {
        #         "vega": "0.00002",
        #         "leverage": "12.277188268663",
        #         "ask_iv": "0",
        #         "delta": "-0.99999",
        #         "last_price": "0",
        #         "theta": "-0.00661",
        #         "bid1_price": "1096",
        #         "mark_iv": "0.7799",
        #         "name": "BTC_USDT-20230608-28500-P",
        #         "bid_iv": "0",
        #         "ask1_price": "2935",
        #         "mark_price": "2147.3",
        #         "position_size": 0,
        #         "bid1_size": 12,
        #         "ask1_size": -14,
        #         "gamma": "0"
        #     }
        #
        var marketId = obj_view.get_str("contract")
        # var marketType = "contract" if doc.contains_key(
        #     "mark_price"
        # ) else "spot"
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
        params["settle"] = "usdt"
        var text = self._request(
            self._api.futures_get_settle_tickers, params, "", ""
        )
        # logd(text)
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
        """
        Fetches information on open orders with bid(buy) and ask(sell) prices, volumes and other data.

        https://www.gate.io/docs/developers/apiv4/en/#retrieve-order-book
        https://www.gate.io/docs/developers/apiv4/en/#futures-order-book
        https://www.gate.io/docs/developers/apiv4/en/#futures-order-book-2
        https://www.gate.io/docs/developers/apiv4/en/#options-order-book

        :param str symbol: unified symbol of the market to fetch the order book for
        :param int [limit]: the maximum amount of order book entries to return
        :param dict [params]: extra parameters specific to the exchange API endpoint
        :returns dict: A dictionary of `order book structures <https://docs.ccxt.com/#/?id=order-book-structure>` indexed by market symbols.
        """
        var query = Dict[String, Any]()
        query["contract"] = symbol
        if limit is not None:
            query["limit"] = limit.value()  # default 10, max 100
        query["with_id"] = True
        # response = None
        # if market['spot'] or market['margin']:
        #     response = self.publicSpotGetOrderBook(self.extend(request, query))
        # elif market['swap']:
        #     response = self.publicFuturesGetSettleOrderBook(self.extend(request, query))
        # elif market['future']:
        #     response = self.publicDeliveryGetSettleOrderBook(self.extend(request, query))
        # elif market['option']:
        #     response = self.publicOptionsGetOrderBook(self.extend(request, query))
        # else:
        #     raise NotSupported(self.id + ' fetchOrderBook() not support self market type')
        var query_str = self._base.url_encode(query)
        params["settle"] = "usdt"
        var text = self._request(
            self._api.futures_get_settle_order_book, params, query_str, ""
        )
        # logd(text)

        # {"id":71425995585,"current":1733387830.918,"update":1733387830.914,"asks":[{"s":9817,"p":"102738.9"},{"s":1,"p":"102739.7"},{"s":1400,"p":"102742.8"},{"s":994,"p":"102744.2"},{"s":6007,"p":"102744.3"},{"s":1,"p":"102744.8"},{"s":600,"p":"102745.3"},{"s":3900,"p":"102749.5"},{"s":1,"p":"102749.9"},{"s":2900,"p":"102750.2"}],"bids":[{"s":4057,"p":"102738.8"},{"s":1,"p":"102738.3"},{"s":1,"p":"102736"},{"s":2,"p":"102733.9"},{"s":199,"p":"102732.9"},{"s":786,"p":"102731.9"},{"s":2966,"p":"102731.8"},{"s":1,"p":"102729.8"},{"s":2,"p":"102729.5"},{"s":2232,"p":"102728.7"}]}
        # {"id":71555784842,"current":1733555964.069,"update":1733555964.064,"asks":[{"s":3994,"p":"99427.5"},{"s":1,"p":"99427.7"},{"s":209,"p":"99430.6"},{"s":1,"p":"99431.3"},{"s":201,"p":"99431.5"},{"s":1,"p":"99431.6"},{"s":1,"p":"99432"},{"s":86,"p":"99432.4"},{"s":1,"p":"99432.9"},{"s":204,"p":"99433.9"}],"bids":[{"s":6727,"p":"99427.4"},{"s":1,"p":"99425.4"},{"s":201,"p":"99424.5"},{"s":978,"p":"99423.3"},{"s":460,"p":"99423.2"},{"s":1,"p":"99421.4"},{"s":201,"p":"99421"},{"s":1511,"p":"99420.1"},{"s":2562,"p":"99420"},{"s":3250,"p":"99419.9"}]}

        #
        # spot
        #
        #     {
        #         "id": 6358770031
        #         "current": 1634345973275,
        #         "update": 1634345973271,
        #         "asks": [
        #             ["2.2241","12449.827"],
        #             ["2.2242","200"],
        #             ["2.2244","826.931"],
        #             ["2.2248","3876.107"],
        #             ["2.225","2377.252"],
        #             ["2.22509","439.484"],
        #             ["2.2251","1489.313"],
        #             ["2.2253","714.582"],
        #             ["2.2254","1349.784"],
        #             ["2.2256","234.701"]],
        #          "bids": [
        #             ["2.2236","32.465"],
        #             ["2.2232","243.983"],
        #             ["2.2231","32.207"],
        #             ["2.223","449.827"],
        #             ["2.2228","7.918"],
        #             ["2.2227","12703.482"],
        #             ["2.2226","143.033"],
        #             ["2.2225","143.027"],
        #             ["2.2224","1369.352"],
        #             ["2.2223","756.063"]
        #         ]
        #     }
        #
        # swap, future and option
        #
        #     {
        #         "id": 6358770031
        #         "current": 1634350208.745,
        #         "asks": [
        #             {"s": 24909, "p": "61264.8"},
        #             {"s": 81, "p": "61266.6"},
        #             {"s": 2000, "p": "61267.6"},
        #             {"s": 490, "p": "61270.2"},
        #             {"s": 12, "p": "61270.4"},
        #             {"s": 11782, "p": "61273.2"},
        #             {"s": 14666, "p": "61273.3"},
        #             {"s": 22541, "p": "61273.4"},
        #             {"s": 33, "p": "61273.6"},
        #             {"s": 11980, "p": "61274.5"}
        #         ],
        #         "bids": [
        #             {"s": 41844, "p": "61264.7"},
        #             {"s": 13783, "p": "61263.3"},
        #             {"s": 1143, "p": "61259.8"},
        #             {"s": 81, "p": "61258.7"},
        #             {"s": 2471, "p": "61257.8"},
        #             {"s": 2471, "p": "61257.7"},
        #             {"s": 2471, "p": "61256.5"},
        #             {"s": 3, "p": "61254.2"},
        #             {"s": 114, "p": "61252.4"},
        #             {"s": 14372, "p": "61248.6"}
        #         ],
        #         "update": 1634350208.724
        #     }
        #
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
        """
        :param dict [params]: exchange specific parameters
        :param str [params.type]: spot, margin, swap or future, if not provided self.options['defaultType'] is used
        :param str [params.settle]: 'btc' or 'usdt' - settle currency for perpetual swap and future - default="usdt" for swap and "btc" for future
        :param str [params.marginMode]: 'cross' or 'isolated' - marginMode for margin trading if not provided self.options['defaultMarginMode'] is used
        :param str [params.symbol]: margin only - unified ccxt symbol
        :param boolean [params.unifiedAccount]: default False, set to True for fetching the unified account balance
        :returns dict: a `balance structure <https://docs.ccxt.com/#/?id=balance-structure>`.
        """
        params["settle"] = "usdt"
        var text = self._request(
            self._api.futures_get_settle_accounts, params, "", ""
        )
        # {"order_margin":"0.97185","point":"0","bonus":"0","history":{"dnw":"1000","pnl":"-9.39257","refr":"0","point_fee":"0","fund":"0.8214787682","bonus_dnw":"0","point_refr":"0","bonus_offset":"0","fee":"-1.2116409725","point_dnw":"0","cross_settle":"0"},"unrealised_pnl":"72.462424","total":"990.2172677957","available":"954.330842371984","enable_credit":false,"in_dual_mode":true,"currency":"USDT","position_margin":"0","user":541811,"update_time":1736150400,"update_id":416,"position_initial_margin":"0","maintenance_margin":"6.3514389255","margin_mode":0,"enable_evolved_classic":true,"cross_initial_margin":"0","cross_maintenance_margin":"0","cross_order_margin":"0","cross_unrealised_pnl":"0","cross_available":"954.330842371984","isolated_position_margin":"34.914575423716","enable_new_dual_mode":true,"margin_mode_name":"classic"}
        # logd(text)
        var doc = JsonObject(text)
        var unrealised_pnl = Fixed(doc.get_str("unrealised_pnl"))
        var total = Fixed(doc.get_str("total"))
        var available = Fixed(doc.get_str("available"))
        var result = Balances()
        result.timestamp = int(doc.get_i64("update_time"))
        result.data["USDT"] = Balance(
            free=available,
            used=unrealised_pnl,
            total=total,
        )
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

        var text = self._request(
            self._api.futures_post_settle_orders,
            params,
            query="",
            payload=payload,
        )
        # var text = '{"refu":0,"tkfr":"0.0005","mkfr":"0.0002","contract":"BTC_USDT","id":58828270139457759,"price":"93000","tif":"gtc","iceberg":0,"text":"api","user":16792411,"is_reduce_only":false,"is_close":false,"is_liq":false,"fill_price":"0","create_time":1733801848.473,"update_time":1733801848.473,"status":"open","left":1,"refr":"0","size":1,"biz_info":"ch:daniugege","amend_text":"-","stp_act":"-","stp_id":0,"update_id":1,"pnl":"0","pnl_margin":"0"}'
        logd(text)
        # {"label":"INVALID_ARGUMENT","message":"market order without IOC or FOK"}
        # {"label":"PRICE_TOO_DEVIATED","message":"order price 50000 while mark price 95895.06 and deviation-rate limit 0.2"}
        # {"refu":0,"tkfr":"0.0005","mkfr":"0.0002","contract":"BTC_USDT","id":58828270139457759,"price":"93000","tif":"gtc","iceberg":0,"text":"api","user":16792411,"is_reduce_only":false,"is_close":false,"is_liq":false,"fill_price":"0","create_time":1733801848.473,"update_time":1733801848.473,"status":"open","left":1,"refr":"0","size":1,"biz_info":"ch:daniugege","amend_text":"-","stp_act":"-","stp_id":0,"update_id":1,"pnl":"0","pnl_margin":"0"}
        # {"refu":0,"tkfr":"0.0005","mkfr":"0.0002","contract":"BTC_USDT","id":58828270140780271,"price":"93000","tif":"gtc","iceberg":0,"text":"api","user":541811,"is_reduce_only":false,"is_close":false,"is_liq":false,"fill_price":"0","create_time":1734783293.479,"update_time":1734783293.479,"status":"open","left":1,"refr":"0","size":1,"biz_info":"ch:daniugege,dual","amend_text":"-","stp_act":"-","stp_id":0,"update_id":1,"pnl":"0","pnl_margin":"0"}
        # {"refu":0,"tkfr":"0.0005","mkfr":"0.0002","contract":"BTC_USDT","id":58828270140785044,"price":"93000","tif":"gtc","iceberg":0,"text":"api","user":541811,"is_reduce_only":false,"is_close":false,"is_liq":false,"fill_price":"0","create_time":1734784811.983,"update_time":1734784811.983,"status":"open","left":1,"refr":"0","size":1,"biz_info":"ch:daniugege,dual","amend_text":"-","stp_act":"-","stp_id":0,"update_id":1,"pnl":"0","pnl_margin":"0"}
        var doc = JsonObject(text)
        var result = self.parse_order(doc)
        # logd("result: " + str(result))
        result.side = side
        return result

    fn cancel_order(
        self, id: String, symbol: Str, mut params: Dict[String, Any]
    ) raises -> Order:
        var payload = String("")
        params["settle"] = "usdt"
        var path = "futures/usdt/orders/" + id
        var query = String("")
        var text = self._request(
            Method.METHOD_DELETE,
            path,
            params,
            query,
            payload=payload,
            api=ApiType.Private,
        )
        # logd(text)
        # {"label":"ORDER_NOT_FOUND"}
        # {"refu":0,"tkfr":"0.0005","mkfr":"0.0002","contract":"BTC_USDT","id":58828270139457759,"price":"93000","tif":"gtc","iceberg":0,"text":"api","user":16792411,"is_reduce_only":false,"is_close":false,"is_liq":false,"fill_price":"0","create_time":1733801848.473,"update_time":1733812040.073,"finish_time":1733812040.073,"finish_as":"cancelled","status":"finished","left":1,"refr":"0","size":1,"biz_info":"ch:daniugege","amend_text":"-","stp_act":"-","stp_id":0,"update_id":2,"pnl":"0","pnl_margin":"0"}
        # {"label":"ORDER_NOT_FOUND"}
        # {"label":"INVALID_SIGNATURE","message":"Signature mismatch"}
        if "ORDER_NOT_FOUND" in text:
            logd("ORDER_NOT_FOUND")
            raise Error("ORDER_NOT_FOUND")
        var doc = JsonObject(text)
        if doc.contains_key("label"):
            var label = doc.get_str("label")
            if label == "ORDER_NOT_FOUND":
                raise Error("ORDER_NOT_FOUND")
            raise Error(label)
        var result = self.parse_order(doc)
        # logd(str(result))
        return result

    @staticmethod
    fn parse_order(doc: JsonObject) raises -> Order:
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
        # logd("==============")
        # logd("id: " + result.id)
        # logd("symbol: " + result.symbol)
        # logd("type: " + result.type)
        # logd("side: " + str(result.side))
        # logd("amount: " + str(result.amount))
        # logd("price: " + str(result.price))
        # logd("==============")
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

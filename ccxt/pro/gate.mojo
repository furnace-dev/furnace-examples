import hashlib
import time
from memory import UnsafePointer
from collections import Dict
from monoio_connect import (
    now_ms,
    compute_hmac_sha512_hex,
    WebSocket,
    MonoioRuntimePtr,
    WebSocketOpenCallback,
    WebSocketMessageCallback,
    WebSocketPingCallback,
    WebSocketErrorCallback,
    WebSocketCloseCallback,
    WebSocketTimerCallback,
)
from sonic import *
from ccxt.base.types import *
from ccxt.base.pro_exchangeable import *


alias WSCallback = fn (msg: String) raises -> None


fn empty_on_ticker(trading_context: TradingContext, ticker: Ticker) -> None:
    pass


fn empty_on_tickers(
    trading_context: TradingContext, tickers: List[Ticker]
) -> None:
    pass


fn empty_on_order_book(
    trading_context: TradingContext, order_book: OrderBook
) -> None:
    pass


fn empty_on_trade(trading_context: TradingContext, trade: Trade) -> None:
    pass


fn empty_on_balance(trading_context: TradingContext, balance: Balance) -> None:
    pass


fn empty_on_order(trading_context: TradingContext, order: Order) -> None:
    pass


fn empty_on_my_trade(trading_context: TradingContext, trade: Trade) -> None:
    pass


struct WebSocketRequest:
    var _api_key: String
    var _api_secret: String
    var _channel: String
    var _event: String
    var _payload: JsonValue
    var _require_auth: Bool

    fn __init__(
        out self,
        api_key: String,
        api_secret: String,
        channel: String,
        event: String,
        owned payload: JsonValue,
        require_auth: Bool,
    ):
        self._api_key = api_key
        self._api_secret = api_secret
        self._channel = channel
        self._event = event
        self._payload = payload^
        self._require_auth = require_auth

    fn __str__(self) raises -> String:
        var ts = int(now_ms() / 1000)
        var request = JsonObject()
        request.insert_i64("time", ts)
        request.insert_str("channel", self._channel)
        request.insert_str("event", self._event)
        if self._payload.is_array():
            request.insert_value("payload", self._payload)
        else:
            request.insert_value("payload", self._payload)
        if self._require_auth:
            if not (self._api_key and self._api_secret):
                raise Error("configuration does not provide api key or secret")
            var message = String.write(
                "channel=", self._channel, "&event=", self._event, "&time=", ts
            )
            var sign = compute_hmac_sha512_hex(message, self._api_secret)
            var auth = JsonObject()
            auth.insert_str("method", "api_key")
            auth.insert_str("KEY", self._api_key)
            auth.insert_str("SIGN", sign)
            request.insert_object("auth", auth)
        var s = str(request)
        return s


struct ApiRequest:
    var _api_key: String
    var _api_secret: String
    var _channel: String
    var _header: String
    var _req_id: String
    var _payload: JsonValue

    fn __init__(
        out self,
        api_key: String,
        api_secret: String,
        channel: String,
        header: String = "",
        req_id: String = "",
        owned payload: JsonValue = JsonValue(),
    ) raises:
        self._api_key = api_key
        self._api_secret = api_secret
        self._channel = channel
        self._header = header
        self._req_id = req_id
        self._payload = payload^

    fn gen(self, dt: Int = 0) raises -> String:
        var data_time = dt if dt > 0 else int(now_ms() / 1000)
        var param_json = str(self._payload)
        var message = String.write(
            "api\n", self._channel, "\n", param_json, "\n", data_time
        )
        var signature = compute_hmac_sha512_hex(message, self._api_secret)

        var data_param = JsonObject()
        var payload = JsonObject()
        var req_header = JsonObject()

        data_param.insert_i64("time", data_time)
        data_param.insert_str("channel", self._channel)
        data_param.insert_str("event", "api")

        req_header.insert_str("X-Gate-Channel-Id", self._header)

        payload.insert_object("req_header", req_header)
        payload.insert_str("api_key", self._api_key)
        payload.insert_str("timestamp", str(data_time))
        payload.insert_str("signature", signature)
        payload.insert_str("req_id", self._req_id)
        if self._payload.is_array():
            payload.insert_value("req_param", self._payload)
        else:
            payload.insert_value("req_param", self._payload)

        data_param.insert_object("payload", payload)

        var s = str(data_param)
        return s


struct Gate(ProExchangeable):
    var _app: String
    var _settle: String
    var _api_key: String
    var _api_secret: String
    var _testnet: Bool
    var _ws: UnsafePointer[WebSocket]
    var _on_ticker: OnTicker
    var _on_tickers: OnTickers
    var _on_order_book: OnOrderBook
    var _on_trade: OnTrade
    var _on_balance: OnBalance
    var _on_order: OnOrder
    var _on_my_trade: OnMyTrade
    var _uid: UnsafePointer[String]
    var _trading_context: TradingContext
    var _subscriptions: List[Dict[String, Any]]

    fn __init__(
        out self, config: Dict[String, Any], trading_context: TradingContext
    ) raises:
        self._app = "futures"  # spot
        self._settle = str(config["settle"]) if "settle" in config else "usdt"
        self._api_key = str(config["api_key"]) if "api_key" in config else ""
        self._api_secret = (
            str(config["api_secret"]) if "api_secret" in config else ""
        )
        self._testnet = (
            config["testnet"].bool() if "testnet" in config else False
        )
        self._ws = UnsafePointer[WebSocket].alloc(1)
        var host = "api.gateio.ws"
        var port = 443
        var path = String("/ws/v4/")
        if self._app == "futures":
            host = (
                "fx-ws.gateio.ws" if not self._testnet else "fx-ws-testnet.gateio.ws"
            )
            path = "/v4/ws/" + self._settle
        __get_address_as_uninit_lvalue(self._ws.address) = WebSocket(
            host=host, port=port, path=path
        )
        self._on_ticker = empty_on_ticker
        self._on_tickers = empty_on_tickers
        self._on_order_book = empty_on_order_book
        self._on_trade = empty_on_trade
        self._on_balance = empty_on_balance
        self._on_order = empty_on_order
        self._on_my_trade = empty_on_my_trade
        self._uid = UnsafePointer[String].alloc(1)
        self._trading_context = trading_context
        self._subscriptions = List[Dict[String, Any]]()

    fn __moveinit__(out self: Self, owned other: Self):
        self._app = other._app
        self._settle = other._settle
        self._api_key = other._api_key
        self._api_secret = other._api_secret
        self._testnet = other._testnet
        self._ws = other._ws
        self._on_ticker = other._on_ticker
        self._on_tickers = other._on_tickers
        self._on_order_book = other._on_order_book
        self._on_trade = other._on_trade
        self._on_balance = other._on_balance
        self._on_order = other._on_order
        self._on_my_trade = other._on_my_trade
        self._uid = other._uid
        self._trading_context = other._trading_context
        self._subscriptions = other._subscriptions

    fn __del__(owned self: Self):
        pass

    fn set_on_ticker(mut self: Self, on_ticker: OnTicker) raises -> None:
        self._on_ticker = on_ticker

    fn set_on_tickers(mut self: Self, on_tickers: OnTickers) raises -> None:
        self._on_tickers = on_tickers

    fn set_on_order_book(
        mut self: Self, on_order_book: OnOrderBook
    ) raises -> None:
        self._on_order_book = on_order_book

    fn set_on_trade(mut self: Self, on_trade: OnTrade) raises -> None:
        self._on_trade = on_trade

    fn set_on_balance(mut self: Self, on_balance: OnBalance) raises -> None:
        self._on_balance = on_balance

    fn set_on_order(mut self: Self, on_order: OnOrder) raises -> None:
        self._on_order = on_order

    fn set_on_my_trade(mut self: Self, on_my_trade: OnMyTrade) raises -> None:
        self._on_my_trade = on_my_trade

    fn connect(mut self: Self, rt: MonoioRuntimePtr) raises -> None:
        """
        Connect to the Gate.io API.
        """
        # var host = "api.gateio.ws"
        # var port = 443
        # var path = String("/ws/v4/")
        # if self._app == "futures":
        #     host = (
        #         "fx-ws.gateio.ws" if not self._testnet else "fx-ws-testnet.gateio.ws"
        #     )
        #     path = "/v4/ws/" + self._settle
        # __get_address_as_uninit_lvalue(self._ws.address) = WebSocket(host=host, port=port, path=path)

        var on_open = self.get_on_open()
        var on_message = self.get_on_message()
        var on_ping = self.get_on_ping()
        var on_error = self.get_on_error()
        var on_close = self.get_on_close()
        var on_timer = self.get_on_timer()

        self._ws[].set_on_open(on_open^)
        self._ws[].set_on_message(on_message^)
        self._ws[].set_on_ping(on_ping^)
        self._ws[].set_on_error(on_error^)
        self._ws[].set_on_close(on_close^)
        self._ws[].set_on_timer(on_timer^)

        self._ws[0].run(rt)

    fn get_on_open(mut self) -> WebSocketOpenCallback:
        var self_ptr = UnsafePointer.address_of(self)

        fn on_open_wrapper():
            self_ptr[].__on_open()

        return on_open_wrapper

    fn get_on_message(mut self) -> WebSocketMessageCallback:
        var self_ptr = UnsafePointer.address_of(self)

        fn on_message_wrapper(msg: String):
            self_ptr[].__on_message(msg)

        return on_message_wrapper

    fn get_on_ping(mut self) -> WebSocketPingCallback:
        var self_ptr = UnsafePointer.address_of(self)

        fn on_ping_wrapper():
            self_ptr[].__on_ping()

        return on_ping_wrapper

    fn get_on_error(mut self) -> WebSocketErrorCallback:
        var self_ptr = UnsafePointer.address_of(self)

        fn on_error_wrapper(err: String):
            self_ptr[].__on_error(err)

        return on_error_wrapper

    fn get_on_close(mut self) -> WebSocketCloseCallback:
        var self_ptr = UnsafePointer.address_of(self)

        fn on_close_wrapper():
            self_ptr[].__on_close()

        return on_close_wrapper

    fn get_on_timer(mut self) -> WebSocketTimerCallback:
        var self_ptr = UnsafePointer.address_of(self)

        fn on_timer_wrapper(count: UInt64):
            self_ptr[].__on_timer(count)

        return on_timer_wrapper

    fn __on_open(mut self) -> None:
        logd("__on_open")
        try:
            for sub in self._subscriptions:
                var type = sub[]["type"].string()
                if type == "ticker":
                    var symbol = sub[]["symbol"].string()
                    self.subscribe_ticker_internal(symbol)
                elif type == "order_book":
                    var symbol = sub[]["symbol"].string()
                    var interval = sub[]["interval"].string()
                    self.subscribe_order_book_internal(symbol, interval)
                elif type == "order":
                    # var symbol = sub[]["symbol"].string()
                    # self.subscribe_order_internal(symbol)
                    pass
                elif type == "trades":
                    # var symbol = sub[]["symbol"].string()
                    # self.subscribe_trade_internal(symbol)
                    pass
                elif type == "balance":
                    # self.subscribe_balance_internal()
                    pass
                else:
                    logi("unknown type: " + str(type))
        except err:
            print(str(err))

    @always_inline
    fn __on_message(mut self, message: String) -> None:
        """Handler for parsing WS messages."""
        logd("message: " + message)
        # 心跳返回:
        # {"time":1733818191,"time_ms":1733818191416,"conn_id":"ef7c8be54338b11b","channel":"futures.pong","event":"","result":null}

        # 订阅orders返回:
        # {"time":1733904136,"time_ms":1733904136554,"conn_id":"47d87a52222a2e70","trace_id":"5ccb96374abd8bbb105fa60aa69f2606","channel":"futures.orders","event":"subscribe","payload":["16792411","BTC_USDT"],"result":{"status":"success"}}

        # order_book_update
        # {"time":1733899014,"time_ms":1733899014113,"channel":"futures.order_book_update","event":"update","result":{"t":1733899010864,"s":"BTC_USDT","U":562559263,"u":562559263,"b":[{"p":"97612.4","s":18841},{"p":"97267.2","s":11},{"p":"97259.6","s":23},{"p":"97110.1","s":14},{"p":"96769.2","s":24},{"p":"83312","s":10000},{"p":"83086.5","s":18668},{"p":"97632.4","s":20767},{"p":"97252.9","s":1},{"p":"93800","s":39550},{"p":"97627.1","s":12109},{"p":"97629","s":15782},{"p":"97362.9","s":13},{"p":"97093.4","s":19},{"p":"89000","s":50000},{"p":"85000","s":93821},{"p":"97636.1","s":18467},{"p":"95444.4","s":82468},{"p":"83265.1","s":25261},{"p":"83153.6","s":21345},{"p":"96931.6","s":15},{"p":"97626.6","s":17346},{"p":"97555.5","s":24333},{"p":"96186.9","s":10500},{"p":"94800","s":70000},{"p":"92112.1","s":97560},{"p":"90927","s":10000},{"p":"90346.6","s":15000},{"p":"97630.1","s":25372},{"p":"83153.9","s":21372},{"p":"94600","s":87555},{"p":"94580","s":100000},{"p":"94555.5","s":989},{"p":"94505","s":1},{"p":"93200","s":20000},{"p":"83269.3","s":21622},{"p":"97459","s":18},{"p":"97621.2","s":24837},{"p":"93669","s":1000},{"p":"90666","s":2600},{"p":"90000","s":83964},{"p":"88001","s":10000},{"p":"83153","s":21766},{"p":"97628.9","s":17058},{"p":"97627.2","s":19887},{"p":"97218.4","s":24},{"p":"97100","s":10000},{"p":"97632.5","s":15909},{"p":"97463.5","s":15},{"p":"84505.9","s":20000},{"p":"83338.2","s":15000},{"p":"83268","s":19193},{"p":"83160.7","s":19593},{"p":"97612.9","s":35585},{"p":"97622","s":15829},{"p":"97618.4","s":17622},{"p":"97447.4","s":6},{"p":"95600","s":100},{"p":"97636","s":1576},{"p":"97552","s":7036},{"p":"96650","s":97666},{"p":"94000","s":10000},{"p":"90350","s":20000},{"p":"85218","s":11717},{"p":"83333","s":2348},{"p":"83267.4","s":18929},{"p":"97627","s":24812},{"p":"83080","s":21490},{"p":"83152.3","s":28037},{"p":"97615.1","s":23351},{"p":"96871.6","s":4},{"p":"96820.9","s":14},{"p":"92000","s":35595},{"p":"88880","s":100000},{"p":"83268.7","s":27669},{"p":"97625.5","s":15988},{"p":"97621.4","s":20344},{"p":"97615","s":3785},{"p":"88888","s":50000},{"p":"83608","s":20000},{"p":"83088","s":29298},{"p":"83084.5","s":21658},{"p":"83081.5","s":35862},{"p":"97628.6","s":15800},{"p":"83086.3","s":20248},{"p":"97396.5","s":15},{"p":"97634.8","s":15721},{"p":"97624.8","s":37302},{"p":"97623.2","s":17420},{"p":"97623","s":17630},{"p":"97257","s":4},{"p":"86000","s":100000},{"p":"83152.5","s":19387},{"p":"97635","s":19385},{"p":"97632.3","s":25043},{"p":"97372.5","s":1},{"p":"92500","s":1005},{"p":"88000","s":111961},{"p":"83268.1","s":18581},{"p":"97636.4","s":15299}],"a":[{"p":"97648","s":17959},{"p":"97663.1","s":21707},{"p":"98457.6","s":10},{"p":"115249","s":20000},{"p":"97668.1","s":44917},{"p":"97922.5","s":14},{"p":"98339.3","s":15},{"p":"98400","s":50000},{"p":"99908.1","s":52},{"p":"97643.6","s":14476},{"p":"121467.6","s":20000},{"p":"97648.8","s":17049},{"p":"97661.6","s":19133},{"p":"97642.8","s":23109},{"p":"97647.9","s":17800},{"p":"97661.7","s":18229},{"p":"97667.7","s":17523},{"p":"97670.8","s":16338},{"p":"100649.3","s":1000000},{"p":"108000","s":3913},{"p":"97646.3","s":23483},{"p":"97654.8","s":20984},{"p":"97663.2","s":34292},{"p":"97667.2","s":19533},{"p":"98517.8","s":30000},{"p":"119666","s":6000},{"p":"97657","s":15805},{"p":"97669.5","s":39008},{"p":"99999","s":10000},{"p":"103500","s":31619},{"p":"104000","s":55500},{"p":"115989.4","s":10000},{"p":"103514.5","s":15000},{"p":"97642.7","s":12159},{"p":"97733.3","s":1},{"p":"98283.5","s":15},{"p":"98333.2","s":14565},{"p":"98514.4","s":10000},{"p":"100815","s":1953},{"p":"101949.3","s":2000000},{"p":"121545.6","s":20000},{"p":"97748.3","s":8},{"p":"97899.4","s":13},{"p":"112000","s":3056},{"p":"97667.1","s":36246},{"p":"97802.6","s":3},{"p":"98000","s":22690},{"p":"99188","s":50000},{"p":"102500","s":181},{"p":"122405","s":239613},{"p":"97667.5","s":15848},{"p":"97773.5","s":12},{"p":"98500","s":79712},{"p":"101500","s":183},{"p":"110000","s":17407},{"p":"119324.5","s":20000},{"p":"97636.5","s":24312},{"p":"98327.8","s":3},{"p":"100728.6","s":10000},{"p":"109515.6","s":85228},{"p":"97645.9","s":20536},{"p":"97653.3","s":19028},{"p":"97700","s":30},{"p":"98012","s":16},{"p":"100000","s":119192},{"p":"97656.3","s":17496},{"p":"98273.4","s":25},{"p":"100949.3","s":1000000},{"p":"102222","s":276285},{"p":"116000","s":4656},{"p":"120000","s":80000},{"p":"122400","s":6000},{"p":"97664.2","s":18091},{"p":"98888","s":100000},{"p":"105000","s":19472},{"p":"110356.9","s":20000},{"p":"97647.5","s":17695},{"p":"97655.7","s":19471},{"p":"97657.4","s":16915},{"p":"97666.5","s":16456}]}}
        # {"time":1733899015,"time_ms":1733899015914,"channel":"futures.order_book_update","event":"update","result":{"t":1733899015884,"s":"BTC_USDT","U":562559264,"u":562559264,"b":[],"a":[{"p":"97636.5","s":23288}]}}
        # {"time":1733899016,"time_ms":1733899016413,"channel":"futures.order_book_update","event":"update","result":{"t":1733899016364,"s":"BTC_USDT","U":562559265,"u":562559265,"b":[{"p":"96186.9","s":10500},{"p":"97478.7","s":22},{"p":"83080","s":0}],"a":[]}}
        # {"time":1733899016,"time_ms":1733899016712,"channel":"futures.order_book_update","event":"update","result":{"t":1733899016673,"s":"BTC_USDT","U":562559266,"u":562559266,"b":[],"a":[{"p":"97636.5","s":11687}]}}

        # ticker
        # {"time":1733972741,"time_ms":1733972741782,"channel":"futures.book_ticker","event":"update","result":{"t":1733972741772,"u":562921416,"s":"BTC_USDT","b":"101114","B":3357,"a":"101114.1","A":25805}}
        # {"time":1733972746,"time_ms":1733972746796,"channel":"futures.book_ticker","event":"update","result":{"t":1733972746784,"u":562921417,"s":"BTC_USDT","b":"101114","B":3357,"a":"101114.1","A":24816}}
        # {"time":1733972746,"time_ms":1733972746955,"channel":"futures.book_ticker","event":"update","result":{"t":1733972746951,"u":562921419,"s":"BTC_USDT","b":"101114","B":3357,"a":"101114.1","A":8851}}
        # {"time":1733972746,"time_ms":1733972746962,"channel":"futures.book_ticker","event":"update","result":{"t":1733972746956,"u":562921421,"s":"BTC_USDT","b":"101114","B":3357,"a":"101119.1","A":7415}}

        var json_obj = JsonObject(message)

        var channel = json_obj.get_str_ref("channel")
        # logd("channel: " + str(channel))
        if channel == "futures.book_ticker":
            self.__on_ticker(json_obj)
        elif channel == "futures.order_book_update":
            self.__on_order_book_update(json_obj)
        elif channel == "futures.orders":
            self.__on_orders(json_obj)
        elif channel == "futures.pong":
            self.__on_pong(json_obj)
        elif channel == "" and json_obj.contains_key("header"):
            self.__on_header(json_obj)
        else:
            logi("unknown channel: " + str(channel))

        _ = json_obj^

    fn __on_ping(self) -> None:
        logd("__on_ping")

    fn __on_error(self, error: String) -> None:
        logd("__on_error: " + error)

    fn __on_close(self) -> None:
        logd("__on_close")

    fn __on_timer(self, count: UInt64) -> None:
        logd("__on_timer")
        try:
            var request = JsonObject()
            request.insert_i64("time", int(now_ms() / 1000))
            request.insert_str("channel", String.format("{}.ping", self._app))
            var data_str = str(request)
            self.send(data_str)
        except:
            logd("__on_timer error")

    @always_inline
    fn __on_ticker(self, json_obj: JsonObject) -> None:
        # {"time":1733972740,"channel":"futures.book_ticker","event":"subscribe","payload":["BTC_USDT"]}
        var event = json_obj.get_str_ref("event")
        if event == "update":
            # {"time":1733972741,"time_ms":1733972741782,"channel":"futures.book_ticker","event":"update","result":{"t":1733972741772,"u":562921416,"s":"BTC_USDT","b":"101114","B":3357,"a":"101114.1","A":25805}}
            # {"time":1733972746,"time_ms":1733972746796,"channel":"futures.book_ticker","event":"update","result":{"t":1733972746784,"u":562921417,"s":"BTC_USDT","b":"101114","B":3357,"a":"101114.1","A":24816}}
            # {"time":1733972746,"time_ms":1733972746955,"channel":"futures.book_ticker","event":"update","result":{"t":1733972746951,"u":562921419,"s":"BTC_USDT","b":"101114","B":3357,"a":"101114.1","A":8851}}
            # {"time":1733972746,"time_ms":1733972746962,"channel":"futures.book_ticker","event":"update","result":{"t":1733972746956,"u":562921421,"s":"BTC_USDT","b":"101114","B":3357,"a":"101119.1","A":7415}}
            var result = json_obj.get_object_mut("result")
            var symbol = String(result.get_str_ref("s"))
            var bid = Fixed(result.get_str_ref("b"))
            var ask = Fixed(result.get_str_ref("a"))
            var bid_size = result.get_i64("B")
            var ask_size = result.get_i64("A")
            var ticker = Ticker()
            ticker.symbol = symbol
            ticker.bid = bid
            ticker.ask = ask
            ticker.bidVolume = Fixed(bid_size)
            ticker.askVolume = Fixed(ask_size)
            ticker.timestamp = int(result.get_i64("t"))
            ticker.datetime = str(result.get_i64("time"))
            self._on_ticker(self._trading_context, ticker)
            _ = result^
        elif event == "subscribe":
            pass
        else:
            logi("unknown event: " + str(event))

    @always_inline
    fn __on_order_book_update(self, json_obj: JsonObject) -> None:
        var event = json_obj.get_str_ref("event")
        if event == "update":
            pass
        elif event == "subscribe":
            pass
        else:
            logi("unknown event: " + str(event))

    @always_inline
    fn __on_orders(self, json_obj: JsonObject) -> None:
        # {"time":1733968288,"time_ms":1733968288265,"channel":"futures.orders","event":"update","result":[{"tkfr":0.0005,"text":"api","user":"16792411","stp_act":"-","id":58828270140012048,"refr":0,"is_reduce_only":false,"mkfr":0.0002,"stop_loss_price":"","is_liq":false,"fill_price":0,"finish_as":"_new","size":1,"contract":"BTC_USDT","stop_profit_price":"","create_time_ms":1733968288255,"status":"open","price":93000,"biz_info":"ch:daniugege","is_close":false,"left":1,"tif":"gtc","finish_time_ms":1733968288255,"stp_id":"0","update_id":1,"iceberg":0,"refu":0,"finish_time":1733968288,"amend_text":"-","create_time":1733968288}]}
        var event = json_obj.get_str_ref("event")
        if event == "update":
            # 订单更新
            var result = json_obj.get_array_mut("result")
            # assert_true(result.len() > 0)
            if result.len() == 0:
                return

            var list_iter = result.iter_mut()
            var orders = List[Order](capacity=result.len())
            while True:
                var value = list_iter.next()
                if value.is_null():
                    break

                var order = Order()
                var obj = value.as_object_mut()
                order.id = str(obj.get_u64("id"))
                order.symbol = obj.get_str_ref("contract")
                order.status = obj.get_str_ref("status")
                order.side = OrderSide.Buy  # TODO:
                order.price = Fixed(obj.get_f64("price"))
                order.amount = Fixed(obj.get_i64("size"))
                order.remaining = Fixed(obj.get_i64("left"))
                order.filled = order.amount - order.remaining
                order.datetime = str(obj.get_i64("create_time"))  # TODO:
                order.timestamp = int(obj.get_i64("create_time_ms"))
                order.lastTradeTimestamp = int(obj.get_i64("create_time_ms"))
                order.lastUpdateTimestamp = order.lastTradeTimestamp
                order.clientOrderId = obj.get_str_ref("text")
                order.timeInForce = String(obj.get_str_ref("tif"))
                order.fee = None  # TODO:
                order.trades = List[Trade]()  # TODO:
                order.reduceOnly = False  # TODO:
                order.postOnly = False  # TODO:
                order.stopPrice = Fixed(0)  # TODO:
                order.takeProfitPrice = Fixed(0)  # TODO:
                order.stopLossPrice = Fixed(0)  # TODO:
                order.cost = Fixed(0)  # TODO:
                order.info = Dict[String, Any]()  # TODO:
                orders.append(order)
                _ = obj^

            _ = list_iter^
            _ = result^

            for order in orders:
                self._on_order(self._trading_context, order[])

        elif event == "subscribe":
            pass
        else:
            logi("unknown event: " + str(event))

    @always_inline
    fn __on_pong(self, json_obj: JsonObject) -> None:
        logd("__on_pong")

    @always_inline
    fn __on_header(mut self, json_obj: JsonObject) -> None:
        # 登录返回:
        # {"header":{"response_time":"1733900436123","status":"200","channel":"futures.login","event":"api","client_id":"223.112.219.22-0xc018d492c0"},"data":{"result":{"uid":"16792411","api_key":"10d23703c09150b1bf4c5bb7f0f1dd2e"}},"request_id":"Be4Ts0I4OZ6r9msg_pFu-"}
        # {"header":{"response_time":"1733903074787","status":"200","channel":"futures.login","event":"api","client_id":"223.112.219.22-0xc02b024280"},"data":{"result":{"uid":"16792411","api_key":"10d23703c09150b1bf4c5bb7f0f1dd2e"}},"request_id":"uEVe_UNMLwD0VmIwu9mXN"}

        var header = json_obj.get_object_mut("header")
        var channel = header.get_str("channel")
        if channel == "futures.login":
            var data = json_obj.get_object_mut("data")
            var result = data.get_object_mut("result")
            var api_key = result.get_str("api_key")
            var uid = result.get_str("uid")
            logd("api_key: " + api_key)
            logd("uid: " + uid)
            _ = data^
            self._uid[] = uid
            self._on_login()
        else:
            logi("unknown channel: " + channel)

    fn _on_login(mut self) -> None:
        logd("_on_login")
        try:
            for sub in self._subscriptions:
                var type = sub[]["type"].string()
                if type == "ticker":
                    pass
                elif type == "order_book":
                    pass
                elif type == "order":
                    var symbol = sub[]["symbol"].string()
                    self.subscribe_order_internal(symbol)
                elif type == "trades":
                    var symbol = sub[]["symbol"].string()
                    self.subscribe_trade_internal(symbol)
                    pass
                elif type == "balance":
                    self.subscribe_balance_internal()
                else:
                    logi("unknown type: " + str(type))
        except err:
            print(str(err))

    fn send(self, data: String) -> None:
        _ = self._ws[0].send(data)

    fn subscribe_ticker(
        mut self, symbol: String, params: Dict[String, Any]
    ) raises -> None:
        var sub = Dict[String, Any]()
        sub["type"] = "ticker"
        sub["symbol"] = symbol
        self._subscriptions.append(sub)

    fn subscribe_ticker_internal(mut self, symbol: String) raises -> None:
        # https://www.gate.io/docs/developers/futures/ws/zh_CN/#%E6%9C%80%E4%BD%B3%E4%B9%B0%E5%8D%96%E4%BB%B7%E8%AE%A2%E9%98%85
        var name = String.format("{}.book_ticker", self._app)
        var p = JsonValue.from_str("[]")
        var pv = JsonValueArrayView(p)
        pv.push_str(symbol)
        self.subscribe(name, p, False)

    fn subscribe_tickers(
        mut self, symbols: Strings, params: Dict[String, Any]
    ) raises -> None:
        pass

    fn subscribe_tickers_internal(
        mut self, symbols: Strings, params: Dict[String, Any]
    ) raises -> None:
        pass

    fn subscribe_order_book(
        mut self, symbol: String, params: Dict[String, Any]
    ) raises -> None:
        var sub = Dict[String, Any]()
        sub["type"] = "order_book"
        sub["symbol"] = symbol
        sub["interval"] = "100ms"
        self._subscriptions.append(sub)

    fn subscribe_order_book_internal(
        mut self, symbol: String, interval: String
    ) raises -> None:
        # print("subscribe_order_book")
        var name = String.format("{}.order_book_update", self._app)
        var p = JsonValue.from_str("[]")
        var pv = JsonValueArrayView(p)
        pv.push_str(symbol)
        pv.push_str(interval)
        self.subscribe(name, p, False)

    fn subscribe_trade(
        mut self, symbol: String, params: Dict[String, Any]
    ) raises -> None:
        var sub = Dict[String, Any]()
        sub["type"] = "trade"
        sub["symbol"] = symbol
        self._subscriptions.append(sub)

    fn subscribe_trade_internal(mut self, symbol: String) raises -> None:
        pass

    fn subscribe_balance(mut self, params: Dict[String, Any]) raises -> None:
        pass

    fn subscribe_balance_internal(mut self) raises -> None:
        pass

    fn subscribe_order(
        mut self, symbol: String, params: Dict[String, Any]
    ) raises -> None:
        var sub = Dict[String, Any]()
        sub["type"] = "order"
        sub["symbol"] = symbol
        self._subscriptions.append(sub)

    fn subscribe_order_internal(mut self, symbol: String) raises -> None:
        if self._uid[] == "":
            raise Error("uid is not set")
        logd("100")
        var name = String.format("{}.orders", self._app)
        logd("101")
        var p = JsonValue.from_str("[]")
        logd("102")
        var pv = JsonValueArrayView(p)
        logd("103")
        logd("uid=" + self._uid[])
        pv.push_str(self._uid[])
        logd("104")
        pv.push_str(symbol)
        logd("105")
        self.subscribe(name, p, True)
        logd("106")
        _ = p^

    fn subscribe_my_trades(
        mut self, symbol: String, params: Dict[String, Any]
    ) raises -> None:
        pass

    fn subscribe(
        self, name: String, owned payload: JsonValue, require_auth: Bool
    ) raises:
        var request = WebSocketRequest(
            self._api_key,
            self._api_secret,
            name,
            "subscribe",
            payload^,
            require_auth,
        )
        var request_text = str(request)
        # {"time":1733898511,"channel":"futures.order_book","event":"subscribe","payload":["BTC_USDT","100ms"]}
        logd("subscribe: " + request_text)
        self.send(request_text)

    fn unsubscribe(
        self, name: String, owned payload: JsonValue, require_auth: Bool
    ) raises:
        var request = WebSocketRequest(
            self._api_key,
            self._api_secret,
            name,
            "unsubscribe",
            payload^,
            require_auth,
        )
        self.send(str(request))

    fn login(self, header: String, req_id: String) raises:
        """
        Login to the Gate.io API.
        """
        var channel = String.format("{}.login", self._app)
        var text = ApiRequest(
            self._api_key,
            self._api_secret,
            channel,
            header,
            req_id,
            JsonValue.from_str("{}"),
        ).gen()
        logd("login: " + text)
        # {"time":1733900436,"channel":"futures.login","event":"api","payload":{"req_header":{"X-Gate-Channel-Id":"header"},"api_key":"10d23703c09150b1bf4c5bb7f0f1dd2e","timestamp":"1733900436","signature":"317580edef0b1bd60b50bd7c618fa5f68dc3c0874e27cc1f9b3f84a747b478b90e99c31f0c1fb9720639ba3281ec1dfa469e1bbff3ecd62f4c8ec047f964e590","req_id":"Be4Ts0I4OZ6r9msg_pFu-","req_param":{}}}
        self.send(text)

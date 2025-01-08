from collections import Dict
from os import getenv
from testing import assert_equal, assert_true
from ccxt.base.types import *
from ccxt.foundation.bybit import Bybit
from ccxt.foundation.gate import Gate
from sonic import *
from monoio_connect import *


fn test_fetch_markets() raises:
    var config = Dict[String, Any]()
    var trading_context = TradingContext(
        exchange_id="gate",
        account_id="16792411",
        trader_id="daniugege",
    )
    var gate = Gate(config, trading_context)
    var text = open("data/contracts.json", "r").read()
    assert_true(len(text) > 0)
    var doc = JsonObject(text)
    var arr = JsonValueArrayView(doc)
    var n = arr.len()
    assert_true(n > 0)
    var result = List[Market](capacity=n)
    for i in range(n):
        var obj = arr.get(i)
        var view = JsonValueRefObjectView(obj)
        var market = gate.parse_contract_market(view, "usdt")
        _ = obj^
        result.append(market)
    _ = arr^
    _ = doc^


fn test_create_order() raises:
    var text = '{"refu":0,"tkfr":"0.0005","mkfr":"0.0002","contract":"BTC_USDT","id":58828270139457759,"price":"93000","tif":"gtc","iceberg":0,"text":"api","user":16792411,"is_reduce_only":false,"is_close":false,"is_liq":false,"fill_price":"0","create_time":1733801848.473,"update_time":1733801848.473,"status":"open","left":1,"refr":"0","size":1,"biz_info":"ch:daniugege","amend_text":"-","stp_act":"-","stp_id":0,"update_id":1,"pnl":"0","pnl_margin":"0"}'
    var doc = JsonObject(text)
    var symbol = doc.get_str("contract")
    var id = doc.get_u64("id")
    var clientOrderId = doc.get_str("text")
    var status = doc.get_str("status")
    var type = doc.get_str("type")
    var amount = doc.get_str("amount", "0")
    var filled_amount = doc.get_i64("filled_amount")
    var price = doc.get_str("price")
    var avg_price = doc.get_str("avg_deal_price")
    var datetime = doc.get_str("create_time")
    var timestamp = int(doc.get_i64("create_time"))
    var update_timestamp = int(doc.get_i64("update_time"))
    var time_in_force = doc.get_str("time_in_force")
    var info = Dict[String, Any]()
    var id_str = str(id)
    var price_fixed = Fixed(price)
    var average_fixed = Fixed(avg_price)
    var amount_fixed = Fixed(amount)
    var filled_amount_fixed = Fixed(filled_amount)
    var remaining = Fixed(0)
    var result = Order(
        info=info,
        id=id_str,
        clientOrderId=clientOrderId,
        datetime=datetime,
        timestamp=timestamp,  # todo:
        lastTradeTimestamp=update_timestamp,
        lastUpdateTimestamp=update_timestamp,
        status=status,
        symbol=symbol,
        type=type,
        timeInForce=time_in_force,
        side=OrderSide.Buy,  # side
        price=price_fixed,
        average=average_fixed,
        amount=amount_fixed,
        filled=filled_amount_fixed,
        remaining=Fixed(0),
        stopPrice=Fixed(0),
        takeProfitPrice=Fixed(0),
        stopLossPrice=Fixed(0),
        cost=Fixed(0),
        trades=List[Trade](),
        reduceOnly=False,
        postOnly=False,
        fee=None,
    )
    assert_equal(
        str(result),
        (
            "Order(id=58828270139457759, symbol=BTC_USDT, type=, side=buy,"
            " amount=0, price=93000)"
        ),
    )


fn test_ws_login_parse() raises:
    var text = '{"header":{"response_time":"1733900436123","status":"200","channel":"futures.login","event":"api","client_id":"223.112.219.22-0xc018d492c0"},"data":{"result":{"uid":"16792411","api_key":"10d23703c09150b1bf4c5bb7f0f1dd2e"}},"request_id":"Be4Ts0I4OZ6r9msg_pFu-"}'
    var doc = JsonObject(text)
    var header = doc.get_object_mut("header")
    var channel = header.get_str("channel")
    assert_equal(channel, "futures.login")
    var data = doc.get_object_mut("data")
    var result = data.get_object_mut("result")
    var uid = result.get_str("uid")
    assert_equal(uid, "16792411")
    var api_key = result.get_str("api_key")
    assert_equal(api_key, "10d23703c09150b1bf4c5bb7f0f1dd2e")
    _ = result^
    _ = data^
    _ = doc^
    _ = header^


fn test_ws_order() raises:
    var text = '{"time":1733968288,"time_ms":1733968288265,"channel":"futures.orders","event":"update","result":[{"tkfr":0.0005,"text":"api","user":"16792411","stp_act":"-","id":58828270140012048,"refr":0,"is_reduce_only":false,"mkfr":0.0002,"stop_loss_price":"","is_liq":false,"fill_price":0,"finish_as":"_new","size":1,"contract":"BTC_USDT","stop_profit_price":"","create_time_ms":1733968288255,"status":"open","price":93000,"biz_info":"ch:daniugege","is_close":false,"left":1,"tif":"gtc","finish_time_ms":1733968288255,"stp_id":"0","update_id":1,"iceberg":0,"refu":0,"finish_time":1733968288,"amend_text":"-","create_time":1733968288}]}'
    var doc = JsonObject(text)
    var event = doc.get_str_ref("event")
    assert_equal(event, "update")
    var result = doc.get_array_mut("result")
    assert_true(result.len() > 0)
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
    _ = doc^

    assert_equal(len(orders), 1)
    assert_equal(orders[0].id, "58828270140012048")
    assert_equal(orders[0].symbol, "BTC_USDT")
    assert_equal(orders[0].status, "open")
    assert_equal(orders[0].price, Fixed(93000))
    assert_equal(orders[0].amount, Fixed(1))
    assert_equal(orders[0].filled, Fixed(0))
    assert_equal(orders[0].remaining, Fixed(1))
    assert_equal(orders[0].datetime, "1733968288")
    assert_equal(orders[0].timestamp, 1733968288255)
    assert_equal(orders[0].lastTradeTimestamp, 1733968288255)
    assert_equal(orders[0].lastUpdateTimestamp, 1733968288255)
    assert_equal(orders[0].clientOrderId, "api")
    assert_equal(orders[0].timeInForce, "gtc")
    assert_equal(orders[0].reduceOnly, False)
    assert_equal(orders[0].postOnly, False)
    assert_equal(orders[0].stopPrice, Fixed(0))
    assert_equal(orders[0].takeProfitPrice, Fixed(0))
    assert_equal(orders[0].stopLossPrice, Fixed(0))
    assert_equal(orders[0].cost, Fixed(0))


fn test_create_order_parse() raises:
    var text = '{"refu":0,"tkfr":"0.0005","mkfr":"0.0002","contract":"BTC_USDT","id":58828270140601693,"price":"93000","tif":"gtc","iceberg":0,"text":"api","user":16792411,"is_reduce_only":false,"is_close":false,"is_liq":false,"fill_price":"0","create_time":1734400728.266,"update_time":1734400728.266,"status":"open","left":1,"refr":"0","size":1,"biz_info":"ch:daniugege","amend_text":"-","stp_act":"-","stp_id":0,"update_id":1,"pnl":"0","pnl_margin":"0"}'
    var doc = JsonObject(text)
    var trading_context = TradingContext(
        exchange_id="gate",
        account_id="16792411",
        trader_id="daniugege",
    )
    var gate = Gate(Dict[String, Any](), trading_context)
    var result = gate.parse_order(doc)
    assert_equal(result.id, "58828270140601693")
    assert_equal(result.symbol, "BTC_USDT")
    assert_equal(result.status, "open")
    assert_equal(result.price, Fixed(93000))
    assert_equal(result.amount, Fixed(1))
    assert_equal(result.filled, Fixed(0))
    assert_equal(result.remaining, Fixed(1))


fn test_create_order_parse_2() raises:
    var text = '{"refu":0,"tkfr":"0.0005","mkfr":"0.0002","contract":"BTC_USDT","id":58828270140785044,"price":"93000","tif":"gtc","iceberg":0,"text":"api","user":541811,"is_reduce_only":false,"is_close":false,"is_liq":false,"fill_price":"0","create_time":1734784811.983,"update_time":1734784811.983,"status":"open","left":1,"refr":"0","size":1,"biz_info":"ch:daniugege,dual","amend_text":"-","stp_act":"-","stp_id":0,"update_id":1,"pnl":"0","pnl_margin":"0"}'
    var doc = JsonObject(text)
    var trading_context = TradingContext(
        exchange_id="gate",
        account_id="16792411",
        trader_id="daniugege",
    )
    var gate = Gate(Dict[String, Any](), trading_context)
    var result = gate.parse_order(doc)
    print(str(result))


fn test_a() raises:
    var a = "100"
    if a == "100":
        var a = "101"
        assert_equal(a, "101")
    assert_equal(a, "100")


fn test_sign() raises:
    # method_str: POST
    # path_: /api/v4/futures/usdt/orders
    # query:
    # payload: {"contract":"BTC_USDT","size":1,"price":"93000","tif":"gtc"}
    # ts: 1735736524
    # sign: 8c759c5cb2ae052e0868a120c759279e14a8fff5bba26ac4e1c9f202e124fe83baee060309d3144da9be96057ddf9451995725b3a8c04d3afa4876ec8a540ce9
    var method_str = "POST"
    var path_ = "/api/v4/futures/usdt/orders"
    var query = ""
    var payload = '{"contract":"BTC_USDT","size":1,"price":"93000","tif":"gtc"}'
    var ts = 1735736524
    var sign = "8c759c5cb2ae052e0868a120c759279e14a8fff5bba26ac4e1c9f202e124fe83baee060309d3144da9be96057ddf9451995725b3a8c04d3afa4876ec8a540ce9"
    var trading_context = TradingContext(
        exchange_id="gate", account_id="1", trader_id="1"
    )
    var api_key = "54f938b79e12aa343242ba1d940196c5"
    var api_secret = "3a98ab4e74b5a02acd5156184bf0e5ace7df76f5bafaa02ff3aedc4c22452bfe"
    var testnet = True
    var config = Dict[String, Any]()
    config["api_key"] = api_key
    config["api_secret"] = api_secret
    config["testnet"] = testnet
    var gate = Gate(config, trading_context)
    var sign_result = gate._sign_payload(
        method_str, path_, query, payload, str(ts)
    )
    assert_equal(sign_result, sign)


fn test_hmac_sha512_hex() raises:
    var api_secret = "3a98ab4e74b5a02acd5156184bf0e5ace7df76f5bafaa02ff3aedc4c22452bfe"
    # var message = "POST\n/api/v4/futures/usdt/orders\n\n\n1735736524"
    var method = "POST"
    var path = "/api/v4/futures/usdt/orders"
    var param_string = ""
    var payload = '{"contract":"BTC_USDT","size":1,"price":"93000","tif":"gtc"}'
    var ts = "1735736524"
    var body_hash = compute_sha512_hex(payload)
    assert_equal(
        body_hash,
        "ebbb6f62d82678d0117d653ca7d4a01c22ecae3c2ea1f8739c9a9e619c5c520aabfd5981d3a2c337f636dd06e077a230967f36759855b20db7fd9e21857a7bd9",
    )
    var s = String.write(
        method, "\n", path, "\n", param_string, "\n", body_hash, "\n", ts
    )
    var sign = compute_hmac_sha512_hex(s, api_secret)
    assert_equal(
        sign,
        "8c759c5cb2ae052e0868a120c759279e14a8fff5bba26ac4e1c9f202e124fe83baee060309d3144da9be96057ddf9451995725b3a8c04d3afa4876ec8a540ce9",
    )


fn test_compute_hmac_sha512_hex() raises:
    var api_secret = "3a98ab4e74b5a02acd5156184bf0e5ace7df76f5bafaa02ff3aedc4c22452bfe"
    # var message = "POST\n/api/v4/futures/usdt/orders\n\n\n1735736524"
    var method = "POST"
    var path = "/api/v4/futures/usdt/orders"
    var param_string = ""
    var payload = '{"contract":"BTC_USDT","size":1,"price":"93000","tif":"gtc"}'
    var ts = "1735736524"
    var body_hash = compute_sha512_hex(payload)
    assert_equal(
        body_hash,
        "ebbb6f62d82678d0117d653ca7d4a01c22ecae3c2ea1f8739c9a9e619c5c520aabfd5981d3a2c337f636dd06e077a230967f36759855b20db7fd9e21857a7bd9",
    )
    var s = String.write(
        method, "\n", path, "\n", param_string, "\n", body_hash, "\n", ts
    )
    var sign = compute_hmac_sha512_hex(s, api_secret)
    assert_equal(
        sign,
        "8c759c5cb2ae052e0868a120c759279e14a8fff5bba26ac4e1c9f202e124fe83baee060309d3144da9be96057ddf9451995725b3a8c04d3afa4876ec8a540ce9",
    )


fn test_subscribe_order() raises:
    var symbol = "BTC_USDT"
    var name = String.format("{}.orders", "futures")
    var p = JsonValue.from_str("[]")
    var pv = JsonValueArrayView(p)
    pv.push_str("1")
    pv.push_str(symbol)
    assert_equal(str(p), '["1","BTC_USDT"]')

from time import perf_counter_ns
from sonic import *
from sonic.internal.jvalue import *
from sonic.internal.jobject import *
from sonic.internal.jvalueref import *
from sonic.internal.jobjectmut import *
from testing import assert_equal, assert_true


fn test_sonic_rs_internal_sample() raises:
    var s = '{"a":100}'
    var v = jvalue_from_str(s)

    var o = v.bitcast[JObject]()
    jobject_insert_i64(o, "b", 101)
    jobject_insert_str(o, "c", "hello")
    var a = jvalue_from_str("[1,2,3]")
    jobject_insert_value(o, "d", a)

    var out = diplomat_buffer_write_create(1024)
    _ = jvalue_to_string(v, out)
    var s_data = diplomat_buffer_write_get_bytes(out)
    var s_len = diplomat_buffer_write_len(out)
    var ret_str_ref = StringRef(s_data, s_len)
    var ret_str = String(ret_str_ref)
    diplomat_buffer_write_destroy(out)
    jvalue_destroy(v)
    jvalue_destroy(a)

    _ = ret_str^


fn test_object() raises:
    var o = JsonObject('{"xxx": 1000}')
    var a = jobject_get_u64(o._object, "xxx")
    assert_equal(a.is_ok, True)
    assert_equal(a.ok, 1000)
    var b = jobject_get_i64(o._object, "xxx1")
    assert_equal(b.is_ok, False)


fn test_object_insert() raises:
    var o2 = JsonObject('{"a":"abc"}')
    o2.insert_str("b", "def")
    o2.insert_i64("c", 100)

    var v3 = o2.get_str("b")
    assert_equal(v3, "def")

    assert_equal(o2.to_string(), '{"a":"abc","b":"def","c":100}')


fn test_object_get() raises:
    var v4 = JsonObject('{"a":100, "b":true, "c": "hello", "f": 100.123}')
    assert_equal(v4.to_string(), '{"a":100,"b":true,"c":"hello","f":100.123}')

    var v5 = v4.get_i64("a")
    assert_equal(v5, 100)
    var v51 = v4.get_u64("a")
    assert_equal(v51, 100)
    var v6 = v4.get_bool("b")
    assert_equal(v6, True)
    var v7 = v4.get_str("c")
    assert_equal(v7, "hello")
    var v8 = v4.get_f64("f")
    assert_equal(v8, 100.123)


fn test_valueref() raises:
    var str = '{"a":100, "b":true, "c": "hello", "f": 100.123}'
    var v = JsonValue.from_str(str)
    var type_ = v.get_type()
    assert_true(type_ == JsonType.JsonType_Object)

    var a_ref = jobject_get_value_ref(v._value.bitcast[JObject](), "a")
    var b_ref = jobject_get_value_ref(v._value.bitcast[JObject](), "b")
    var c_ref = jobject_get_value_ref(v._value.bitcast[JObject](), "c")
    var f_ref = jobject_get_value_ref(v._value.bitcast[JObject](), "f")
    var a = jvalueref_as_u64(a_ref)
    var b = jvalueref_as_bool(b_ref)
    var out = diplomat_buffer_write_create(1024)
    jvalueref_as_str(c_ref, "", out)
    var s_data = diplomat_buffer_write_get_bytes(out)
    var s_len = diplomat_buffer_write_len(out)
    var ret_str_ref = StringRef(s_data, s_len)
    var c = String(ret_str_ref)
    diplomat_buffer_write_destroy(out)
    var f = jvalueref_as_f64(f_ref)

    assert_equal(a.is_ok, True)
    assert_equal(a.ok, 100)
    assert_equal(b.is_ok, True)
    assert_equal(b.ok, True)
    assert_equal(c, "hello")
    assert_equal(f.is_ok, True)
    assert_equal(f.ok, 100.123)

    jvalueref_destroy(a_ref)
    jvalueref_destroy(b_ref)
    jvalueref_destroy(c_ref)
    jvalueref_destroy(f_ref)


fn test_read_json() raises:
    var o = JsonObject(
        '{"i64": 1000, "u64": 1000000000000000000, "b": true, "s": "Hi", "obj":'
        ' {"a": 100, "s": "hello"}, "arr": [1,2,3], "s_arr": ["a", "b", "c"],'
        ' "null": null}'
    )
    var i64 = o.get_i64("i64")
    assert_equal(i64, 1000)
    var u64 = o.get_u64("u64")
    assert_equal(u64, 1000000000000000000)
    var b = o.get_bool("b")
    assert_equal(b, True)
    var s = o.get_str("s")
    assert_equal(s, "Hi")

    var obj = o.get_object_mut("obj")
    var obj_a = obj.get_i64("a")
    assert_equal(obj_a, 100)
    var obj_s = obj.get_str("s")
    assert_equal(obj_s, "hello")

    var arr = o.get_array_mut("arr")
    var arr_0 = arr.get_i64(0)
    assert_equal(arr_0, 1)
    var arr_1 = arr.get_i64(1)
    assert_equal(arr_1, 2)
    var arr_2 = arr.get_i64(2)
    assert_equal(arr_2, 3)

    var s_arr = o.get_array_mut("s_arr")
    var s_arr_len = s_arr.len()
    assert_equal(s_arr_len, 3)
    var s_arr_0 = s_arr.get_str(0)
    assert_equal(s_arr_0, "a")
    var s_arr_1 = s_arr.get_str(1)
    assert_equal(s_arr_1, "b")
    var s_arr_2 = s_arr.get_str(2)
    assert_equal(s_arr_2, "c")
    var s_arr_3 = s_arr.get_str(3)
    assert_equal(s_arr_3, "")
    var s_arr_4 = s_arr.get_str(4, "default")
    assert_equal(s_arr_4, "default")

    var null = o.get_value("null")
    assert_equal(null.is_null(), True)

    var i64_2 = o.get_value("i64")
    assert_equal(i64_2.is_null(), False)


# Deep JSON structure
fn test_deep_json() raises:
    var o = JsonObject('{"a": {"b": {"c": 100}}}')
    var a = o.get_object_mut("a")
    var b = a.get_object_mut("b")
    var c = b.get_i64("c")
    assert_equal(c, 100)
    _ = b^
    _ = a^
    _ = o^


# Write JSON
fn test_write_json() raises:
    var o = JsonObject('{"a": {"b": {"c": 100}}}')
    var a = o.get_object_mut("a")
    var b = a.get_object_mut("b")
    var c = b.get_i64("c")
    assert_equal(c, 100)
    o.insert_i64("d", 101)
    var a_2 = o.get_object_mut("a")
    assert_equal(a_2.to_string(), '{"b":{"c":100}}')
    assert_equal(o.to_string(), '{"a":{"b":{"c":100}},"d":101}')


# Write array
fn test_write_array() raises:
    var o = JsonObject('{"a": [1,2,3]}')
    var a = o.get_array_mut("a")
    var v = JsonValue(100)
    a.insert(0, v)
    assert_equal(o.to_string(), '{"a":[100,1,2,3]}')


fn test_object_iterator_ref() raises:
    var body = String(
        '{"retCode":0,"retMsg":"OK","result":{"category":"linear","list":[{"symbol":"BTCUSDT","contractType":"LinearPerpetual","status":"Trading","baseCoin":"BTC","quoteCoin":"USDT","launchTime":"1585526400000","deliveryTime":"0","deliveryFeeRate":"","priceScale":"2","leverageFilter":{"minLeverage":"1","maxLeverage":"100.00","leverageStep":"0.01"},"priceFilter":{"minPrice":"0.10","maxPrice":"199999.80","tickSize":"0.10"},"lotSizeFilter":{"maxOrderQty":"100.000","minOrderQty":"0.001","qtyStep":"0.001","postOnlyMaxOrderQty":"1000.000"},"unifiedMarginTrade":true,"fundingInterval":480,"settleCoin":"USDT","copyTrading":"normalOnly"}],"nextPageCursor":""},"retExtInfo":{},"time":1696236288675}'
    )

    var doc = JsonObject(body)
    var ret_code = doc.get_i64("retCode")
    var ret_msg = doc.get_str("retMsg")
    if ret_code != 0:
        raise "error retCode=" + str(ret_code) + ", retMsg=" + ret_msg

    var result = doc.get_object_ref("result")
    var result_list = result.get_array_ref("list")

    if result_list.len() == 0:
        raise "error list length is 0"

    var list_iter = result_list.iter()
    while True:
        var value = list_iter.next()
        if value.is_null():
            break

        var obj = value.as_object_ref()

        var symbol_ = obj.get_str("symbol")

        var priceFilter = obj.get_object_ref("priceFilter")
        var tick_size = float(priceFilter.get_str("tickSize"))
        var lotSizeFilter = obj.get_object_ref("lotSizeFilter")
        var stepSize = float(lotSizeFilter.get_str("qtyStep"))

        assert_equal(symbol_, "BTCUSDT")
        assert_equal(tick_size, 0.1)
        assert_equal(stepSize, 0.001)


fn test_object_iterator_mut() raises:
    var body = String(
        '{"retCode":0,"retMsg":"OK","result":{"category":"linear","list":[{"symbol":"BTCUSDT","contractType":"LinearPerpetual","status":"Trading","baseCoin":"BTC","quoteCoin":"USDT","launchTime":"1585526400000","deliveryTime":"0","deliveryFeeRate":"","priceScale":"2","leverageFilter":{"minLeverage":"1","maxLeverage":"100.00","leverageStep":"0.01"},"priceFilter":{"minPrice":"0.10","maxPrice":"199999.80","tickSize":"0.10"},"lotSizeFilter":{"maxOrderQty":"100.000","minOrderQty":"0.001","qtyStep":"0.001","postOnlyMaxOrderQty":"1000.000"},"unifiedMarginTrade":true,"fundingInterval":480,"settleCoin":"USDT","copyTrading":"normalOnly"}],"nextPageCursor":""},"retExtInfo":{},"time":1696236288675}'
    )

    var doc = JsonObject(body)
    var ret_code = doc.get_i64("retCode")
    var ret_msg = doc.get_str("retMsg")
    if ret_code != 0:
        raise "error retCode=" + str(ret_code) + ", retMsg=" + ret_msg

    var result = doc.get_object_mut("result")
    var result_list = result.get_array_mut("list")

    if result_list.len() == 0:
        raise "error list length is 0"

    var list_iter = result_list.iter_mut()
    while True:
        var value = list_iter.next()
        if value.is_null():
            break

        var obj = value.as_object_mut()

        var symbol_ = obj.get_str("symbol")

        var priceFilter = obj.get_object_mut("priceFilter")
        var tick_size = float(priceFilter.get_str("tickSize"))
        var lotSizeFilter = obj.get_object_mut("lotSizeFilter")
        var stepSize = float(lotSizeFilter.get_str("qtyStep"))

        assert_equal(symbol_, "BTCUSDT")
        assert_equal(tick_size, 0.1)
        assert_equal(stepSize, 0.001)

    _ = result_list^
    _ = result^
    _ = doc^


fn test_ticker_performance() raises -> None:
    # {"e":"bookTicker","u":5778724155540,"s":"BTCUSDT","b":"88155.70","B":"1.149","a":"88155.80","A":"21.054","T":1731636077763,"E":1731636077763}
    # 解析出bid，ask，bidVolume，askVolume
    # {"e":"bookTicker","u":5778730150885,"s":"1000PEPEUSDT","b":"0.0212185","B":"57663","a":"0.0212186","A":"5914","T":1731636125351,"E":1731636125351}

    var s = '{"e":"bookTicker","u":5778724155540,"s":"BTCUSDT","b":"88155.70","B":"1.149","a":"88155.80","A":"21.054","T":1731636077763,"E":1731636077763}'
    var start = perf_counter_ns()
    var n = 5000000
    for i in range(n):
        var obj = JsonObject(s)
        var b = obj.get_str("b")
        var B = obj.get_str("B")
        var a = obj.get_str("a")
        var A = obj.get_str("A")
        # assert_equal(b, "88155.70")
        # assert_equal(B, "1.149")
        # assert_equal(a, "88155.80")
        # assert_equal(A, "21.054")
    var end = perf_counter_ns()
    print("ticker_performance get_str Time: ", (end - start) / n, "ns")


fn test_ticker_performance1() raises -> None:
    var s = '{"e":"bookTicker","u":5778724155540,"s":"BTCUSDT","b":"88155.70","B":"1.149","a":"88155.80","A":"21.054","T":1731636077763,"E":1731636077763}'
    var start = perf_counter_ns()
    var n = 5000000
    for i in range(n):
        var obj = JsonObject(s)
        var b_ref = obj.get_str_ref("b")
        var B_ref = obj.get_str_ref("B")
        var a_ref = obj.get_str_ref("a")
        var A_ref = obj.get_str_ref("A")
        # assert_equal(b_ref, "88155.70")
        # assert_equal(B_ref, "1.149")
        # assert_equal(a_ref, "88155.80")
        # assert_equal(A_ref, "21.054")
    var end = perf_counter_ns()
    print("ticker_performance1 get_str_ref Time: ", (end - start) / n, "ns")


fn test_ticker_performance2() raises -> None:
    var s = '{"e":"bookTicker","u":5778724155540,"s":"BTCUSDT","b":"88155.70","B":"1.149","a":"88155.80","A":"21.054","T":1731636077763,"E":1731636077763}'
    var start = perf_counter_ns()
    var n = 5000000
    for i in range(n):
        var obj = JsonObject(s)
    var end = perf_counter_ns()
    print("ticker_performance2 without get Time: ", (end - start) / n, "ns")


fn main() raises:
    test_ticker_performance()
    test_ticker_performance1()
    test_ticker_performance2()

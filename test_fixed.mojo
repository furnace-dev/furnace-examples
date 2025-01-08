from testing import assert_equal, assert_true
from ccxt.base.types import *
from monoio_connect import *


fn test_empty_string() raises:
    var p1 = Fixed("")
    assert_equal(str(p1), "0")


fn test_initialization() raises:
    var p1 = Fixed("123.456")
    assert_equal(str(p1), "123.456")

    var p2 = Fixed(123)
    assert_equal(str(p2), "123")


fn test_addition() raises:
    var p1 = Fixed("1.1")
    var p2 = Fixed("2.2")
    var result = p1 + p2
    assert_equal(str(result), "3.3")


fn test_subtraction() raises:
    var p1 = Fixed("5.5")
    var p2 = Fixed("2.2")
    var result = p1 - p2
    assert_equal(str(result), "3.3")


fn test_multiplication() raises:
    var p1 = Fixed("2.5")
    var p2 = Fixed("4.0")
    var result = p1 * p2
    assert_equal(str(result), "10")


fn test_division() raises:
    var p1 = Fixed("10.0")
    var p2 = Fixed("2.0")
    var result = p1 / p2
    assert_equal(str(p1), "10")
    assert_equal(str(p2), "2")
    assert_equal(str(result), "5")

    # 测试除后有小数
    var p3 = Fixed("10.0")
    var p4 = Fixed("3.0")
    assert_equal(str(p3 / p4), "3.333333333333")

    # 测试两个小数相除
    var p5 = Fixed("1.2")
    var p6 = Fixed("3.6")
    assert_equal(str(p5 / p6), "0.333333333333")


fn test_modulus() raises:
    var p1 = Fixed("5.5")
    var p2 = Fixed("2.0")
    # TODO: 添加对取模的支持
    # var result = p1 % p2
    # assert_equal(str(result), "1.5")


fn test_negation() raises:
    var p1 = Fixed("3.5")
    var result = -p1
    assert_equal(str(result), "-3.5")


fn test_absolute() raises:
    var p1 = Fixed("-3.5")
    var result = abs(p1)
    assert_equal(str(result), "3.5")


fn test_comparisons() raises:
    var p1 = Fixed("1.0")
    var p2 = Fixed("2.0")
    assert_true(p1 < p2)
    assert_true(p2 > p1)
    assert_true(p1 <= p1)
    assert_true(p1 >= p1)
    assert_true(p1 != p2)


fn test_string_operations() raises:
    assert_true(Fixed("1.1") + Fixed("2.2") == Fixed("3.3"))
    assert_true(Fixed("5.5") - Fixed("2.2") == Fixed("3.3"))
    assert_true(Fixed("2.5") * Fixed("4.0") == Fixed("10.0"))
    assert_true(Fixed("10.0") / Fixed("20.0") == Fixed("0.5"))
    var result = Fixed("10.0") / Fixed("2.0")
    assert_equal(str(result), "5")


fn test_edge_cases() raises:
    var p1 = Fixed("0.0")
    var p2 = Fixed("0.0")
    assert_equal(str(p1 + p2), "0")
    assert_equal(str(p1 - p2), "0")
    assert_equal(str(p1 * p2), "0")
    # with assert_raises(contains="Integer Division by zero."):
    #     var result = Fixed("10.0") / Fixed("0.0")
    #     assert_equal(str(result), "0")


fn test_precise_string_conversion() raises:
    var p1 = Fixed("1")
    var p2 = Fixed(1)
    assert_equal(str(p1), str(p2))


# 测试范围，最大: 999999.999999999999
fn test_max() raises:
    var p1 = Fixed("999999.999999999999")
    assert_equal(str(p1), "999999.999999999999")
    var p2 = Fixed("111111.111111111111")
    var p3 = p1 - p2
    assert_equal(str(p3), "888888.888888888888")
    var p4 = Fixed(3)
    var p5 = p4 * p2
    assert_equal(str(p5), "333333.333333333333")

    var p6 = p5.to_float()
    assert_equal(p6, 333333.333333333333)

    var p7 = Fixed("-1.123456789012345678")
    assert_equal(str(p7), "-1.123456789012")

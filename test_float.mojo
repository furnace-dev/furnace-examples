from testing import assert_equal


fn test_float() raises:
    var f = 1.1
    var i = Int(f)
    assert_equal(f, 1.1)
    assert_equal(i, 1)

    var f2 = 1.0
    assert_equal(float(Int(f2)), f2)

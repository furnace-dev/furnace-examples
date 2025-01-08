from python import Python
from sys.ffi import OpaquePointer
from memory import UnsafePointer
from testing import assert_equal


fn test_numpy() raises:
    # 这相当于Python中的`import numpy as np`
    # var np = Python.import_module("numpy")

    # # 现在可以像在Python中编写一样使用numpy
    # var array = np.array([1, 2, 3])
    # print(array)
    pass


fn test_pointer_cast() raises:
    var a = 100
    var p = UnsafePointer[Int].address_of(a)
    # var ptr = int(p)
    var p1 = OpaquePointer()
    p1 = p.bitcast[NoneType]()
    var p2 = p1.bitcast[Int]()

    assert_equal(p2[], 100)


struct A:
    var a: Int
    var b: Int

    fn __init__(out self, a: Int, b: Int):
        self.a = a
        self.b = b

    fn __del__(owned self):
        print("del")

    fn print(self):
        print(self.a, self.b)


fn test_struct() raises:
    var a = A(100, 5)
    a.print()

    var a_ptr = UnsafePointer[A].address_of(a)
    var a_ptr_int = int(a_ptr)
    print(a_ptr_int)

    var a_ptr_int_ptr = OpaquePointer()
    a_ptr_int_ptr = a_ptr.bitcast[NoneType]()
    var a_ptr_int_ptr_int = int(a_ptr_int_ptr)
    assert_equal(a_ptr_int, a_ptr_int_ptr_int)

    var a_ptr_1 = a_ptr_int_ptr.bitcast[A]()
    assert_equal(a_ptr_1[].a, 100)
    assert_equal(a_ptr_1[].b, 5)

    a_ptr_1[].print()
    _ = a^


fn main() raises:
    test_struct()

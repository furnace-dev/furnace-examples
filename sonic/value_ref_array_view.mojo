from memory import UnsafePointer
from .internal import *
from .value_ref import JsonValueRef


struct JsonValueRefArrayView[origin: MutableOrigin, T: JsonRefContainerTrait](
    Stringable
):
    var _src: Pointer[T, origin]
    var _array: UnsafePointer[JArrayRef]

    @always_inline
    fn __init__(out self, ref [origin]value: T):
        self._src = Pointer.address_of(value)
        self._array = value.as_jarray_pointer()

    @always_inline
    fn __init__(out self, value: Pointer[T, origin]):
        self._src = value
        self._array = value[].as_jarray_pointer()

    @always_inline
    fn __moveinit__(out self, owned other: JsonValueRefArrayView[origin, T]):
        self._src = other._src
        self._array = other._array

    @always_inline
    fn __del__(owned self):
        pass

    @always_inline
    fn len(self) -> Int:
        return jarrayref_len(self._array)

    @always_inline
    fn is_empty(self) -> Bool:
        return jarrayref_is_empty(self._array)

    @always_inline
    fn get(self, index: Int) -> JsonValueRef:
        return JsonValueRef(jarrayref_get(self._array, index))

    @always_inline
    fn get_bool(self, index: Int, default: Bool = False) -> Bool:
        var vref = jarrayref_get(self._array, index)
        var ret = jvalueref_as_bool(vref)
        jvalueref_destroy(vref)
        if ret.is_ok:
            return ret.ok
        else:
            return default

    @always_inline
    fn get_i64(self, index: Int, default: Int64 = 0) -> Int64:
        var vref = jarrayref_get(self._array, index)
        var ret = jvalueref_as_i64(vref)
        jvalueref_destroy(vref)
        if ret.is_ok:
            return ret.ok
        else:
            return default

    @always_inline
    fn get_u64(self, index: Int, default: UInt64 = 0) -> UInt64:
        var vref = jarrayref_get(self._array, index)
        var ret = jvalueref_as_u64(vref)
        jvalueref_destroy(vref)
        if ret.is_ok:
            return ret.ok
        else:
            return default

    @always_inline
    fn get_f64(self, index: Int, default: Float64 = 0.0) -> Float64:
        var vref = jarrayref_get(self._array, index)
        var ret = jvalueref_as_f64(vref)
        jvalueref_destroy(vref)
        if ret.is_ok:
            return ret.ok
        else:
            return default

    @always_inline
    fn get_str(self, index: Int, default: StringRef = "") -> String:
        var vref = jarrayref_get(self._array, index)
        var out = diplomat_buffer_write_create(1024)
        jvalueref_as_str(vref, default, out)
        var s_data = diplomat_buffer_write_get_bytes(out)
        var s_len = diplomat_buffer_write_len(out)
        var ret_str_ref = StringRef(s_data, s_len)
        var ret_str = String(ret_str_ref)
        diplomat_buffer_write_destroy(out)
        jvalueref_destroy(vref)
        return ret_str

    @always_inline
    fn get_str_ref(self, index: Int, default: StringRef = "") -> StringRef:
        var vref = jarrayref_get(self._array, index)
        var ret = jvalueref_as_str_ref(vref, default)
        jvalueref_destroy(vref)
        return ret

    @always_inline
    fn iter(self) -> UnsafePointer[JValueIter]:
        return jarrayref_iter(self._array)

    @always_inline
    fn to_string(self, cap: Int = 1024) -> String:
        var out = diplomat_buffer_write_create(cap)
        _ = jarrayref_to_string(self._array, out)
        var s_data = diplomat_buffer_write_get_bytes(out)
        var s_len = diplomat_buffer_write_len(out)
        var ret_str_ref = StringRef(s_data, s_len)
        var ret_str = String(ret_str_ref)
        diplomat_buffer_write_destroy(out)
        return ret_str

    @always_inline
    fn destroy(self) -> None:
        jarrayref_destroy(self._array)

    fn __str__(self) -> String:
        return self.to_string()

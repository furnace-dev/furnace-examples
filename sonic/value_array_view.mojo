from memory import UnsafePointer
from .internal import *
from .value_ref import JsonValueRef


struct JsonValueArrayView[origin: MutableOrigin, T: JsonContainerTrait](
    Stringable
):
    var _src: Pointer[T, origin]
    var _array: UnsafePointer[JArray]

    @always_inline
    fn __init__(out self, ref [origin]value: T):
        self._src = Pointer.address_of(value)
        self._array = value.as_jarray_pointer()

    @always_inline
    fn __init__(out self, value: Pointer[T, origin]):
        self._src = value
        self._array = value[].as_jarray_pointer()

    @always_inline
    fn __moveinit__(out self, owned other: JsonValueArrayView[origin, T]):
        self._src = other._src
        self._array = other._array

    @always_inline
    fn __del__(owned self):
        pass

    @always_inline
    fn push_null(self) -> None:
        jarray_push_null(self._array)

    @always_inline
    fn push_bool(self, value: Bool) -> None:
        jarray_push_bool(self._array, value)

    @always_inline
    fn push_i64(self, value: Int64) -> None:
        jarray_push_i64(self._array, value)

    @always_inline
    fn push_u64(self, value: UInt64) -> None:
        jarray_push_u64(self._array, value)

    @always_inline
    fn push_f64(self, value: Float64) -> None:
        jarray_push_f64(self._array, value)

    @always_inline
    fn push_str(self, value: String) -> None:
        var s_ref = StringRef(value.unsafe_cstr_ptr(), len(value))
        jarray_push_str(self._array, s_ref)

    @always_inline
    fn push_value(self, value: JsonValue) -> None:
        jarray_push_value(self._array, value._value)

    @always_inline
    fn push_object(self, value: JsonObject) -> None:
        jarray_push_object(self._array, value._object)

    @always_inline
    fn push_array(self, value: JsonArray) -> None:
        jarray_push_array(self._array, value._array)

    @always_inline
    fn insert(self, index: Int, value: JsonValue) -> None:
        jarray_insert(self._array, index, value._value)

    @always_inline
    fn pop(self) -> UnsafePointer[JValue]:
        return jarray_pop(self._array)

    @always_inline
    fn len(self) -> Int:
        return jarray_len(self._array)

    @always_inline
    fn is_empty(self) -> Bool:
        return jarray_is_empty(self._array)

    @always_inline
    fn clear(self) -> None:
        jarray_clear(self._array)

    @always_inline
    fn remove(self, index: Int) -> None:
        jarray_remove(self._array, index)

    @always_inline
    fn get(self, index: Int) -> JsonValueRef:
        return JsonValueRef(jarray_get(self._array, index))

    @always_inline
    fn get_bool(self, index: Int, default: Bool = False) -> Bool:
        var vref = jarray_get(self._array, index)
        var ret = jvalueref_as_bool(vref)
        jvalueref_destroy(vref)
        if ret.is_ok:
            return ret.ok
        else:
            return default

    @always_inline
    fn get_i64(self, index: Int, default: Int64 = 0) -> Int64:
        var vref = jarray_get(self._array, index)
        var ret = jvalueref_as_i64(vref)
        jvalueref_destroy(vref)
        if ret.is_ok:
            return ret.ok
        else:
            return default

    @always_inline
    fn get_u64(self, index: Int, default: UInt64 = 0) -> UInt64:
        var vref = jarray_get(self._array, index)
        var ret = jvalueref_as_u64(vref)
        jvalueref_destroy(vref)
        if ret.is_ok:
            return ret.ok
        else:
            return default

    @always_inline
    fn get_f64(self, index: Int, default: Float64 = 0.0) -> Float64:
        var vref = jarray_get(self._array, index)
        var ret = jvalueref_as_f64(vref)
        jvalueref_destroy(vref)
        if ret.is_ok:
            return ret.ok
        else:
            return default

    @always_inline
    fn get_str(self, index: Int, default: StringRef = "") -> String:
        var vref = jarray_get(self._array, index)
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
        var vref = jarray_get(self._array, index)
        var ret = jvalueref_as_str_ref(vref, default)
        jvalueref_destroy(vref)
        return ret

    @always_inline
    fn iter(self) -> UnsafePointer[JValueIter]:
        return jarray_iter(self._array)

    @always_inline
    fn to_string(self, cap: Int = 1024) -> String:
        var out = diplomat_buffer_write_create(cap)
        _ = jarray_to_string(self._array, out)
        var s_data = diplomat_buffer_write_get_bytes(out)
        var s_len = diplomat_buffer_write_len(out)
        var ret_str_ref = StringRef(s_data, s_len)
        var ret_str = String(ret_str_ref)
        diplomat_buffer_write_destroy(out)
        return ret_str

    @always_inline
    fn destroy(self) -> None:
        jarray_destroy(self._array)

    fn __str__(self) -> String:
        return self.to_string()

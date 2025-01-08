from memory import UnsafePointer
from .internal import *
from .value_ref import JsonValueRef
from .value_mut import JsonValueMut


struct JsonArrayMut(Stringable):
    var _array: UnsafePointer[JArrayMut]

    @always_inline
    fn __init__(out self, value: UnsafePointer[JArrayMut]):
        self._array = value

    @always_inline
    fn __moveinit__(out self, owned other: JsonArrayMut):
        self._array = other._array

    @always_inline
    fn clone(self) -> JsonArray:
        return JsonArray(jarraymut_clone(self._array))

    @always_inline
    fn __del__(owned self):
        jarraymut_destroy(self._array)

    @always_inline
    fn push_null(self) -> None:
        jarraymut_push_null(self._array)

    @always_inline
    fn push_bool(self, value: Bool) -> None:
        jarraymut_push_bool(self._array, value)

    @always_inline
    fn push_i64(self, value: Int64) -> None:
        jarraymut_push_i64(self._array, value)

    @always_inline
    fn push_u64(self, value: UInt64) -> None:
        jarraymut_push_u64(self._array, value)

    @always_inline
    fn push_f64(self, value: Float64) -> None:
        jarraymut_push_f64(self._array, value)

    @always_inline
    fn push_str(self, value: String) -> None:
        var s_ref = StringRef(value.unsafe_cstr_ptr(), len(value))
        jarraymut_push_str(self._array, s_ref)

    @always_inline
    fn push_value(self, value: JsonValue) -> None:
        jarraymut_push_value(self._array, value._value)

    @always_inline
    fn push_object(self, value: JsonObject) -> None:
        jarraymut_push_object(self._array, value._object)

    @always_inline
    fn push_array(self, value: JsonArray) -> None:
        jarraymut_push_array(self._array, value._array)

    @always_inline
    fn insert(self, index: Int, value: JsonValue) -> None:
        jarraymut_insert(self._array, index, value._value)

    @always_inline
    fn pop(self) -> JsonValue:
        return JsonValue(jarraymut_pop(self._array))

    @always_inline
    fn len(self) -> Int:
        return jarraymut_len(self._array)

    @always_inline
    fn is_empty(self) -> Bool:
        return jarraymut_is_empty(self._array)

    @always_inline
    fn clear(self) -> None:
        jarraymut_clear(self._array)

    @always_inline
    fn remove(self, index: Int) -> None:
        jarraymut_remove(self._array, index)

    @always_inline
    fn get(self, index: Int) -> JsonValueRef:
        return JsonValueRef(jarraymut_get(self._array, index))

    @always_inline
    fn get_bool(self, index: Int, default: Bool = False) -> Bool:
        var vref = jarraymut_get(self._array, index)
        var ret = jvalueref_as_bool(vref)
        jvalueref_destroy(vref)
        if ret.is_ok:
            return ret.ok
        else:
            return default

    @always_inline
    fn get_i64(self, index: Int, default: Int64 = 0) -> Int64:
        var vref = jarraymut_get(self._array, index)
        var ret = jvalueref_as_i64(vref)
        jvalueref_destroy(vref)
        if ret.is_ok:
            return ret.ok
        else:
            return default

    @always_inline
    fn get_u64(self, index: Int, default: UInt64 = 0) -> UInt64:
        var vref = jarraymut_get(self._array, index)
        var ret = jvalueref_as_u64(vref)
        jvalueref_destroy(vref)
        if ret.is_ok:
            return ret.ok
        else:
            return default

    @always_inline
    fn get_f64(self, index: Int, default: Float64 = 0.0) -> Float64:
        var vref = jarraymut_get(self._array, index)
        var ret = jvalueref_as_f64(vref)
        jvalueref_destroy(vref)
        if ret.is_ok:
            return ret.ok
        else:
            return default

    @always_inline
    fn get_str(self, index: Int, default: StringRef = "") -> String:
        var vref = jarraymut_get(self._array, index)
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
        var vref = jarraymut_get(self._array, index)
        var ret = jvalueref_as_str_ref(vref, default)
        jvalueref_destroy(vref)
        return ret

    @always_inline
    fn iter(self) -> ValueIter:
        return ValueIter(jarraymut_iter(self._array))

    fn iter_mut(self) -> ValueIterMut:
        return ValueIterMut(jarraymut_iter_mut(self._array))

    @always_inline
    fn to_string(self, cap: Int = 1024) -> String:
        var out = diplomat_buffer_write_create(cap)
        _ = jarraymut_to_string(self._array, out)
        var s_data = diplomat_buffer_write_get_bytes(out)
        var s_len = diplomat_buffer_write_len(out)
        var ret_str_ref = StringRef(s_data, s_len)
        var ret_str = String(ret_str_ref)
        diplomat_buffer_write_destroy(out)
        return ret_str

    @always_inline
    fn destroy(self) -> None:
        jarraymut_destroy(self._array)

    fn __str__(self) -> String:
        return self.to_string()

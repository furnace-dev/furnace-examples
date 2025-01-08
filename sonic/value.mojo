from memory import UnsafePointer
from .internal import *


trait JsonContainerTrait:
    fn as_jobject_pointer(self) -> UnsafePointer[JObject]:
        pass

    fn as_jarray_pointer(self) -> UnsafePointer[JArray]:
        pass


struct JsonValue(JsonContainerTrait, Stringable):
    var _value: UnsafePointer[JValue]

    @always_inline
    fn __init__(out self, v: UnsafePointer[JValue]):
        self._value = v

    @always_inline
    fn __init__(out self):
        self._value = jvalue_new()

    @always_inline
    fn __init__(out self, b: Bool):
        self._value = jvalue_new_bool(b)

    @always_inline
    fn __init__(out self, i64: Int):
        self._value = jvalue_new_i64(i64)

    @always_inline
    fn __init__(out self, i64: Int64):
        self._value = jvalue_new_i64(i64)

    @always_inline
    fn __init__(out self, u64: UInt64):
        self._value = jvalue_new_u64(u64)

    @always_inline
    fn __init__(out self, f64: Float64):
        self._value = jvalue_new_f64(f64)

    @always_inline
    fn __init__(out self, s: String):
        var s_view = StringRef(s.unsafe_cstr_ptr(), len(s))
        self._value = jvalue_new_str(s_view)

    @always_inline
    fn __copyinit__(out self, other: JsonValue):
        self._value = jvalue_clone(other._value)

    @always_inline
    fn __moveinit__(out self, owned other: JsonValue):
        self._value = other._value

    @staticmethod
    fn from_str(s: String) -> JsonValue:
        var s_view = StringRef(s.unsafe_cstr_ptr(), len(s))
        return JsonValue(jvalue_from_str(s_view))

    @always_inline
    fn __del__(owned self):
        jvalue_destroy(self._value)

    @always_inline
    fn as_jobject_pointer(self) -> UnsafePointer[JObject]:
        return self._value.bitcast[JObject]()

    @always_inline
    fn as_jarray_pointer(self) -> UnsafePointer[JArray]:
        return self._value.bitcast[JArray]()

    # @always_inline
    # fn mark_root(self) -> None:
    #     return jvalue_mark_root(self._value)

    @always_inline
    fn get_type(self) -> JsonType:
        return jvalue_get_type(self._value)

    @always_inline
    fn is_null(self) -> Bool:
        return self.get_type() == JsonType.JsonType_Null

    @always_inline
    fn is_bool(self) -> Bool:
        return self.get_type() == JsonType.JsonType_Boolean

    @always_inline
    fn is_true(self) -> Bool:
        return jvalue_is_true(self._value)

    @always_inline
    fn is_false(self) -> Bool:
        return not self.is_true()

    @always_inline
    fn is_i64(self) -> Bool:
        return jvalue_is_i64(self._value)

    @always_inline
    fn is_u64(self) -> Bool:
        return jvalue_is_u64(self._value)

    @always_inline
    fn is_f64(self) -> Bool:
        return jvalue_is_f64(self._value)

    @always_inline
    fn is_str(self) -> Bool:
        return jvalue_is_str(self._value)

    @always_inline
    fn is_object(self) -> Bool:
        return jvalue_is_object(self._value)

    @always_inline
    fn is_array(self) -> Bool:
        return jvalue_is_array(self._value)

    @always_inline
    fn as_bool(self, default: Bool = False) -> Bool:
        var ret = jvalue_as_bool(self._value)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn as_i64(self, default: Int64 = 0) -> Int64:
        var ret = jvalue_as_i64(self._value)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn as_u64(self, default: UInt64 = 0) -> UInt64:
        var ret = jvalue_as_u64(self._value)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn as_f64(self, default: Float64 = 0.0) -> Float64:
        var ret = jvalue_as_f64(self._value)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn as_str(self, default: String = "") -> String:
        var default_sref = StringRef(default.unsafe_cstr_ptr(), len(default))
        var out = diplomat_buffer_write_create(1024)
        jvalue_as_str(self._value, default_sref, out)
        var s_data = diplomat_buffer_write_get_bytes(out)
        var s_len = diplomat_buffer_write_len(out)
        var s = String(StringRef(s_data, s_len))
        diplomat_buffer_write_destroy(out)
        return s

    @always_inline
    fn to_string(self, cap: Int = 1024) -> String:
        var out = diplomat_buffer_write_create(cap)
        _ = jvalue_to_string(self._value, out)
        var s_data = diplomat_buffer_write_get_bytes(out)
        var s_len = diplomat_buffer_write_len(out)
        var s_ref = StringRef(s_data, s_len)
        var s = String(s_ref)
        diplomat_buffer_write_destroy(out)
        return s

    fn __str__(self) -> String:
        return self.to_string()


struct ValueIter:
    var _iter: UnsafePointer[JValueIter]

    @always_inline
    fn __init__(out self, value: UnsafePointer[JValueIter]):
        self._iter = value

    fn __del__(owned self):
        jvalueiter_destroy(self._iter)

    fn len(self) -> Int:
        return jvalueiter_len(self._iter)

    fn next(self) -> JsonValueRef:
        return JsonValueRef(jvalueiter_next(self._iter))


struct ValueIterMut:
    var _iter: UnsafePointer[JValueIterMut]

    @always_inline
    fn __init__(out self, value: UnsafePointer[JValueIterMut]):
        self._iter = value

    fn __del__(owned self):
        jvalueitermut_destroy(self._iter)

    fn len(self) -> Int:
        return jvalueitermut_len(self._iter)

    fn next(self) -> JsonValueMut:
        return JsonValueMut(jvalueitermut_next(self._iter))

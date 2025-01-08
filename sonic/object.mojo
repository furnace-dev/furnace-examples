from memory import UnsafePointer
from .internal import *
from .object_ref import *


@always_inline
fn convert_jvalue_to_string(self: UnsafePointer[JValueRef]) -> String:
    var out = diplomat_buffer_write_create(1024)
    jvalueref_to_string(self, out)
    var s_data = diplomat_buffer_write_get_bytes(out)
    var s_len = diplomat_buffer_write_len(out)
    var ret_str_ref = StringRef(s_data, s_len)
    var ret_str = String(ret_str_ref)
    diplomat_buffer_write_destroy(out)
    return ret_str


struct JsonObject(JsonContainerTrait, Stringable):
    var _object: UnsafePointer[JObject]

    @always_inline
    fn __init__(out self):
        self._object = jobject_new()

    @always_inline
    fn __init__(out self, s: String):
        var s_ref = StringRef(s.unsafe_cstr_ptr(), len(s))
        var v = jvalue_from_str(s_ref)
        self._object = v.bitcast[JObject]()

    @always_inline
    fn __init__(out self, o: UnsafePointer[JObject]):
        self._object = o

    @always_inline
    fn __copyinit__(out self, other: JsonObject):
        self._object = jobject_clone(other._object)

    @always_inline
    fn __moveinit__(out self, owned other: JsonObject):
        self._object = other._object

    @always_inline
    fn __del__(owned self):
        jobject_destroy(self._object)

    @always_inline
    fn as_jobject_pointer(self) -> UnsafePointer[JObject]:
        return self._object

    @always_inline
    fn as_jarray_pointer(self) -> UnsafePointer[JArray]:
        return self._object.bitcast[JArray]()

    @always_inline
    fn to_string(self, cap: Int = 1024) -> String:
        var out = diplomat_buffer_write_create(cap)
        _ = jobject_to_string(self._object, out)
        var s_data = diplomat_buffer_write_get_bytes(out)
        var s_len = diplomat_buffer_write_len(out)
        var ret_str_ref = StringRef(s_data, s_len)
        var ret_str = String(ret_str_ref)
        diplomat_buffer_write_destroy(out)
        return ret_str

    @always_inline
    fn clear(self) -> None:
        return jobject_clear(self._object)

    @always_inline
    fn capacity(self) -> Int:
        return jobject_capacity(self._object)

    @always_inline
    fn contains_key(self, key: StringRef) -> Bool:
        return jobject_contains_key(self._object, key)

    @always_inline
    fn insert_null(self, key: StringRef) -> None:
        return jobject_insert_null(self._object, key)

    @always_inline
    fn insert_bool(self, key: StringRef, value: Bool) -> None:
        return jobject_insert_bool(self._object, key, value)

    @always_inline
    fn insert_i64(self, key: StringRef, value: c_int64) -> None:
        return jobject_insert_i64(self._object, key, value)

    @always_inline
    fn insert_u64(self, key: StringRef, value: c_uint64) -> None:
        return jobject_insert_u64(self._object, key, value)

    @always_inline
    fn insert_f64(self, key: StringRef, value: c_double) -> None:
        return jobject_insert_f64(self._object, key, value)

    @always_inline
    fn insert_str(self, key: StringRef, value: String) -> None:
        var value_ref = StringRef(value.unsafe_cstr_ptr(), len(value))
        return jobject_insert_str(self._object, key, value_ref)

    @always_inline
    fn insert_value(self, key: StringRef, value: JsonValue) -> None:
        return jobject_insert_value(self._object, key, value._value)

    @always_inline
    fn insert_array(self, key: StringRef, value: JsonArray) -> None:
        return jobject_insert_array(self._object, key, value._array)

    @always_inline
    fn insert_object(self, key: StringRef, value: JsonObject) -> None:
        return jobject_insert_object(self._object, key, value._object)

    @always_inline
    fn remove(self, key: StringRef) -> Bool:
        return jobject_remove(self._object, key)

    @always_inline
    fn len(self) -> Int:
        return jobject_len(self._object)

    @always_inline
    fn is_empty(self) -> Bool:
        return jobject_is_empty(self._object)

    @always_inline
    fn destroy(self) -> None:
        return jobject_destroy(self._object)

    @always_inline
    fn get_type(self) -> JsonType:
        return jvalue_get_type(self._object.bitcast[JValue]())

    @always_inline
    fn get_value(self, key: StringRef) -> JsonValue:
        return JsonValue(jobject_get_value(self._object, key))

    @always_inline
    fn get_bool(self, key: StringRef, default: Bool = False) -> Bool:
        var ret = jobject_get_bool(self._object, key)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn get_i64(self, key: StringRef, default: Int64 = 0) -> Int64:
        var ret = jobject_get_i64(self._object, key)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn get_u64(self, key: StringRef, default: UInt64 = 0) -> UInt64:
        var ret = jobject_get_u64(self._object, key)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn get_f64(self, key: StringRef, default: Float64 = 0.0) -> Float64:
        var ret = jobject_get_f64(self._object, key)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn get_str(self, key: StringRef, default: StringRef = "") -> String:
        var out = diplomat_buffer_write_create(1024)
        jobject_get_str(self._object, key, default, out)
        var s_data = diplomat_buffer_write_get_bytes(out)
        var s_len = diplomat_buffer_write_len(out)
        var ret_str_ref = StringRef(s_data, s_len)
        var ret_str = String(ret_str_ref)
        diplomat_buffer_write_destroy(out)
        return ret_str

    @always_inline
    fn get_str_ref(self, key: StringRef, default: StringRef = "") -> StringRef:
        return jobject_get_str_ref(self._object, key, default)

    @always_inline
    fn get_object_ref(self, key: StringRef) -> JsonObjectRef:
        var ret = jobject_get_object_ref(self._object, key)
        return JsonObjectRef(ret)

    @always_inline
    fn get_object_mut(self, key: StringRef) -> JsonObjectMut:
        var ret = jobject_get_object_mut(self._object, key)
        return JsonObjectMut(ret)

    @always_inline
    fn get_array_mut(self, key: StringRef) -> JsonArrayMut:
        var ret = jobject_get_array_mut(self._object, key)
        return JsonArrayMut(ret)

    fn keys(self) -> List[String]:
        var iter = jobject_keys_iter(self._object)
        var len = jobject_len(self._object)
        var ret = List[String](capacity=len)
        var default = StringRef()
        for i in range(len):
            var out = diplomat_buffer_write_create(1024)
            jkeysiter_get(iter, i, default, out)
            var key = diplomat_buffer_write_get_bytes(out)
            var key_len = diplomat_buffer_write_len(out)
            var key_ref = StringRef(key, key_len)
            var key_str = String(key_ref)
            ret.append(key_str)
            diplomat_buffer_write_destroy(out)
        jkeysiter_destroy(iter)
        return ret

    fn iter(self) -> List[Tuple[String, JsonValueRef]]:
        var iter = jobject_iter(self._object)
        var ret = List[Tuple[String, JsonValueRef]]()
        while True:
            var kv = jobjectiter_next(iter)
            var out = diplomat_buffer_write_create(1024)
            jkeyvalueref_get_key(kv, out)
            var key = diplomat_buffer_write_get_bytes(out)
            var key_len = diplomat_buffer_write_len(out)
            var key_ref = StringRef(key, key_len)
            var key_str = String(key_ref)
            diplomat_buffer_write_destroy(out)
            if key_len == 0:
                jkeyvalueref_destroy(kv)
                break
            var value = jkeyvalueref_get_value(kv)
            # var value_str = convert_jvalue_to_string(value)
            # print("y", value_str)
            var value_obj = JsonValueRef(value)
            ret.append((key_str, value_obj))
            jkeyvalueref_destroy(kv)
        jobjectiter_destroy(iter)
        return ret

    fn __str__(self) -> String:
        return self.to_string()

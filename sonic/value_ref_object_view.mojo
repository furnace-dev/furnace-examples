from memory import UnsafePointer
from .internal import *
from .value import JsonValue, JsonContainerTrait
from .value_ref import JsonValueRef


struct JsonValueRefObjectView[origin: MutableOrigin, T: JsonRefContainerTrait](
    Stringable
):
    var _src: Pointer[T, origin]
    var _object: UnsafePointer[JObjectRef]

    @always_inline
    fn __init__(out self, ref [origin]value: T):
        self._src = Pointer.address_of(value)
        self._object = value.as_jobject_pointer()

    @always_inline
    fn __init__(out self, value: Pointer[T, origin]):
        self._src = value
        self._object = value[].as_jobject_pointer()

    @always_inline
    fn __moveinit__(out self, owned other: JsonValueRefObjectView[origin, T]):
        self._src = other._src
        self._object = other._object

    @always_inline
    fn __del__(owned self):
        pass

    @always_inline
    fn to_string(self, cap: Int = 1024) -> String:
        var out = diplomat_buffer_write_create(cap)
        _ = jobjectref_to_string(self._object, out)
        var s_data = diplomat_buffer_write_get_bytes(out)
        var s_len = diplomat_buffer_write_len(out)
        var ret_str_ref = StringRef(s_data, s_len)
        var ret_str = String(ret_str_ref)
        diplomat_buffer_write_destroy(out)
        return ret_str

    @always_inline
    fn capacity(self) -> Int:
        return jobjectref_capacity(self._object)

    @always_inline
    fn contains_key(self, key: StringRef) -> Bool:
        return jobjectref_contains_key(self._object, key)

    @always_inline
    fn len(self) -> Int:
        return jobjectref_len(self._object)

    @always_inline
    fn is_empty(self) -> Bool:
        return jobjectref_is_empty(self._object)

    @always_inline
    fn destroy(self) -> None:
        return jobjectref_destroy(self._object)

    @always_inline
    fn get_type(self) -> JsonType:
        return jvalue_get_type(self._object.bitcast[JValue]())

    @always_inline
    fn get_value(self, key: StringRef) -> JsonValue:
        return JsonValue(jobjectref_get_value(self._object, key))

    @always_inline
    fn get_bool(self, key: StringRef, default: Bool = False) -> Bool:
        var ret = jobjectref_get_bool(self._object, key)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn get_i64(self, key: StringRef, default: Int64 = 0) -> Int64:
        var ret = jobjectref_get_i64(self._object, key)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn get_u64(self, key: StringRef, default: UInt64 = 0) -> UInt64:
        var ret = jobjectref_get_u64(self._object, key)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn get_f64(self, key: StringRef, default: Float64 = 0.0) -> Float64:
        var ret = jobjectref_get_f64(self._object, key)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn get_str(self, key: StringRef, default: StringRef = "") -> String:
        var out = diplomat_buffer_write_create(1024)
        jobjectref_get_str(self._object, key, default, out)
        var s_data = diplomat_buffer_write_get_bytes(out)
        var s_len = diplomat_buffer_write_len(out)
        var ret_str_ref = StringRef(s_data, s_len)
        var ret_str = String(ret_str_ref)
        diplomat_buffer_write_destroy(out)
        return ret_str

    @always_inline
    fn get_str_ref(self, key: StringRef, default: StringRef = "") -> StringRef:
        return jobjectref_get_str_ref(self._object, key, default)

    fn keys(self) -> List[String]:
        var iter = jobjectref_keys_iter(self._object)
        var len = jobjectref_len(self._object)
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
        var iter = jobjectref_iter(self._object)
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
            var value_obj = JsonValueRef(value)
            ret.append((key_str, value_obj))
            jkeyvalueref_destroy(kv)
        jobjectiter_destroy(iter)
        return ret

    fn __str__(self) -> String:
        return self.to_string()

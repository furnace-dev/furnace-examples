
from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *

from .jarray_d import *
from .jarraymut_d import *
from .jarrayref_d import *
from .jkeysiter_d import *
from .jobjectiter_d import *
from .jobjectitermut_d import *
from .jobjectmut_d import *
from .jobjectref_d import *
from .jvalue_d import *
from .jvaluemut_d import *
from .jvalueref_d import *

from .jobject_d import *



alias fn_jobject_new = fn () -> UnsafePointer[JObject]

alias fn_jobject_with_capacity = fn (capacity: c_size_t) -> UnsafePointer[JObject]

alias fn_jobject_from_str = fn (s: DiplomatStringView) -> UnsafePointer[JObject]

alias fn_jobject_clone = fn (self: UnsafePointer[JObject]) -> UnsafePointer[JObject]

alias fn_jobject_to_string = fn (self: UnsafePointer[JObject], write: UnsafePointer[DiplomatWrite]) -> None

alias fn_jobject_clear = fn (self: UnsafePointer[JObject]) -> None

alias fn_jobject_capacity = fn (self: UnsafePointer[JObject]) -> c_size_t

alias fn_jobject_contains_key = fn (self: UnsafePointer[JObject], key: DiplomatStringView) -> c_bool

alias fn_jobject_insert_null = fn (self: UnsafePointer[JObject], key: DiplomatStringView) -> None

alias fn_jobject_insert_bool = fn (self: UnsafePointer[JObject], key: DiplomatStringView, value: c_bool) -> None

alias fn_jobject_insert_i64 = fn (self: UnsafePointer[JObject], key: DiplomatStringView, value: c_int64) -> None

alias fn_jobject_insert_u64 = fn (self: UnsafePointer[JObject], key: DiplomatStringView, value: c_uint64) -> None

alias fn_jobject_insert_f64 = fn (self: UnsafePointer[JObject], key: DiplomatStringView, value: c_double) -> None

alias fn_jobject_insert_str = fn (self: UnsafePointer[JObject], key: DiplomatStringView, value: DiplomatStringView) -> None

alias fn_jobject_insert_value = fn (self: UnsafePointer[JObject], key: DiplomatStringView, value: UnsafePointer[JValue]) -> None

alias fn_jobject_insert_object = fn (self: UnsafePointer[JObject], key: DiplomatStringView, value: UnsafePointer[JObject]) -> None

alias fn_jobject_insert_array = fn (self: UnsafePointer[JObject], key: DiplomatStringView, value: UnsafePointer[JArray]) -> None

alias fn_jobject_remove = fn (self: UnsafePointer[JObject], key: DiplomatStringView) -> c_bool

alias fn_jobject_len = fn (self: UnsafePointer[JObject]) -> c_size_t

alias fn_jobject_is_empty = fn (self: UnsafePointer[JObject]) -> c_bool

alias fn_jobject_get_value = fn (self: UnsafePointer[JObject], key: DiplomatStringView) -> UnsafePointer[JValue]

alias fn_jobject_get_value_ref = fn (self: UnsafePointer[JObject], key: DiplomatStringView) -> UnsafePointer[JValueRef]

alias fn_jobject_get_object_ref = fn (self: UnsafePointer[JObject], key: DiplomatStringView) -> UnsafePointer[JObjectRef]

alias fn_jobject_get_array_ref = fn (self: UnsafePointer[JObject], key: DiplomatStringView) -> UnsafePointer[JArrayRef]

alias fn_jobject_get_value_mut = fn (self: UnsafePointer[JObject], key: DiplomatStringView) -> UnsafePointer[JValueMut]

alias fn_jobject_get_object_mut = fn (self: UnsafePointer[JObject], key: DiplomatStringView) -> UnsafePointer[JObjectMut]

alias fn_jobject_get_array_mut = fn (self: UnsafePointer[JObject], key: DiplomatStringView) -> UnsafePointer[JArrayMut]

alias fn_jobject_get_bool = fn (self: UnsafePointer[JObject], key: DiplomatStringView) -> OptionBoolResult

alias fn_jobject_get_i64 = fn (self: UnsafePointer[JObject], key: DiplomatStringView) -> OptionI64Result

alias fn_jobject_get_u64 = fn (self: UnsafePointer[JObject], key: DiplomatStringView) -> OptionU64Result

alias fn_jobject_get_f64 = fn (self: UnsafePointer[JObject], key: DiplomatStringView) -> OptionF64Result

alias fn_jobject_get_str = fn (self: UnsafePointer[JObject], key: DiplomatStringView, default: DiplomatStringView, write: UnsafePointer[DiplomatWrite]) -> None

alias fn_jobject_get_str_ref = fn (self: UnsafePointer[JObject], key: DiplomatStringView, default: DiplomatStringView) -> DiplomatStringView

alias fn_jobject_keys_iter = fn (self: UnsafePointer[JObject]) -> UnsafePointer[JKeysIter]

alias fn_jobject_iter = fn (self: UnsafePointer[JObject]) -> UnsafePointer[JObjectIter]

alias fn_jobject_iter_mut = fn (self: UnsafePointer[JObject]) -> UnsafePointer[JObjectIterMut]

alias fn_jobject_destroy = fn (self: UnsafePointer[JObject]) -> None

var __wrapper = _DLWrapper()

@value
struct _DLWrapper:
    var _handle: DLHandle
    
    var _jobject_new: fn_jobject_new
    
    var _jobject_with_capacity: fn_jobject_with_capacity
    
    var _jobject_from_str: fn_jobject_from_str
    
    var _jobject_clone: fn_jobject_clone
    
    var _jobject_to_string: fn_jobject_to_string
    
    var _jobject_clear: fn_jobject_clear
    
    var _jobject_capacity: fn_jobject_capacity
    
    var _jobject_contains_key: fn_jobject_contains_key
    
    var _jobject_insert_null: fn_jobject_insert_null
    
    var _jobject_insert_bool: fn_jobject_insert_bool
    
    var _jobject_insert_i64: fn_jobject_insert_i64
    
    var _jobject_insert_u64: fn_jobject_insert_u64
    
    var _jobject_insert_f64: fn_jobject_insert_f64
    
    var _jobject_insert_str: fn_jobject_insert_str
    
    var _jobject_insert_value: fn_jobject_insert_value
    
    var _jobject_insert_object: fn_jobject_insert_object
    
    var _jobject_insert_array: fn_jobject_insert_array
    
    var _jobject_remove: fn_jobject_remove
    
    var _jobject_len: fn_jobject_len
    
    var _jobject_is_empty: fn_jobject_is_empty
    
    var _jobject_get_value: fn_jobject_get_value
    
    var _jobject_get_value_ref: fn_jobject_get_value_ref
    
    var _jobject_get_object_ref: fn_jobject_get_object_ref
    
    var _jobject_get_array_ref: fn_jobject_get_array_ref
    
    var _jobject_get_value_mut: fn_jobject_get_value_mut
    
    var _jobject_get_object_mut: fn_jobject_get_object_mut
    
    var _jobject_get_array_mut: fn_jobject_get_array_mut
    
    var _jobject_get_bool: fn_jobject_get_bool
    
    var _jobject_get_i64: fn_jobject_get_i64
    
    var _jobject_get_u64: fn_jobject_get_u64
    
    var _jobject_get_f64: fn_jobject_get_f64
    
    var _jobject_get_str: fn_jobject_get_str
    
    var _jobject_get_str_ref: fn_jobject_get_str_ref
    
    var _jobject_keys_iter: fn_jobject_keys_iter
    
    var _jobject_iter: fn_jobject_iter
    
    var _jobject_iter_mut: fn_jobject_iter_mut
    
    var _jobject_destroy: fn_jobject_destroy

    fn __init__(out self):
        self._handle = DLHandle(LIBNAME)
        
        self._jobject_new = self._handle.get_function[fn_jobject_new]("JObject_new")
        
        self._jobject_with_capacity = self._handle.get_function[fn_jobject_with_capacity]("JObject_with_capacity")
        
        self._jobject_from_str = self._handle.get_function[fn_jobject_from_str]("JObject_from_str")
        
        self._jobject_clone = self._handle.get_function[fn_jobject_clone]("JObject_clone")
        
        self._jobject_to_string = self._handle.get_function[fn_jobject_to_string]("JObject_to_string")
        
        self._jobject_clear = self._handle.get_function[fn_jobject_clear]("JObject_clear")
        
        self._jobject_capacity = self._handle.get_function[fn_jobject_capacity]("JObject_capacity")
        
        self._jobject_contains_key = self._handle.get_function[fn_jobject_contains_key]("JObject_contains_key")
        
        self._jobject_insert_null = self._handle.get_function[fn_jobject_insert_null]("JObject_insert_null")
        
        self._jobject_insert_bool = self._handle.get_function[fn_jobject_insert_bool]("JObject_insert_bool")
        
        self._jobject_insert_i64 = self._handle.get_function[fn_jobject_insert_i64]("JObject_insert_i64")
        
        self._jobject_insert_u64 = self._handle.get_function[fn_jobject_insert_u64]("JObject_insert_u64")
        
        self._jobject_insert_f64 = self._handle.get_function[fn_jobject_insert_f64]("JObject_insert_f64")
        
        self._jobject_insert_str = self._handle.get_function[fn_jobject_insert_str]("JObject_insert_str")
        
        self._jobject_insert_value = self._handle.get_function[fn_jobject_insert_value]("JObject_insert_value")
        
        self._jobject_insert_object = self._handle.get_function[fn_jobject_insert_object]("JObject_insert_object")
        
        self._jobject_insert_array = self._handle.get_function[fn_jobject_insert_array]("JObject_insert_array")
        
        self._jobject_remove = self._handle.get_function[fn_jobject_remove]("JObject_remove")
        
        self._jobject_len = self._handle.get_function[fn_jobject_len]("JObject_len")
        
        self._jobject_is_empty = self._handle.get_function[fn_jobject_is_empty]("JObject_is_empty")
        
        self._jobject_get_value = self._handle.get_function[fn_jobject_get_value]("JObject_get_value")
        
        self._jobject_get_value_ref = self._handle.get_function[fn_jobject_get_value_ref]("JObject_get_value_ref")
        
        self._jobject_get_object_ref = self._handle.get_function[fn_jobject_get_object_ref]("JObject_get_object_ref")
        
        self._jobject_get_array_ref = self._handle.get_function[fn_jobject_get_array_ref]("JObject_get_array_ref")
        
        self._jobject_get_value_mut = self._handle.get_function[fn_jobject_get_value_mut]("JObject_get_value_mut")
        
        self._jobject_get_object_mut = self._handle.get_function[fn_jobject_get_object_mut]("JObject_get_object_mut")
        
        self._jobject_get_array_mut = self._handle.get_function[fn_jobject_get_array_mut]("JObject_get_array_mut")
        
        self._jobject_get_bool = self._handle.get_function[fn_jobject_get_bool]("JObject_get_bool")
        
        self._jobject_get_i64 = self._handle.get_function[fn_jobject_get_i64]("JObject_get_i64")
        
        self._jobject_get_u64 = self._handle.get_function[fn_jobject_get_u64]("JObject_get_u64")
        
        self._jobject_get_f64 = self._handle.get_function[fn_jobject_get_f64]("JObject_get_f64")
        
        self._jobject_get_str = self._handle.get_function[fn_jobject_get_str]("JObject_get_str")
        
        self._jobject_get_str_ref = self._handle.get_function[fn_jobject_get_str_ref]("JObject_get_str_ref")
        
        self._jobject_keys_iter = self._handle.get_function[fn_jobject_keys_iter]("JObject_keys_iter")
        
        self._jobject_iter = self._handle.get_function[fn_jobject_iter]("JObject_iter")
        
        self._jobject_iter_mut = self._handle.get_function[fn_jobject_iter_mut]("JObject_iter_mut")
        
        self._jobject_destroy = self._handle.get_function[fn_jobject_destroy]("JObject_destroy")


@always_inline
fn jobject_new() -> UnsafePointer[JObject]:
    return __wrapper._jobject_new()

@always_inline
fn jobject_with_capacity(capacity: c_size_t) -> UnsafePointer[JObject]:
    return __wrapper._jobject_with_capacity(capacity)

@always_inline
fn jobject_from_str(s: DiplomatStringView) -> UnsafePointer[JObject]:
    return __wrapper._jobject_from_str(s)

@always_inline
fn jobject_clone(self: UnsafePointer[JObject]) -> UnsafePointer[JObject]:
    return __wrapper._jobject_clone(self)

@always_inline
fn jobject_to_string(self: UnsafePointer[JObject], write: UnsafePointer[DiplomatWrite]) -> None:
    return __wrapper._jobject_to_string(self, write)

@always_inline
fn jobject_clear(self: UnsafePointer[JObject]) -> None:
    return __wrapper._jobject_clear(self)

@always_inline
fn jobject_capacity(self: UnsafePointer[JObject]) -> c_size_t:
    return __wrapper._jobject_capacity(self)

@always_inline
fn jobject_contains_key(self: UnsafePointer[JObject], key: DiplomatStringView) -> c_bool:
    return __wrapper._jobject_contains_key(self, key)

@always_inline
fn jobject_insert_null(self: UnsafePointer[JObject], key: DiplomatStringView) -> None:
    return __wrapper._jobject_insert_null(self, key)

@always_inline
fn jobject_insert_bool(self: UnsafePointer[JObject], key: DiplomatStringView, value: c_bool) -> None:
    return __wrapper._jobject_insert_bool(self, key, value)

@always_inline
fn jobject_insert_i64(self: UnsafePointer[JObject], key: DiplomatStringView, value: c_int64) -> None:
    return __wrapper._jobject_insert_i64(self, key, value)

@always_inline
fn jobject_insert_u64(self: UnsafePointer[JObject], key: DiplomatStringView, value: c_uint64) -> None:
    return __wrapper._jobject_insert_u64(self, key, value)

@always_inline
fn jobject_insert_f64(self: UnsafePointer[JObject], key: DiplomatStringView, value: c_double) -> None:
    return __wrapper._jobject_insert_f64(self, key, value)

@always_inline
fn jobject_insert_str(self: UnsafePointer[JObject], key: DiplomatStringView, value: DiplomatStringView) -> None:
    return __wrapper._jobject_insert_str(self, key, value)

@always_inline
fn jobject_insert_value(self: UnsafePointer[JObject], key: DiplomatStringView, value: UnsafePointer[JValue]) -> None:
    return __wrapper._jobject_insert_value(self, key, value)

@always_inline
fn jobject_insert_object(self: UnsafePointer[JObject], key: DiplomatStringView, value: UnsafePointer[JObject]) -> None:
    return __wrapper._jobject_insert_object(self, key, value)

@always_inline
fn jobject_insert_array(self: UnsafePointer[JObject], key: DiplomatStringView, value: UnsafePointer[JArray]) -> None:
    return __wrapper._jobject_insert_array(self, key, value)

@always_inline
fn jobject_remove(self: UnsafePointer[JObject], key: DiplomatStringView) -> c_bool:
    return __wrapper._jobject_remove(self, key)

@always_inline
fn jobject_len(self: UnsafePointer[JObject]) -> c_size_t:
    return __wrapper._jobject_len(self)

@always_inline
fn jobject_is_empty(self: UnsafePointer[JObject]) -> c_bool:
    return __wrapper._jobject_is_empty(self)

@always_inline
fn jobject_get_value(self: UnsafePointer[JObject], key: DiplomatStringView) -> UnsafePointer[JValue]:
    return __wrapper._jobject_get_value(self, key)

@always_inline
fn jobject_get_value_ref(self: UnsafePointer[JObject], key: DiplomatStringView) -> UnsafePointer[JValueRef]:
    return __wrapper._jobject_get_value_ref(self, key)

@always_inline
fn jobject_get_object_ref(self: UnsafePointer[JObject], key: DiplomatStringView) -> UnsafePointer[JObjectRef]:
    return __wrapper._jobject_get_object_ref(self, key)

@always_inline
fn jobject_get_array_ref(self: UnsafePointer[JObject], key: DiplomatStringView) -> UnsafePointer[JArrayRef]:
    return __wrapper._jobject_get_array_ref(self, key)

@always_inline
fn jobject_get_value_mut(self: UnsafePointer[JObject], key: DiplomatStringView) -> UnsafePointer[JValueMut]:
    return __wrapper._jobject_get_value_mut(self, key)

@always_inline
fn jobject_get_object_mut(self: UnsafePointer[JObject], key: DiplomatStringView) -> UnsafePointer[JObjectMut]:
    return __wrapper._jobject_get_object_mut(self, key)

@always_inline
fn jobject_get_array_mut(self: UnsafePointer[JObject], key: DiplomatStringView) -> UnsafePointer[JArrayMut]:
    return __wrapper._jobject_get_array_mut(self, key)

@always_inline
fn jobject_get_bool(self: UnsafePointer[JObject], key: DiplomatStringView) -> OptionBoolResult:
    return __wrapper._jobject_get_bool(self, key)

@always_inline
fn jobject_get_i64(self: UnsafePointer[JObject], key: DiplomatStringView) -> OptionI64Result:
    return __wrapper._jobject_get_i64(self, key)

@always_inline
fn jobject_get_u64(self: UnsafePointer[JObject], key: DiplomatStringView) -> OptionU64Result:
    return __wrapper._jobject_get_u64(self, key)

@always_inline
fn jobject_get_f64(self: UnsafePointer[JObject], key: DiplomatStringView) -> OptionF64Result:
    return __wrapper._jobject_get_f64(self, key)

@always_inline
fn jobject_get_str(self: UnsafePointer[JObject], key: DiplomatStringView, default: DiplomatStringView, write: UnsafePointer[DiplomatWrite]) -> None:
    return __wrapper._jobject_get_str(self, key, default, write)

@always_inline
fn jobject_get_str_ref(self: UnsafePointer[JObject], key: DiplomatStringView, default: DiplomatStringView) -> DiplomatStringView:
    return __wrapper._jobject_get_str_ref(self, key, default)

@always_inline
fn jobject_keys_iter(self: UnsafePointer[JObject]) -> UnsafePointer[JKeysIter]:
    return __wrapper._jobject_keys_iter(self)

@always_inline
fn jobject_iter(self: UnsafePointer[JObject]) -> UnsafePointer[JObjectIter]:
    return __wrapper._jobject_iter(self)

@always_inline
fn jobject_iter_mut(self: UnsafePointer[JObject]) -> UnsafePointer[JObjectIterMut]:
    return __wrapper._jobject_iter_mut(self)

@always_inline
fn jobject_destroy(self: UnsafePointer[JObject]) -> None:
    return __wrapper._jobject_destroy(self)

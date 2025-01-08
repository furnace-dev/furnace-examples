
from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *

from .jarray_d import *
from .jarraymut_d import *
from .jkeysiter_d import *
from .jobject_d import *
from .jobjectiter_d import *
from .jvalue_d import *
from .jvaluemut_d import *
from .jvalueref_d import *

from .jobjectmut_d import *



alias fn_jobjectmut_clone = fn (self: UnsafePointer[JObjectMut]) -> UnsafePointer[JObject]

alias fn_jobjectmut_to_string = fn (self: UnsafePointer[JObjectMut], write: UnsafePointer[DiplomatWrite]) -> None

alias fn_jobjectmut_clear = fn (self: UnsafePointer[JObjectMut]) -> None

alias fn_jobjectmut_capacity = fn (self: UnsafePointer[JObjectMut]) -> c_size_t

alias fn_jobjectmut_contains_key = fn (self: UnsafePointer[JObjectMut], key: DiplomatStringView) -> c_bool

alias fn_jobjectmut_insert_null = fn (self: UnsafePointer[JObjectMut], key: DiplomatStringView) -> None

alias fn_jobjectmut_insert_bool = fn (self: UnsafePointer[JObjectMut], key: DiplomatStringView, value: c_bool) -> None

alias fn_jobjectmut_insert_i64 = fn (self: UnsafePointer[JObjectMut], key: DiplomatStringView, value: c_int64) -> None

alias fn_jobjectmut_insert_u64 = fn (self: UnsafePointer[JObjectMut], key: DiplomatStringView, value: c_uint64) -> None

alias fn_jobjectmut_insert_f64 = fn (self: UnsafePointer[JObjectMut], key: DiplomatStringView, value: c_double) -> None

alias fn_jobjectmut_insert_str = fn (self: UnsafePointer[JObjectMut], key: DiplomatStringView, value: DiplomatStringView) -> None

alias fn_jobjectmut_insert_value = fn (self: UnsafePointer[JObjectMut], key: DiplomatStringView, value: UnsafePointer[JValue]) -> None

alias fn_jobjectmut_insert_object = fn (self: UnsafePointer[JObjectMut], key: DiplomatStringView, value: UnsafePointer[JObject]) -> None

alias fn_jobjectmut_insert_array = fn (self: UnsafePointer[JObjectMut], key: DiplomatStringView, value: UnsafePointer[JArray]) -> None

alias fn_jobjectmut_remove = fn (self: UnsafePointer[JObjectMut], key: DiplomatStringView) -> c_bool

alias fn_jobjectmut_len = fn (self: UnsafePointer[JObjectMut]) -> c_size_t

alias fn_jobjectmut_is_empty = fn (self: UnsafePointer[JObjectMut]) -> c_bool

alias fn_jobjectmut_get_value = fn (self: UnsafePointer[JObjectMut], key: DiplomatStringView) -> UnsafePointer[JValue]

alias fn_jobjectmut_get_value_ref = fn (self: UnsafePointer[JObjectMut], key: DiplomatStringView) -> UnsafePointer[JValueRef]

alias fn_jobjectmut_get_value_mut = fn (self: UnsafePointer[JObjectMut], key: DiplomatStringView) -> UnsafePointer[JValueMut]

alias fn_jobjectmut_get_object_mut = fn (self: UnsafePointer[JObjectMut], key: DiplomatStringView) -> UnsafePointer[JObjectMut]

alias fn_jobjectmut_get_array_mut = fn (self: UnsafePointer[JObjectMut], key: DiplomatStringView) -> UnsafePointer[JArrayMut]

alias fn_jobjectmut_get_bool = fn (self: UnsafePointer[JObjectMut], key: DiplomatStringView) -> OptionBoolResult

alias fn_jobjectmut_get_i64 = fn (self: UnsafePointer[JObjectMut], key: DiplomatStringView) -> OptionI64Result

alias fn_jobjectmut_get_u64 = fn (self: UnsafePointer[JObjectMut], key: DiplomatStringView) -> OptionU64Result

alias fn_jobjectmut_get_f64 = fn (self: UnsafePointer[JObjectMut], key: DiplomatStringView) -> OptionF64Result

alias fn_jobjectmut_get_str = fn (self: UnsafePointer[JObjectMut], key: DiplomatStringView, default: DiplomatStringView, write: UnsafePointer[DiplomatWrite]) -> None

alias fn_jobjectmut_get_str_ref = fn (self: UnsafePointer[JObjectMut], key: DiplomatStringView, default: DiplomatStringView) -> DiplomatStringView

alias fn_jobjectmut_keys_iter = fn (self: UnsafePointer[JObjectMut]) -> UnsafePointer[JKeysIter]

alias fn_jobjectmut_iter = fn (self: UnsafePointer[JObjectMut]) -> UnsafePointer[JObjectIter]

alias fn_jobjectmut_destroy = fn (self: UnsafePointer[JObjectMut]) -> None

var __wrapper = _DLWrapper()

@value
struct _DLWrapper:
    var _handle: DLHandle
    
    var _jobjectmut_clone: fn_jobjectmut_clone
    
    var _jobjectmut_to_string: fn_jobjectmut_to_string
    
    var _jobjectmut_clear: fn_jobjectmut_clear
    
    var _jobjectmut_capacity: fn_jobjectmut_capacity
    
    var _jobjectmut_contains_key: fn_jobjectmut_contains_key
    
    var _jobjectmut_insert_null: fn_jobjectmut_insert_null
    
    var _jobjectmut_insert_bool: fn_jobjectmut_insert_bool
    
    var _jobjectmut_insert_i64: fn_jobjectmut_insert_i64
    
    var _jobjectmut_insert_u64: fn_jobjectmut_insert_u64
    
    var _jobjectmut_insert_f64: fn_jobjectmut_insert_f64
    
    var _jobjectmut_insert_str: fn_jobjectmut_insert_str
    
    var _jobjectmut_insert_value: fn_jobjectmut_insert_value
    
    var _jobjectmut_insert_object: fn_jobjectmut_insert_object
    
    var _jobjectmut_insert_array: fn_jobjectmut_insert_array
    
    var _jobjectmut_remove: fn_jobjectmut_remove
    
    var _jobjectmut_len: fn_jobjectmut_len
    
    var _jobjectmut_is_empty: fn_jobjectmut_is_empty
    
    var _jobjectmut_get_value: fn_jobjectmut_get_value
    
    var _jobjectmut_get_value_ref: fn_jobjectmut_get_value_ref
    
    var _jobjectmut_get_value_mut: fn_jobjectmut_get_value_mut
    
    var _jobjectmut_get_object_mut: fn_jobjectmut_get_object_mut
    
    var _jobjectmut_get_array_mut: fn_jobjectmut_get_array_mut
    
    var _jobjectmut_get_bool: fn_jobjectmut_get_bool
    
    var _jobjectmut_get_i64: fn_jobjectmut_get_i64
    
    var _jobjectmut_get_u64: fn_jobjectmut_get_u64
    
    var _jobjectmut_get_f64: fn_jobjectmut_get_f64
    
    var _jobjectmut_get_str: fn_jobjectmut_get_str
    
    var _jobjectmut_get_str_ref: fn_jobjectmut_get_str_ref
    
    var _jobjectmut_keys_iter: fn_jobjectmut_keys_iter
    
    var _jobjectmut_iter: fn_jobjectmut_iter
    
    var _jobjectmut_destroy: fn_jobjectmut_destroy

    fn __init__(out self):
        self._handle = DLHandle(LIBNAME)
        
        self._jobjectmut_clone = self._handle.get_function[fn_jobjectmut_clone]("JObjectMut_clone")
        
        self._jobjectmut_to_string = self._handle.get_function[fn_jobjectmut_to_string]("JObjectMut_to_string")
        
        self._jobjectmut_clear = self._handle.get_function[fn_jobjectmut_clear]("JObjectMut_clear")
        
        self._jobjectmut_capacity = self._handle.get_function[fn_jobjectmut_capacity]("JObjectMut_capacity")
        
        self._jobjectmut_contains_key = self._handle.get_function[fn_jobjectmut_contains_key]("JObjectMut_contains_key")
        
        self._jobjectmut_insert_null = self._handle.get_function[fn_jobjectmut_insert_null]("JObjectMut_insert_null")
        
        self._jobjectmut_insert_bool = self._handle.get_function[fn_jobjectmut_insert_bool]("JObjectMut_insert_bool")
        
        self._jobjectmut_insert_i64 = self._handle.get_function[fn_jobjectmut_insert_i64]("JObjectMut_insert_i64")
        
        self._jobjectmut_insert_u64 = self._handle.get_function[fn_jobjectmut_insert_u64]("JObjectMut_insert_u64")
        
        self._jobjectmut_insert_f64 = self._handle.get_function[fn_jobjectmut_insert_f64]("JObjectMut_insert_f64")
        
        self._jobjectmut_insert_str = self._handle.get_function[fn_jobjectmut_insert_str]("JObjectMut_insert_str")
        
        self._jobjectmut_insert_value = self._handle.get_function[fn_jobjectmut_insert_value]("JObjectMut_insert_value")
        
        self._jobjectmut_insert_object = self._handle.get_function[fn_jobjectmut_insert_object]("JObjectMut_insert_object")
        
        self._jobjectmut_insert_array = self._handle.get_function[fn_jobjectmut_insert_array]("JObjectMut_insert_array")
        
        self._jobjectmut_remove = self._handle.get_function[fn_jobjectmut_remove]("JObjectMut_remove")
        
        self._jobjectmut_len = self._handle.get_function[fn_jobjectmut_len]("JObjectMut_len")
        
        self._jobjectmut_is_empty = self._handle.get_function[fn_jobjectmut_is_empty]("JObjectMut_is_empty")
        
        self._jobjectmut_get_value = self._handle.get_function[fn_jobjectmut_get_value]("JObjectMut_get_value")
        
        self._jobjectmut_get_value_ref = self._handle.get_function[fn_jobjectmut_get_value_ref]("JObjectMut_get_value_ref")
        
        self._jobjectmut_get_value_mut = self._handle.get_function[fn_jobjectmut_get_value_mut]("JObjectMut_get_value_mut")
        
        self._jobjectmut_get_object_mut = self._handle.get_function[fn_jobjectmut_get_object_mut]("JObjectMut_get_object_mut")
        
        self._jobjectmut_get_array_mut = self._handle.get_function[fn_jobjectmut_get_array_mut]("JObjectMut_get_array_mut")
        
        self._jobjectmut_get_bool = self._handle.get_function[fn_jobjectmut_get_bool]("JObjectMut_get_bool")
        
        self._jobjectmut_get_i64 = self._handle.get_function[fn_jobjectmut_get_i64]("JObjectMut_get_i64")
        
        self._jobjectmut_get_u64 = self._handle.get_function[fn_jobjectmut_get_u64]("JObjectMut_get_u64")
        
        self._jobjectmut_get_f64 = self._handle.get_function[fn_jobjectmut_get_f64]("JObjectMut_get_f64")
        
        self._jobjectmut_get_str = self._handle.get_function[fn_jobjectmut_get_str]("JObjectMut_get_str")
        
        self._jobjectmut_get_str_ref = self._handle.get_function[fn_jobjectmut_get_str_ref]("JObjectMut_get_str_ref")
        
        self._jobjectmut_keys_iter = self._handle.get_function[fn_jobjectmut_keys_iter]("JObjectMut_keys_iter")
        
        self._jobjectmut_iter = self._handle.get_function[fn_jobjectmut_iter]("JObjectMut_iter")
        
        self._jobjectmut_destroy = self._handle.get_function[fn_jobjectmut_destroy]("JObjectMut_destroy")


@always_inline
fn jobjectmut_clone(self: UnsafePointer[JObjectMut]) -> UnsafePointer[JObject]:
    return __wrapper._jobjectmut_clone(self)

@always_inline
fn jobjectmut_to_string(self: UnsafePointer[JObjectMut], write: UnsafePointer[DiplomatWrite]) -> None:
    return __wrapper._jobjectmut_to_string(self, write)

@always_inline
fn jobjectmut_clear(self: UnsafePointer[JObjectMut]) -> None:
    return __wrapper._jobjectmut_clear(self)

@always_inline
fn jobjectmut_capacity(self: UnsafePointer[JObjectMut]) -> c_size_t:
    return __wrapper._jobjectmut_capacity(self)

@always_inline
fn jobjectmut_contains_key(self: UnsafePointer[JObjectMut], key: DiplomatStringView) -> c_bool:
    return __wrapper._jobjectmut_contains_key(self, key)

@always_inline
fn jobjectmut_insert_null(self: UnsafePointer[JObjectMut], key: DiplomatStringView) -> None:
    return __wrapper._jobjectmut_insert_null(self, key)

@always_inline
fn jobjectmut_insert_bool(self: UnsafePointer[JObjectMut], key: DiplomatStringView, value: c_bool) -> None:
    return __wrapper._jobjectmut_insert_bool(self, key, value)

@always_inline
fn jobjectmut_insert_i64(self: UnsafePointer[JObjectMut], key: DiplomatStringView, value: c_int64) -> None:
    return __wrapper._jobjectmut_insert_i64(self, key, value)

@always_inline
fn jobjectmut_insert_u64(self: UnsafePointer[JObjectMut], key: DiplomatStringView, value: c_uint64) -> None:
    return __wrapper._jobjectmut_insert_u64(self, key, value)

@always_inline
fn jobjectmut_insert_f64(self: UnsafePointer[JObjectMut], key: DiplomatStringView, value: c_double) -> None:
    return __wrapper._jobjectmut_insert_f64(self, key, value)

@always_inline
fn jobjectmut_insert_str(self: UnsafePointer[JObjectMut], key: DiplomatStringView, value: DiplomatStringView) -> None:
    return __wrapper._jobjectmut_insert_str(self, key, value)

@always_inline
fn jobjectmut_insert_value(self: UnsafePointer[JObjectMut], key: DiplomatStringView, value: UnsafePointer[JValue]) -> None:
    return __wrapper._jobjectmut_insert_value(self, key, value)

@always_inline
fn jobjectmut_insert_object(self: UnsafePointer[JObjectMut], key: DiplomatStringView, value: UnsafePointer[JObject]) -> None:
    return __wrapper._jobjectmut_insert_object(self, key, value)

@always_inline
fn jobjectmut_insert_array(self: UnsafePointer[JObjectMut], key: DiplomatStringView, value: UnsafePointer[JArray]) -> None:
    return __wrapper._jobjectmut_insert_array(self, key, value)

@always_inline
fn jobjectmut_remove(self: UnsafePointer[JObjectMut], key: DiplomatStringView) -> c_bool:
    return __wrapper._jobjectmut_remove(self, key)

@always_inline
fn jobjectmut_len(self: UnsafePointer[JObjectMut]) -> c_size_t:
    return __wrapper._jobjectmut_len(self)

@always_inline
fn jobjectmut_is_empty(self: UnsafePointer[JObjectMut]) -> c_bool:
    return __wrapper._jobjectmut_is_empty(self)

@always_inline
fn jobjectmut_get_value(self: UnsafePointer[JObjectMut], key: DiplomatStringView) -> UnsafePointer[JValue]:
    return __wrapper._jobjectmut_get_value(self, key)

@always_inline
fn jobjectmut_get_value_ref(self: UnsafePointer[JObjectMut], key: DiplomatStringView) -> UnsafePointer[JValueRef]:
    return __wrapper._jobjectmut_get_value_ref(self, key)

@always_inline
fn jobjectmut_get_value_mut(self: UnsafePointer[JObjectMut], key: DiplomatStringView) -> UnsafePointer[JValueMut]:
    return __wrapper._jobjectmut_get_value_mut(self, key)

@always_inline
fn jobjectmut_get_object_mut(self: UnsafePointer[JObjectMut], key: DiplomatStringView) -> UnsafePointer[JObjectMut]:
    return __wrapper._jobjectmut_get_object_mut(self, key)

@always_inline
fn jobjectmut_get_array_mut(self: UnsafePointer[JObjectMut], key: DiplomatStringView) -> UnsafePointer[JArrayMut]:
    return __wrapper._jobjectmut_get_array_mut(self, key)

@always_inline
fn jobjectmut_get_bool(self: UnsafePointer[JObjectMut], key: DiplomatStringView) -> OptionBoolResult:
    return __wrapper._jobjectmut_get_bool(self, key)

@always_inline
fn jobjectmut_get_i64(self: UnsafePointer[JObjectMut], key: DiplomatStringView) -> OptionI64Result:
    return __wrapper._jobjectmut_get_i64(self, key)

@always_inline
fn jobjectmut_get_u64(self: UnsafePointer[JObjectMut], key: DiplomatStringView) -> OptionU64Result:
    return __wrapper._jobjectmut_get_u64(self, key)

@always_inline
fn jobjectmut_get_f64(self: UnsafePointer[JObjectMut], key: DiplomatStringView) -> OptionF64Result:
    return __wrapper._jobjectmut_get_f64(self, key)

@always_inline
fn jobjectmut_get_str(self: UnsafePointer[JObjectMut], key: DiplomatStringView, default: DiplomatStringView, write: UnsafePointer[DiplomatWrite]) -> None:
    return __wrapper._jobjectmut_get_str(self, key, default, write)

@always_inline
fn jobjectmut_get_str_ref(self: UnsafePointer[JObjectMut], key: DiplomatStringView, default: DiplomatStringView) -> DiplomatStringView:
    return __wrapper._jobjectmut_get_str_ref(self, key, default)

@always_inline
fn jobjectmut_keys_iter(self: UnsafePointer[JObjectMut]) -> UnsafePointer[JKeysIter]:
    return __wrapper._jobjectmut_keys_iter(self)

@always_inline
fn jobjectmut_iter(self: UnsafePointer[JObjectMut]) -> UnsafePointer[JObjectIter]:
    return __wrapper._jobjectmut_iter(self)

@always_inline
fn jobjectmut_destroy(self: UnsafePointer[JObjectMut]) -> None:
    return __wrapper._jobjectmut_destroy(self)


from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *

from .jarrayref_d import *
from .jkeysiter_d import *
from .jobject_d import *
from .jobjectiter_d import *
from .jvalue_d import *
from .jvalueref_d import *

from .jobjectref_d import *



alias fn_jobjectref_clone = fn (self: UnsafePointer[JObjectRef]) -> UnsafePointer[JObject]

alias fn_jobjectref_to_string = fn (self: UnsafePointer[JObjectRef], write: UnsafePointer[DiplomatWrite]) -> None

alias fn_jobjectref_capacity = fn (self: UnsafePointer[JObjectRef]) -> c_size_t

alias fn_jobjectref_contains_key = fn (self: UnsafePointer[JObjectRef], key: DiplomatStringView) -> c_bool

alias fn_jobjectref_len = fn (self: UnsafePointer[JObjectRef]) -> c_size_t

alias fn_jobjectref_is_empty = fn (self: UnsafePointer[JObjectRef]) -> c_bool

alias fn_jobjectref_get_value = fn (self: UnsafePointer[JObjectRef], key: DiplomatStringView) -> UnsafePointer[JValue]

alias fn_jobjectref_get_value_ref = fn (self: UnsafePointer[JObjectRef], key: DiplomatStringView) -> UnsafePointer[JValueRef]

alias fn_jobjectref_get_object_ref = fn (self: UnsafePointer[JObjectRef], key: DiplomatStringView) -> UnsafePointer[JObjectRef]

alias fn_jobjectref_get_array_ref = fn (self: UnsafePointer[JObjectRef], key: DiplomatStringView) -> UnsafePointer[JArrayRef]

alias fn_jobjectref_get_bool = fn (self: UnsafePointer[JObjectRef], key: DiplomatStringView) -> OptionBoolResult

alias fn_jobjectref_get_i64 = fn (self: UnsafePointer[JObjectRef], key: DiplomatStringView) -> OptionI64Result

alias fn_jobjectref_get_u64 = fn (self: UnsafePointer[JObjectRef], key: DiplomatStringView) -> OptionU64Result

alias fn_jobjectref_get_f64 = fn (self: UnsafePointer[JObjectRef], key: DiplomatStringView) -> OptionF64Result

alias fn_jobjectref_get_str = fn (self: UnsafePointer[JObjectRef], key: DiplomatStringView, default: DiplomatStringView, write: UnsafePointer[DiplomatWrite]) -> None

alias fn_jobjectref_get_str_ref = fn (self: UnsafePointer[JObjectRef], key: DiplomatStringView, default: DiplomatStringView) -> DiplomatStringView

alias fn_jobjectref_keys_iter = fn (self: UnsafePointer[JObjectRef]) -> UnsafePointer[JKeysIter]

alias fn_jobjectref_iter = fn (self: UnsafePointer[JObjectRef]) -> UnsafePointer[JObjectIter]

alias fn_jobjectref_destroy = fn (self: UnsafePointer[JObjectRef]) -> None

var __wrapper = _DLWrapper()

@value
struct _DLWrapper:
    var _handle: DLHandle
    
    var _jobjectref_clone: fn_jobjectref_clone
    
    var _jobjectref_to_string: fn_jobjectref_to_string
    
    var _jobjectref_capacity: fn_jobjectref_capacity
    
    var _jobjectref_contains_key: fn_jobjectref_contains_key
    
    var _jobjectref_len: fn_jobjectref_len
    
    var _jobjectref_is_empty: fn_jobjectref_is_empty
    
    var _jobjectref_get_value: fn_jobjectref_get_value
    
    var _jobjectref_get_value_ref: fn_jobjectref_get_value_ref
    
    var _jobjectref_get_object_ref: fn_jobjectref_get_object_ref
    
    var _jobjectref_get_array_ref: fn_jobjectref_get_array_ref
    
    var _jobjectref_get_bool: fn_jobjectref_get_bool
    
    var _jobjectref_get_i64: fn_jobjectref_get_i64
    
    var _jobjectref_get_u64: fn_jobjectref_get_u64
    
    var _jobjectref_get_f64: fn_jobjectref_get_f64
    
    var _jobjectref_get_str: fn_jobjectref_get_str
    
    var _jobjectref_get_str_ref: fn_jobjectref_get_str_ref
    
    var _jobjectref_keys_iter: fn_jobjectref_keys_iter
    
    var _jobjectref_iter: fn_jobjectref_iter
    
    var _jobjectref_destroy: fn_jobjectref_destroy

    fn __init__(out self):
        self._handle = DLHandle(LIBNAME)
        
        self._jobjectref_clone = self._handle.get_function[fn_jobjectref_clone]("JObjectRef_clone")
        
        self._jobjectref_to_string = self._handle.get_function[fn_jobjectref_to_string]("JObjectRef_to_string")
        
        self._jobjectref_capacity = self._handle.get_function[fn_jobjectref_capacity]("JObjectRef_capacity")
        
        self._jobjectref_contains_key = self._handle.get_function[fn_jobjectref_contains_key]("JObjectRef_contains_key")
        
        self._jobjectref_len = self._handle.get_function[fn_jobjectref_len]("JObjectRef_len")
        
        self._jobjectref_is_empty = self._handle.get_function[fn_jobjectref_is_empty]("JObjectRef_is_empty")
        
        self._jobjectref_get_value = self._handle.get_function[fn_jobjectref_get_value]("JObjectRef_get_value")
        
        self._jobjectref_get_value_ref = self._handle.get_function[fn_jobjectref_get_value_ref]("JObjectRef_get_value_ref")
        
        self._jobjectref_get_object_ref = self._handle.get_function[fn_jobjectref_get_object_ref]("JObjectRef_get_object_ref")
        
        self._jobjectref_get_array_ref = self._handle.get_function[fn_jobjectref_get_array_ref]("JObjectRef_get_array_ref")
        
        self._jobjectref_get_bool = self._handle.get_function[fn_jobjectref_get_bool]("JObjectRef_get_bool")
        
        self._jobjectref_get_i64 = self._handle.get_function[fn_jobjectref_get_i64]("JObjectRef_get_i64")
        
        self._jobjectref_get_u64 = self._handle.get_function[fn_jobjectref_get_u64]("JObjectRef_get_u64")
        
        self._jobjectref_get_f64 = self._handle.get_function[fn_jobjectref_get_f64]("JObjectRef_get_f64")
        
        self._jobjectref_get_str = self._handle.get_function[fn_jobjectref_get_str]("JObjectRef_get_str")
        
        self._jobjectref_get_str_ref = self._handle.get_function[fn_jobjectref_get_str_ref]("JObjectRef_get_str_ref")
        
        self._jobjectref_keys_iter = self._handle.get_function[fn_jobjectref_keys_iter]("JObjectRef_keys_iter")
        
        self._jobjectref_iter = self._handle.get_function[fn_jobjectref_iter]("JObjectRef_iter")
        
        self._jobjectref_destroy = self._handle.get_function[fn_jobjectref_destroy]("JObjectRef_destroy")


@always_inline
fn jobjectref_clone(self: UnsafePointer[JObjectRef]) -> UnsafePointer[JObject]:
    return __wrapper._jobjectref_clone(self)

@always_inline
fn jobjectref_to_string(self: UnsafePointer[JObjectRef], write: UnsafePointer[DiplomatWrite]) -> None:
    return __wrapper._jobjectref_to_string(self, write)

@always_inline
fn jobjectref_capacity(self: UnsafePointer[JObjectRef]) -> c_size_t:
    return __wrapper._jobjectref_capacity(self)

@always_inline
fn jobjectref_contains_key(self: UnsafePointer[JObjectRef], key: DiplomatStringView) -> c_bool:
    return __wrapper._jobjectref_contains_key(self, key)

@always_inline
fn jobjectref_len(self: UnsafePointer[JObjectRef]) -> c_size_t:
    return __wrapper._jobjectref_len(self)

@always_inline
fn jobjectref_is_empty(self: UnsafePointer[JObjectRef]) -> c_bool:
    return __wrapper._jobjectref_is_empty(self)

@always_inline
fn jobjectref_get_value(self: UnsafePointer[JObjectRef], key: DiplomatStringView) -> UnsafePointer[JValue]:
    return __wrapper._jobjectref_get_value(self, key)

@always_inline
fn jobjectref_get_value_ref(self: UnsafePointer[JObjectRef], key: DiplomatStringView) -> UnsafePointer[JValueRef]:
    return __wrapper._jobjectref_get_value_ref(self, key)

@always_inline
fn jobjectref_get_object_ref(self: UnsafePointer[JObjectRef], key: DiplomatStringView) -> UnsafePointer[JObjectRef]:
    return __wrapper._jobjectref_get_object_ref(self, key)

@always_inline
fn jobjectref_get_array_ref(self: UnsafePointer[JObjectRef], key: DiplomatStringView) -> UnsafePointer[JArrayRef]:
    return __wrapper._jobjectref_get_array_ref(self, key)

@always_inline
fn jobjectref_get_bool(self: UnsafePointer[JObjectRef], key: DiplomatStringView) -> OptionBoolResult:
    return __wrapper._jobjectref_get_bool(self, key)

@always_inline
fn jobjectref_get_i64(self: UnsafePointer[JObjectRef], key: DiplomatStringView) -> OptionI64Result:
    return __wrapper._jobjectref_get_i64(self, key)

@always_inline
fn jobjectref_get_u64(self: UnsafePointer[JObjectRef], key: DiplomatStringView) -> OptionU64Result:
    return __wrapper._jobjectref_get_u64(self, key)

@always_inline
fn jobjectref_get_f64(self: UnsafePointer[JObjectRef], key: DiplomatStringView) -> OptionF64Result:
    return __wrapper._jobjectref_get_f64(self, key)

@always_inline
fn jobjectref_get_str(self: UnsafePointer[JObjectRef], key: DiplomatStringView, default: DiplomatStringView, write: UnsafePointer[DiplomatWrite]) -> None:
    return __wrapper._jobjectref_get_str(self, key, default, write)

@always_inline
fn jobjectref_get_str_ref(self: UnsafePointer[JObjectRef], key: DiplomatStringView, default: DiplomatStringView) -> DiplomatStringView:
    return __wrapper._jobjectref_get_str_ref(self, key, default)

@always_inline
fn jobjectref_keys_iter(self: UnsafePointer[JObjectRef]) -> UnsafePointer[JKeysIter]:
    return __wrapper._jobjectref_keys_iter(self)

@always_inline
fn jobjectref_iter(self: UnsafePointer[JObjectRef]) -> UnsafePointer[JObjectIter]:
    return __wrapper._jobjectref_iter(self)

@always_inline
fn jobjectref_destroy(self: UnsafePointer[JObjectRef]) -> None:
    return __wrapper._jobjectref_destroy(self)

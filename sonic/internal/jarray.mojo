
from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *

from .jobject_d import *
from .jvalue_d import *
from .jvalueiter_d import *
from .jvaluemut_d import *
from .jvalueref_d import *

from .jarray_d import *



alias fn_jarray_new = fn () -> UnsafePointer[JArray]

alias fn_jarray_from_str = fn (s: DiplomatStringView) -> UnsafePointer[JArray]

alias fn_jarray_with_capacity = fn (capacity: c_size_t) -> UnsafePointer[JArray]

alias fn_jarray_clone = fn (self: UnsafePointer[JArray]) -> UnsafePointer[JArray]

alias fn_jarray_to_string = fn (self: UnsafePointer[JArray], write: UnsafePointer[DiplomatWrite]) -> None

alias fn_jarray_push_null = fn (self: UnsafePointer[JArray]) -> None

alias fn_jarray_push_bool = fn (self: UnsafePointer[JArray], value: c_bool) -> None

alias fn_jarray_push_i64 = fn (self: UnsafePointer[JArray], value: c_int64) -> None

alias fn_jarray_push_u64 = fn (self: UnsafePointer[JArray], value: c_uint64) -> None

alias fn_jarray_push_f64 = fn (self: UnsafePointer[JArray], value: c_double) -> None

alias fn_jarray_push_str = fn (self: UnsafePointer[JArray], value: DiplomatStringView) -> None

alias fn_jarray_push_value = fn (self: UnsafePointer[JArray], value: UnsafePointer[JValue]) -> None

alias fn_jarray_push_object = fn (self: UnsafePointer[JArray], value: UnsafePointer[JObject]) -> None

alias fn_jarray_push_array = fn (self: UnsafePointer[JArray], value: UnsafePointer[JArray]) -> None

alias fn_jarray_insert = fn (self: UnsafePointer[JArray], index: c_size_t, value: UnsafePointer[JValue]) -> None

alias fn_jarray_pop = fn (self: UnsafePointer[JArray]) -> UnsafePointer[JValue]

alias fn_jarray_len = fn (self: UnsafePointer[JArray]) -> c_size_t

alias fn_jarray_is_empty = fn (self: UnsafePointer[JArray]) -> c_bool

alias fn_jarray_clear = fn (self: UnsafePointer[JArray]) -> None

alias fn_jarray_remove = fn (self: UnsafePointer[JArray], index: c_size_t) -> None

alias fn_jarray_get = fn (self: UnsafePointer[JArray], index: c_size_t) -> UnsafePointer[JValueRef]

alias fn_jarray_get_mut = fn (self: UnsafePointer[JArray], index: c_size_t) -> UnsafePointer[JValueMut]

alias fn_jarray_iter = fn (self: UnsafePointer[JArray]) -> UnsafePointer[JValueIter]

alias fn_jarray_destroy = fn (self: UnsafePointer[JArray]) -> None

var __wrapper = _DLWrapper()

@value
struct _DLWrapper:
    var _handle: DLHandle
    
    var _jarray_new: fn_jarray_new
    
    var _jarray_from_str: fn_jarray_from_str
    
    var _jarray_with_capacity: fn_jarray_with_capacity
    
    var _jarray_clone: fn_jarray_clone
    
    var _jarray_to_string: fn_jarray_to_string
    
    var _jarray_push_null: fn_jarray_push_null
    
    var _jarray_push_bool: fn_jarray_push_bool
    
    var _jarray_push_i64: fn_jarray_push_i64
    
    var _jarray_push_u64: fn_jarray_push_u64
    
    var _jarray_push_f64: fn_jarray_push_f64
    
    var _jarray_push_str: fn_jarray_push_str
    
    var _jarray_push_value: fn_jarray_push_value
    
    var _jarray_push_object: fn_jarray_push_object
    
    var _jarray_push_array: fn_jarray_push_array
    
    var _jarray_insert: fn_jarray_insert
    
    var _jarray_pop: fn_jarray_pop
    
    var _jarray_len: fn_jarray_len
    
    var _jarray_is_empty: fn_jarray_is_empty
    
    var _jarray_clear: fn_jarray_clear
    
    var _jarray_remove: fn_jarray_remove
    
    var _jarray_get: fn_jarray_get
    
    var _jarray_get_mut: fn_jarray_get_mut
    
    var _jarray_iter: fn_jarray_iter
    
    var _jarray_destroy: fn_jarray_destroy

    fn __init__(out self):
        self._handle = DLHandle(LIBNAME)
        
        self._jarray_new = self._handle.get_function[fn_jarray_new]("JArray_new")
        
        self._jarray_from_str = self._handle.get_function[fn_jarray_from_str]("JArray_from_str")
        
        self._jarray_with_capacity = self._handle.get_function[fn_jarray_with_capacity]("JArray_with_capacity")
        
        self._jarray_clone = self._handle.get_function[fn_jarray_clone]("JArray_clone")
        
        self._jarray_to_string = self._handle.get_function[fn_jarray_to_string]("JArray_to_string")
        
        self._jarray_push_null = self._handle.get_function[fn_jarray_push_null]("JArray_push_null")
        
        self._jarray_push_bool = self._handle.get_function[fn_jarray_push_bool]("JArray_push_bool")
        
        self._jarray_push_i64 = self._handle.get_function[fn_jarray_push_i64]("JArray_push_i64")
        
        self._jarray_push_u64 = self._handle.get_function[fn_jarray_push_u64]("JArray_push_u64")
        
        self._jarray_push_f64 = self._handle.get_function[fn_jarray_push_f64]("JArray_push_f64")
        
        self._jarray_push_str = self._handle.get_function[fn_jarray_push_str]("JArray_push_str")
        
        self._jarray_push_value = self._handle.get_function[fn_jarray_push_value]("JArray_push_value")
        
        self._jarray_push_object = self._handle.get_function[fn_jarray_push_object]("JArray_push_object")
        
        self._jarray_push_array = self._handle.get_function[fn_jarray_push_array]("JArray_push_array")
        
        self._jarray_insert = self._handle.get_function[fn_jarray_insert]("JArray_insert")
        
        self._jarray_pop = self._handle.get_function[fn_jarray_pop]("JArray_pop")
        
        self._jarray_len = self._handle.get_function[fn_jarray_len]("JArray_len")
        
        self._jarray_is_empty = self._handle.get_function[fn_jarray_is_empty]("JArray_is_empty")
        
        self._jarray_clear = self._handle.get_function[fn_jarray_clear]("JArray_clear")
        
        self._jarray_remove = self._handle.get_function[fn_jarray_remove]("JArray_remove")
        
        self._jarray_get = self._handle.get_function[fn_jarray_get]("JArray_get")
        
        self._jarray_get_mut = self._handle.get_function[fn_jarray_get_mut]("JArray_get_mut")
        
        self._jarray_iter = self._handle.get_function[fn_jarray_iter]("JArray_iter")
        
        self._jarray_destroy = self._handle.get_function[fn_jarray_destroy]("JArray_destroy")


@always_inline
fn jarray_new() -> UnsafePointer[JArray]:
    return __wrapper._jarray_new()

@always_inline
fn jarray_from_str(s: DiplomatStringView) -> UnsafePointer[JArray]:
    return __wrapper._jarray_from_str(s)

@always_inline
fn jarray_with_capacity(capacity: c_size_t) -> UnsafePointer[JArray]:
    return __wrapper._jarray_with_capacity(capacity)

@always_inline
fn jarray_clone(self: UnsafePointer[JArray]) -> UnsafePointer[JArray]:
    return __wrapper._jarray_clone(self)

@always_inline
fn jarray_to_string(self: UnsafePointer[JArray], write: UnsafePointer[DiplomatWrite]) -> None:
    return __wrapper._jarray_to_string(self, write)

@always_inline
fn jarray_push_null(self: UnsafePointer[JArray]) -> None:
    return __wrapper._jarray_push_null(self)

@always_inline
fn jarray_push_bool(self: UnsafePointer[JArray], value: c_bool) -> None:
    return __wrapper._jarray_push_bool(self, value)

@always_inline
fn jarray_push_i64(self: UnsafePointer[JArray], value: c_int64) -> None:
    return __wrapper._jarray_push_i64(self, value)

@always_inline
fn jarray_push_u64(self: UnsafePointer[JArray], value: c_uint64) -> None:
    return __wrapper._jarray_push_u64(self, value)

@always_inline
fn jarray_push_f64(self: UnsafePointer[JArray], value: c_double) -> None:
    return __wrapper._jarray_push_f64(self, value)

@always_inline
fn jarray_push_str(self: UnsafePointer[JArray], value: DiplomatStringView) -> None:
    return __wrapper._jarray_push_str(self, value)

@always_inline
fn jarray_push_value(self: UnsafePointer[JArray], value: UnsafePointer[JValue]) -> None:
    return __wrapper._jarray_push_value(self, value)

@always_inline
fn jarray_push_object(self: UnsafePointer[JArray], value: UnsafePointer[JObject]) -> None:
    return __wrapper._jarray_push_object(self, value)

@always_inline
fn jarray_push_array(self: UnsafePointer[JArray], value: UnsafePointer[JArray]) -> None:
    return __wrapper._jarray_push_array(self, value)

@always_inline
fn jarray_insert(self: UnsafePointer[JArray], index: c_size_t, value: UnsafePointer[JValue]) -> None:
    return __wrapper._jarray_insert(self, index, value)

@always_inline
fn jarray_pop(self: UnsafePointer[JArray]) -> UnsafePointer[JValue]:
    return __wrapper._jarray_pop(self)

@always_inline
fn jarray_len(self: UnsafePointer[JArray]) -> c_size_t:
    return __wrapper._jarray_len(self)

@always_inline
fn jarray_is_empty(self: UnsafePointer[JArray]) -> c_bool:
    return __wrapper._jarray_is_empty(self)

@always_inline
fn jarray_clear(self: UnsafePointer[JArray]) -> None:
    return __wrapper._jarray_clear(self)

@always_inline
fn jarray_remove(self: UnsafePointer[JArray], index: c_size_t) -> None:
    return __wrapper._jarray_remove(self, index)

@always_inline
fn jarray_get(self: UnsafePointer[JArray], index: c_size_t) -> UnsafePointer[JValueRef]:
    return __wrapper._jarray_get(self, index)

@always_inline
fn jarray_get_mut(self: UnsafePointer[JArray], index: c_size_t) -> UnsafePointer[JValueMut]:
    return __wrapper._jarray_get_mut(self, index)

@always_inline
fn jarray_iter(self: UnsafePointer[JArray]) -> UnsafePointer[JValueIter]:
    return __wrapper._jarray_iter(self)

@always_inline
fn jarray_destroy(self: UnsafePointer[JArray]) -> None:
    return __wrapper._jarray_destroy(self)

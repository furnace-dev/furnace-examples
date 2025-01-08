
from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *

from .jarray_d import *
from .jobject_d import *
from .jvalue_d import *
from .jvalueiter_d import *
from .jvalueitermut_d import *
from .jvaluemut_d import *
from .jvalueref_d import *

from .jarraymut_d import *



alias fn_jarraymut_clone = fn (self: UnsafePointer[JArrayMut]) -> UnsafePointer[JArray]

alias fn_jarraymut_to_string = fn (self: UnsafePointer[JArrayMut], write: UnsafePointer[DiplomatWrite]) -> None

alias fn_jarraymut_push_null = fn (self: UnsafePointer[JArrayMut]) -> None

alias fn_jarraymut_push_bool = fn (self: UnsafePointer[JArrayMut], value: c_bool) -> None

alias fn_jarraymut_push_i64 = fn (self: UnsafePointer[JArrayMut], value: c_int64) -> None

alias fn_jarraymut_push_u64 = fn (self: UnsafePointer[JArrayMut], value: c_uint64) -> None

alias fn_jarraymut_push_f64 = fn (self: UnsafePointer[JArrayMut], value: c_double) -> None

alias fn_jarraymut_push_str = fn (self: UnsafePointer[JArrayMut], value: DiplomatStringView) -> None

alias fn_jarraymut_push_value = fn (self: UnsafePointer[JArrayMut], value: UnsafePointer[JValue]) -> None

alias fn_jarraymut_push_object = fn (self: UnsafePointer[JArrayMut], value: UnsafePointer[JObject]) -> None

alias fn_jarraymut_push_array = fn (self: UnsafePointer[JArrayMut], value: UnsafePointer[JArray]) -> None

alias fn_jarraymut_insert = fn (self: UnsafePointer[JArrayMut], index: c_size_t, value: UnsafePointer[JValue]) -> None

alias fn_jarraymut_pop = fn (self: UnsafePointer[JArrayMut]) -> UnsafePointer[JValue]

alias fn_jarraymut_len = fn (self: UnsafePointer[JArrayMut]) -> c_size_t

alias fn_jarraymut_is_empty = fn (self: UnsafePointer[JArrayMut]) -> c_bool

alias fn_jarraymut_clear = fn (self: UnsafePointer[JArrayMut]) -> None

alias fn_jarraymut_remove = fn (self: UnsafePointer[JArrayMut], index: c_size_t) -> None

alias fn_jarraymut_get = fn (self: UnsafePointer[JArrayMut], index: c_size_t) -> UnsafePointer[JValueRef]

alias fn_jarraymut_get_mut = fn (self: UnsafePointer[JArrayMut], index: c_size_t) -> UnsafePointer[JValueMut]

alias fn_jarraymut_iter = fn (self: UnsafePointer[JArrayMut]) -> UnsafePointer[JValueIter]

alias fn_jarraymut_iter_mut = fn (self: UnsafePointer[JArrayMut]) -> UnsafePointer[JValueIterMut]

alias fn_jarraymut_destroy = fn (self: UnsafePointer[JArrayMut]) -> None

var __wrapper = _DLWrapper()

@value
struct _DLWrapper:
    var _handle: DLHandle
    
    var _jarraymut_clone: fn_jarraymut_clone
    
    var _jarraymut_to_string: fn_jarraymut_to_string
    
    var _jarraymut_push_null: fn_jarraymut_push_null
    
    var _jarraymut_push_bool: fn_jarraymut_push_bool
    
    var _jarraymut_push_i64: fn_jarraymut_push_i64
    
    var _jarraymut_push_u64: fn_jarraymut_push_u64
    
    var _jarraymut_push_f64: fn_jarraymut_push_f64
    
    var _jarraymut_push_str: fn_jarraymut_push_str
    
    var _jarraymut_push_value: fn_jarraymut_push_value
    
    var _jarraymut_push_object: fn_jarraymut_push_object
    
    var _jarraymut_push_array: fn_jarraymut_push_array
    
    var _jarraymut_insert: fn_jarraymut_insert
    
    var _jarraymut_pop: fn_jarraymut_pop
    
    var _jarraymut_len: fn_jarraymut_len
    
    var _jarraymut_is_empty: fn_jarraymut_is_empty
    
    var _jarraymut_clear: fn_jarraymut_clear
    
    var _jarraymut_remove: fn_jarraymut_remove
    
    var _jarraymut_get: fn_jarraymut_get
    
    var _jarraymut_get_mut: fn_jarraymut_get_mut
    
    var _jarraymut_iter: fn_jarraymut_iter
    
    var _jarraymut_iter_mut: fn_jarraymut_iter_mut
    
    var _jarraymut_destroy: fn_jarraymut_destroy

    fn __init__(out self):
        self._handle = DLHandle(LIBNAME)
        
        self._jarraymut_clone = self._handle.get_function[fn_jarraymut_clone]("JArrayMut_clone")
        
        self._jarraymut_to_string = self._handle.get_function[fn_jarraymut_to_string]("JArrayMut_to_string")
        
        self._jarraymut_push_null = self._handle.get_function[fn_jarraymut_push_null]("JArrayMut_push_null")
        
        self._jarraymut_push_bool = self._handle.get_function[fn_jarraymut_push_bool]("JArrayMut_push_bool")
        
        self._jarraymut_push_i64 = self._handle.get_function[fn_jarraymut_push_i64]("JArrayMut_push_i64")
        
        self._jarraymut_push_u64 = self._handle.get_function[fn_jarraymut_push_u64]("JArrayMut_push_u64")
        
        self._jarraymut_push_f64 = self._handle.get_function[fn_jarraymut_push_f64]("JArrayMut_push_f64")
        
        self._jarraymut_push_str = self._handle.get_function[fn_jarraymut_push_str]("JArrayMut_push_str")
        
        self._jarraymut_push_value = self._handle.get_function[fn_jarraymut_push_value]("JArrayMut_push_value")
        
        self._jarraymut_push_object = self._handle.get_function[fn_jarraymut_push_object]("JArrayMut_push_object")
        
        self._jarraymut_push_array = self._handle.get_function[fn_jarraymut_push_array]("JArrayMut_push_array")
        
        self._jarraymut_insert = self._handle.get_function[fn_jarraymut_insert]("JArrayMut_insert")
        
        self._jarraymut_pop = self._handle.get_function[fn_jarraymut_pop]("JArrayMut_pop")
        
        self._jarraymut_len = self._handle.get_function[fn_jarraymut_len]("JArrayMut_len")
        
        self._jarraymut_is_empty = self._handle.get_function[fn_jarraymut_is_empty]("JArrayMut_is_empty")
        
        self._jarraymut_clear = self._handle.get_function[fn_jarraymut_clear]("JArrayMut_clear")
        
        self._jarraymut_remove = self._handle.get_function[fn_jarraymut_remove]("JArrayMut_remove")
        
        self._jarraymut_get = self._handle.get_function[fn_jarraymut_get]("JArrayMut_get")
        
        self._jarraymut_get_mut = self._handle.get_function[fn_jarraymut_get_mut]("JArrayMut_get_mut")
        
        self._jarraymut_iter = self._handle.get_function[fn_jarraymut_iter]("JArrayMut_iter")
        
        self._jarraymut_iter_mut = self._handle.get_function[fn_jarraymut_iter_mut]("JArrayMut_iter_mut")
        
        self._jarraymut_destroy = self._handle.get_function[fn_jarraymut_destroy]("JArrayMut_destroy")


@always_inline
fn jarraymut_clone(self: UnsafePointer[JArrayMut]) -> UnsafePointer[JArray]:
    return __wrapper._jarraymut_clone(self)

@always_inline
fn jarraymut_to_string(self: UnsafePointer[JArrayMut], write: UnsafePointer[DiplomatWrite]) -> None:
    return __wrapper._jarraymut_to_string(self, write)

@always_inline
fn jarraymut_push_null(self: UnsafePointer[JArrayMut]) -> None:
    return __wrapper._jarraymut_push_null(self)

@always_inline
fn jarraymut_push_bool(self: UnsafePointer[JArrayMut], value: c_bool) -> None:
    return __wrapper._jarraymut_push_bool(self, value)

@always_inline
fn jarraymut_push_i64(self: UnsafePointer[JArrayMut], value: c_int64) -> None:
    return __wrapper._jarraymut_push_i64(self, value)

@always_inline
fn jarraymut_push_u64(self: UnsafePointer[JArrayMut], value: c_uint64) -> None:
    return __wrapper._jarraymut_push_u64(self, value)

@always_inline
fn jarraymut_push_f64(self: UnsafePointer[JArrayMut], value: c_double) -> None:
    return __wrapper._jarraymut_push_f64(self, value)

@always_inline
fn jarraymut_push_str(self: UnsafePointer[JArrayMut], value: DiplomatStringView) -> None:
    return __wrapper._jarraymut_push_str(self, value)

@always_inline
fn jarraymut_push_value(self: UnsafePointer[JArrayMut], value: UnsafePointer[JValue]) -> None:
    return __wrapper._jarraymut_push_value(self, value)

@always_inline
fn jarraymut_push_object(self: UnsafePointer[JArrayMut], value: UnsafePointer[JObject]) -> None:
    return __wrapper._jarraymut_push_object(self, value)

@always_inline
fn jarraymut_push_array(self: UnsafePointer[JArrayMut], value: UnsafePointer[JArray]) -> None:
    return __wrapper._jarraymut_push_array(self, value)

@always_inline
fn jarraymut_insert(self: UnsafePointer[JArrayMut], index: c_size_t, value: UnsafePointer[JValue]) -> None:
    return __wrapper._jarraymut_insert(self, index, value)

@always_inline
fn jarraymut_pop(self: UnsafePointer[JArrayMut]) -> UnsafePointer[JValue]:
    return __wrapper._jarraymut_pop(self)

@always_inline
fn jarraymut_len(self: UnsafePointer[JArrayMut]) -> c_size_t:
    return __wrapper._jarraymut_len(self)

@always_inline
fn jarraymut_is_empty(self: UnsafePointer[JArrayMut]) -> c_bool:
    return __wrapper._jarraymut_is_empty(self)

@always_inline
fn jarraymut_clear(self: UnsafePointer[JArrayMut]) -> None:
    return __wrapper._jarraymut_clear(self)

@always_inline
fn jarraymut_remove(self: UnsafePointer[JArrayMut], index: c_size_t) -> None:
    return __wrapper._jarraymut_remove(self, index)

@always_inline
fn jarraymut_get(self: UnsafePointer[JArrayMut], index: c_size_t) -> UnsafePointer[JValueRef]:
    return __wrapper._jarraymut_get(self, index)

@always_inline
fn jarraymut_get_mut(self: UnsafePointer[JArrayMut], index: c_size_t) -> UnsafePointer[JValueMut]:
    return __wrapper._jarraymut_get_mut(self, index)

@always_inline
fn jarraymut_iter(self: UnsafePointer[JArrayMut]) -> UnsafePointer[JValueIter]:
    return __wrapper._jarraymut_iter(self)

@always_inline
fn jarraymut_iter_mut(self: UnsafePointer[JArrayMut]) -> UnsafePointer[JValueIterMut]:
    return __wrapper._jarraymut_iter_mut(self)

@always_inline
fn jarraymut_destroy(self: UnsafePointer[JArrayMut]) -> None:
    return __wrapper._jarraymut_destroy(self)

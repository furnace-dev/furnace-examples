
from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *

from .jarray_d import *
from .jvalueiter_d import *
from .jvalueref_d import *

from .jarrayref_d import *



alias fn_jarrayref_clone = fn (self: UnsafePointer[JArrayRef]) -> UnsafePointer[JArray]

alias fn_jarrayref_to_string = fn (self: UnsafePointer[JArrayRef], write: UnsafePointer[DiplomatWrite]) -> None

alias fn_jarrayref_len = fn (self: UnsafePointer[JArrayRef]) -> c_size_t

alias fn_jarrayref_is_empty = fn (self: UnsafePointer[JArrayRef]) -> c_bool

alias fn_jarrayref_get = fn (self: UnsafePointer[JArrayRef], index: c_size_t) -> UnsafePointer[JValueRef]

alias fn_jarrayref_iter = fn (self: UnsafePointer[JArrayRef]) -> UnsafePointer[JValueIter]

alias fn_jarrayref_destroy = fn (self: UnsafePointer[JArrayRef]) -> None

var __wrapper = _DLWrapper()

@value
struct _DLWrapper:
    var _handle: DLHandle
    
    var _jarrayref_clone: fn_jarrayref_clone
    
    var _jarrayref_to_string: fn_jarrayref_to_string
    
    var _jarrayref_len: fn_jarrayref_len
    
    var _jarrayref_is_empty: fn_jarrayref_is_empty
    
    var _jarrayref_get: fn_jarrayref_get
    
    var _jarrayref_iter: fn_jarrayref_iter
    
    var _jarrayref_destroy: fn_jarrayref_destroy

    fn __init__(out self):
        self._handle = DLHandle(LIBNAME)
        
        self._jarrayref_clone = self._handle.get_function[fn_jarrayref_clone]("JArrayRef_clone")
        
        self._jarrayref_to_string = self._handle.get_function[fn_jarrayref_to_string]("JArrayRef_to_string")
        
        self._jarrayref_len = self._handle.get_function[fn_jarrayref_len]("JArrayRef_len")
        
        self._jarrayref_is_empty = self._handle.get_function[fn_jarrayref_is_empty]("JArrayRef_is_empty")
        
        self._jarrayref_get = self._handle.get_function[fn_jarrayref_get]("JArrayRef_get")
        
        self._jarrayref_iter = self._handle.get_function[fn_jarrayref_iter]("JArrayRef_iter")
        
        self._jarrayref_destroy = self._handle.get_function[fn_jarrayref_destroy]("JArrayRef_destroy")


@always_inline
fn jarrayref_clone(self: UnsafePointer[JArrayRef]) -> UnsafePointer[JArray]:
    return __wrapper._jarrayref_clone(self)

@always_inline
fn jarrayref_to_string(self: UnsafePointer[JArrayRef], write: UnsafePointer[DiplomatWrite]) -> None:
    return __wrapper._jarrayref_to_string(self, write)

@always_inline
fn jarrayref_len(self: UnsafePointer[JArrayRef]) -> c_size_t:
    return __wrapper._jarrayref_len(self)

@always_inline
fn jarrayref_is_empty(self: UnsafePointer[JArrayRef]) -> c_bool:
    return __wrapper._jarrayref_is_empty(self)

@always_inline
fn jarrayref_get(self: UnsafePointer[JArrayRef], index: c_size_t) -> UnsafePointer[JValueRef]:
    return __wrapper._jarrayref_get(self, index)

@always_inline
fn jarrayref_iter(self: UnsafePointer[JArrayRef]) -> UnsafePointer[JValueIter]:
    return __wrapper._jarrayref_iter(self)

@always_inline
fn jarrayref_destroy(self: UnsafePointer[JArrayRef]) -> None:
    return __wrapper._jarrayref_destroy(self)

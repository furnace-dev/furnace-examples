
from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *

from .jvalueref_d import *

from .jvalueiter_d import *



alias fn_jvalueiter_len = fn (self: UnsafePointer[JValueIter]) -> c_size_t

alias fn_jvalueiter_next = fn (self: UnsafePointer[JValueIter]) -> UnsafePointer[JValueRef]

alias fn_jvalueiter_destroy = fn (self: UnsafePointer[JValueIter]) -> None

var __wrapper = _DLWrapper()

@value
struct _DLWrapper:
    var _handle: DLHandle
    
    var _jvalueiter_len: fn_jvalueiter_len
    
    var _jvalueiter_next: fn_jvalueiter_next
    
    var _jvalueiter_destroy: fn_jvalueiter_destroy

    fn __init__(out self):
        self._handle = DLHandle(LIBNAME)
        
        self._jvalueiter_len = self._handle.get_function[fn_jvalueiter_len]("JValueIter_len")
        
        self._jvalueiter_next = self._handle.get_function[fn_jvalueiter_next]("JValueIter_next")
        
        self._jvalueiter_destroy = self._handle.get_function[fn_jvalueiter_destroy]("JValueIter_destroy")


@always_inline
fn jvalueiter_len(self: UnsafePointer[JValueIter]) -> c_size_t:
    return __wrapper._jvalueiter_len(self)

@always_inline
fn jvalueiter_next(self: UnsafePointer[JValueIter]) -> UnsafePointer[JValueRef]:
    return __wrapper._jvalueiter_next(self)

@always_inline
fn jvalueiter_destroy(self: UnsafePointer[JValueIter]) -> None:
    return __wrapper._jvalueiter_destroy(self)


from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *

from .jvaluemut_d import *

from .jvalueitermut_d import *



alias fn_jvalueitermut_len = fn (self: UnsafePointer[JValueIterMut]) -> c_size_t

alias fn_jvalueitermut_next = fn (self: UnsafePointer[JValueIterMut]) -> UnsafePointer[JValueMut]

alias fn_jvalueitermut_destroy = fn (self: UnsafePointer[JValueIterMut]) -> None

var __wrapper = _DLWrapper()

@value
struct _DLWrapper:
    var _handle: DLHandle
    
    var _jvalueitermut_len: fn_jvalueitermut_len
    
    var _jvalueitermut_next: fn_jvalueitermut_next
    
    var _jvalueitermut_destroy: fn_jvalueitermut_destroy

    fn __init__(out self):
        self._handle = DLHandle(LIBNAME)
        
        self._jvalueitermut_len = self._handle.get_function[fn_jvalueitermut_len]("JValueIterMut_len")
        
        self._jvalueitermut_next = self._handle.get_function[fn_jvalueitermut_next]("JValueIterMut_next")
        
        self._jvalueitermut_destroy = self._handle.get_function[fn_jvalueitermut_destroy]("JValueIterMut_destroy")


@always_inline
fn jvalueitermut_len(self: UnsafePointer[JValueIterMut]) -> c_size_t:
    return __wrapper._jvalueitermut_len(self)

@always_inline
fn jvalueitermut_next(self: UnsafePointer[JValueIterMut]) -> UnsafePointer[JValueMut]:
    return __wrapper._jvalueitermut_next(self)

@always_inline
fn jvalueitermut_destroy(self: UnsafePointer[JValueIterMut]) -> None:
    return __wrapper._jvalueitermut_destroy(self)

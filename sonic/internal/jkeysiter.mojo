
from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *


from .jkeysiter_d import *



alias fn_jkeysiter_next = fn (self: UnsafePointer[JKeysIter], write: UnsafePointer[DiplomatWrite]) -> None

alias fn_jkeysiter_len = fn (self: UnsafePointer[JKeysIter]) -> c_size_t

alias fn_jkeysiter_get = fn (self: UnsafePointer[JKeysIter], index: c_size_t, default: DiplomatStringView, write: UnsafePointer[DiplomatWrite]) -> None

alias fn_jkeysiter_destroy = fn (self: UnsafePointer[JKeysIter]) -> None

var __wrapper = _DLWrapper()

@value
struct _DLWrapper:
    var _handle: DLHandle
    
    var _jkeysiter_next: fn_jkeysiter_next
    
    var _jkeysiter_len: fn_jkeysiter_len
    
    var _jkeysiter_get: fn_jkeysiter_get
    
    var _jkeysiter_destroy: fn_jkeysiter_destroy

    fn __init__(out self):
        self._handle = DLHandle(LIBNAME)
        
        self._jkeysiter_next = self._handle.get_function[fn_jkeysiter_next]("JKeysIter_next")
        
        self._jkeysiter_len = self._handle.get_function[fn_jkeysiter_len]("JKeysIter_len")
        
        self._jkeysiter_get = self._handle.get_function[fn_jkeysiter_get]("JKeysIter_get")
        
        self._jkeysiter_destroy = self._handle.get_function[fn_jkeysiter_destroy]("JKeysIter_destroy")


@always_inline
fn jkeysiter_next(self: UnsafePointer[JKeysIter], write: UnsafePointer[DiplomatWrite]) -> None:
    return __wrapper._jkeysiter_next(self, write)

@always_inline
fn jkeysiter_len(self: UnsafePointer[JKeysIter]) -> c_size_t:
    return __wrapper._jkeysiter_len(self)

@always_inline
fn jkeysiter_get(self: UnsafePointer[JKeysIter], index: c_size_t, default: DiplomatStringView, write: UnsafePointer[DiplomatWrite]) -> None:
    return __wrapper._jkeysiter_get(self, index, default, write)

@always_inline
fn jkeysiter_destroy(self: UnsafePointer[JKeysIter]) -> None:
    return __wrapper._jkeysiter_destroy(self)

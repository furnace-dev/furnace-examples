
from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *

from .jvaluemut_d import *

from .jkeyvaluemut_d import *



alias fn_jkeyvaluemut_get_key = fn (self: UnsafePointer[JKeyValueMut], write: UnsafePointer[DiplomatWrite]) -> None

alias fn_jkeyvaluemut_get_value_mut = fn (self: UnsafePointer[JKeyValueMut]) -> UnsafePointer[JValueMut]

alias fn_jkeyvaluemut_destroy = fn (self: UnsafePointer[JKeyValueMut]) -> None

var __wrapper = _DLWrapper()

@value
struct _DLWrapper:
    var _handle: DLHandle
    
    var _jkeyvaluemut_get_key: fn_jkeyvaluemut_get_key
    
    var _jkeyvaluemut_get_value_mut: fn_jkeyvaluemut_get_value_mut
    
    var _jkeyvaluemut_destroy: fn_jkeyvaluemut_destroy

    fn __init__(out self):
        self._handle = DLHandle(LIBNAME)
        
        self._jkeyvaluemut_get_key = self._handle.get_function[fn_jkeyvaluemut_get_key]("JKeyValueMut_get_key")
        
        self._jkeyvaluemut_get_value_mut = self._handle.get_function[fn_jkeyvaluemut_get_value_mut]("JKeyValueMut_get_value_mut")
        
        self._jkeyvaluemut_destroy = self._handle.get_function[fn_jkeyvaluemut_destroy]("JKeyValueMut_destroy")


@always_inline
fn jkeyvaluemut_get_key(self: UnsafePointer[JKeyValueMut], write: UnsafePointer[DiplomatWrite]) -> None:
    return __wrapper._jkeyvaluemut_get_key(self, write)

@always_inline
fn jkeyvaluemut_get_value_mut(self: UnsafePointer[JKeyValueMut]) -> UnsafePointer[JValueMut]:
    return __wrapper._jkeyvaluemut_get_value_mut(self)

@always_inline
fn jkeyvaluemut_destroy(self: UnsafePointer[JKeyValueMut]) -> None:
    return __wrapper._jkeyvaluemut_destroy(self)

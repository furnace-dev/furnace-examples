
from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *

from .jvalueref_d import *

from .jkeyvalueref_d import *



alias fn_jkeyvalueref_get_key = fn (self: UnsafePointer[JKeyValueRef], write: UnsafePointer[DiplomatWrite]) -> None

alias fn_jkeyvalueref_get_value = fn (self: UnsafePointer[JKeyValueRef]) -> UnsafePointer[JValueRef]

alias fn_jkeyvalueref_destroy = fn (self: UnsafePointer[JKeyValueRef]) -> None

var __wrapper = _DLWrapper()

@value
struct _DLWrapper:
    var _handle: DLHandle
    
    var _jkeyvalueref_get_key: fn_jkeyvalueref_get_key
    
    var _jkeyvalueref_get_value: fn_jkeyvalueref_get_value
    
    var _jkeyvalueref_destroy: fn_jkeyvalueref_destroy

    fn __init__(out self):
        self._handle = DLHandle(LIBNAME)
        
        self._jkeyvalueref_get_key = self._handle.get_function[fn_jkeyvalueref_get_key]("JKeyValueRef_get_key")
        
        self._jkeyvalueref_get_value = self._handle.get_function[fn_jkeyvalueref_get_value]("JKeyValueRef_get_value")
        
        self._jkeyvalueref_destroy = self._handle.get_function[fn_jkeyvalueref_destroy]("JKeyValueRef_destroy")


@always_inline
fn jkeyvalueref_get_key(self: UnsafePointer[JKeyValueRef], write: UnsafePointer[DiplomatWrite]) -> None:
    return __wrapper._jkeyvalueref_get_key(self, write)

@always_inline
fn jkeyvalueref_get_value(self: UnsafePointer[JKeyValueRef]) -> UnsafePointer[JValueRef]:
    return __wrapper._jkeyvalueref_get_value(self)

@always_inline
fn jkeyvalueref_destroy(self: UnsafePointer[JKeyValueRef]) -> None:
    return __wrapper._jkeyvalueref_destroy(self)

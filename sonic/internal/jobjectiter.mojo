
from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *

from .jkeyvalueref_d import *

from .jobjectiter_d import *



alias fn_jobjectiter_next = fn (self: UnsafePointer[JObjectIter]) -> UnsafePointer[JKeyValueRef]

alias fn_jobjectiter_destroy = fn (self: UnsafePointer[JObjectIter]) -> None

var __wrapper = _DLWrapper()

@value
struct _DLWrapper:
    var _handle: DLHandle
    
    var _jobjectiter_next: fn_jobjectiter_next
    
    var _jobjectiter_destroy: fn_jobjectiter_destroy

    fn __init__(out self):
        self._handle = DLHandle(LIBNAME)
        
        self._jobjectiter_next = self._handle.get_function[fn_jobjectiter_next]("JObjectIter_next")
        
        self._jobjectiter_destroy = self._handle.get_function[fn_jobjectiter_destroy]("JObjectIter_destroy")


@always_inline
fn jobjectiter_next(self: UnsafePointer[JObjectIter]) -> UnsafePointer[JKeyValueRef]:
    return __wrapper._jobjectiter_next(self)

@always_inline
fn jobjectiter_destroy(self: UnsafePointer[JObjectIter]) -> None:
    return __wrapper._jobjectiter_destroy(self)

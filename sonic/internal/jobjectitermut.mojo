
from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *

from .jkeyvaluemut_d import *

from .jobjectitermut_d import *



alias fn_jobjectitermut_next = fn (self: UnsafePointer[JObjectIterMut]) -> UnsafePointer[JKeyValueMut]

alias fn_jobjectitermut_destroy = fn (self: UnsafePointer[JObjectIterMut]) -> None

var __wrapper = _DLWrapper()

@value
struct _DLWrapper:
    var _handle: DLHandle
    
    var _jobjectitermut_next: fn_jobjectitermut_next
    
    var _jobjectitermut_destroy: fn_jobjectitermut_destroy

    fn __init__(out self):
        self._handle = DLHandle(LIBNAME)
        
        self._jobjectitermut_next = self._handle.get_function[fn_jobjectitermut_next]("JObjectIterMut_next")
        
        self._jobjectitermut_destroy = self._handle.get_function[fn_jobjectitermut_destroy]("JObjectIterMut_destroy")


@always_inline
fn jobjectitermut_next(self: UnsafePointer[JObjectIterMut]) -> UnsafePointer[JKeyValueMut]:
    return __wrapper._jobjectitermut_next(self)

@always_inline
fn jobjectitermut_destroy(self: UnsafePointer[JObjectIterMut]) -> None:
    return __wrapper._jobjectitermut_destroy(self)


from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *

from .jarray_d import *
from .jarrayref_d import *
from .jobject_d import *
from .jobjectref_d import *
from .jsontype_d import *
from .jvalue_d import *

from .jvalueref_d import *



alias fn_jvalueref_clone = fn (self: UnsafePointer[JValueRef]) -> UnsafePointer[JValue]

alias fn_jvalueref_get_type = fn (self: UnsafePointer[JValueRef]) -> JsonType

alias fn_jvalueref_is_true = fn (self: UnsafePointer[JValueRef]) -> c_bool

alias fn_jvalueref_is_false = fn (self: UnsafePointer[JValueRef]) -> c_bool

alias fn_jvalueref_is_i64 = fn (self: UnsafePointer[JValueRef]) -> c_bool

alias fn_jvalueref_is_u64 = fn (self: UnsafePointer[JValueRef]) -> c_bool

alias fn_jvalueref_is_f64 = fn (self: UnsafePointer[JValueRef]) -> c_bool

alias fn_jvalueref_is_str = fn (self: UnsafePointer[JValueRef]) -> c_bool

alias fn_jvalueref_is_object = fn (self: UnsafePointer[JValueRef]) -> c_bool

alias fn_jvalueref_is_array = fn (self: UnsafePointer[JValueRef]) -> c_bool

alias fn_jvalueref_as_bool = fn (self: UnsafePointer[JValueRef]) -> OptionBoolResult

alias fn_jvalueref_as_i64 = fn (self: UnsafePointer[JValueRef]) -> OptionI64Result

alias fn_jvalueref_as_u64 = fn (self: UnsafePointer[JValueRef]) -> OptionU64Result

alias fn_jvalueref_as_f64 = fn (self: UnsafePointer[JValueRef]) -> OptionF64Result

alias fn_jvalueref_as_str = fn (self: UnsafePointer[JValueRef], default: DiplomatStringView, write: UnsafePointer[DiplomatWrite]) -> None

alias fn_jvalueref_as_str_ref = fn (self: UnsafePointer[JValueRef], default: DiplomatStringView) -> DiplomatStringView

alias fn_jvalueref_as_object = fn (self: UnsafePointer[JValueRef]) -> UnsafePointer[JObject]

alias fn_jvalueref_as_object_ref = fn (self: UnsafePointer[JValueRef]) -> UnsafePointer[JObjectRef]

alias fn_jvalueref_as_array = fn (self: UnsafePointer[JValueRef]) -> UnsafePointer[JArray]

alias fn_jvalueref_as_array_ref = fn (self: UnsafePointer[JValueRef]) -> UnsafePointer[JArrayRef]

alias fn_jvalueref_to_string = fn (self: UnsafePointer[JValueRef], write: UnsafePointer[DiplomatWrite]) -> None

alias fn_jvalueref_destroy = fn (self: UnsafePointer[JValueRef]) -> None

var __wrapper = _DLWrapper()

@value
struct _DLWrapper:
    var _handle: DLHandle
    
    var _jvalueref_clone: fn_jvalueref_clone
    
    var _jvalueref_get_type: fn_jvalueref_get_type
    
    var _jvalueref_is_true: fn_jvalueref_is_true
    
    var _jvalueref_is_false: fn_jvalueref_is_false
    
    var _jvalueref_is_i64: fn_jvalueref_is_i64
    
    var _jvalueref_is_u64: fn_jvalueref_is_u64
    
    var _jvalueref_is_f64: fn_jvalueref_is_f64
    
    var _jvalueref_is_str: fn_jvalueref_is_str
    
    var _jvalueref_is_object: fn_jvalueref_is_object
    
    var _jvalueref_is_array: fn_jvalueref_is_array
    
    var _jvalueref_as_bool: fn_jvalueref_as_bool
    
    var _jvalueref_as_i64: fn_jvalueref_as_i64
    
    var _jvalueref_as_u64: fn_jvalueref_as_u64
    
    var _jvalueref_as_f64: fn_jvalueref_as_f64
    
    var _jvalueref_as_str: fn_jvalueref_as_str
    
    var _jvalueref_as_str_ref: fn_jvalueref_as_str_ref
    
    var _jvalueref_as_object: fn_jvalueref_as_object
    
    var _jvalueref_as_object_ref: fn_jvalueref_as_object_ref
    
    var _jvalueref_as_array: fn_jvalueref_as_array
    
    var _jvalueref_as_array_ref: fn_jvalueref_as_array_ref
    
    var _jvalueref_to_string: fn_jvalueref_to_string
    
    var _jvalueref_destroy: fn_jvalueref_destroy

    fn __init__(out self):
        self._handle = DLHandle(LIBNAME)
        
        self._jvalueref_clone = self._handle.get_function[fn_jvalueref_clone]("JValueRef_clone")
        
        self._jvalueref_get_type = self._handle.get_function[fn_jvalueref_get_type]("JValueRef_get_type")
        
        self._jvalueref_is_true = self._handle.get_function[fn_jvalueref_is_true]("JValueRef_is_true")
        
        self._jvalueref_is_false = self._handle.get_function[fn_jvalueref_is_false]("JValueRef_is_false")
        
        self._jvalueref_is_i64 = self._handle.get_function[fn_jvalueref_is_i64]("JValueRef_is_i64")
        
        self._jvalueref_is_u64 = self._handle.get_function[fn_jvalueref_is_u64]("JValueRef_is_u64")
        
        self._jvalueref_is_f64 = self._handle.get_function[fn_jvalueref_is_f64]("JValueRef_is_f64")
        
        self._jvalueref_is_str = self._handle.get_function[fn_jvalueref_is_str]("JValueRef_is_str")
        
        self._jvalueref_is_object = self._handle.get_function[fn_jvalueref_is_object]("JValueRef_is_object")
        
        self._jvalueref_is_array = self._handle.get_function[fn_jvalueref_is_array]("JValueRef_is_array")
        
        self._jvalueref_as_bool = self._handle.get_function[fn_jvalueref_as_bool]("JValueRef_as_bool")
        
        self._jvalueref_as_i64 = self._handle.get_function[fn_jvalueref_as_i64]("JValueRef_as_i64")
        
        self._jvalueref_as_u64 = self._handle.get_function[fn_jvalueref_as_u64]("JValueRef_as_u64")
        
        self._jvalueref_as_f64 = self._handle.get_function[fn_jvalueref_as_f64]("JValueRef_as_f64")
        
        self._jvalueref_as_str = self._handle.get_function[fn_jvalueref_as_str]("JValueRef_as_str")
        
        self._jvalueref_as_str_ref = self._handle.get_function[fn_jvalueref_as_str_ref]("JValueRef_as_str_ref")
        
        self._jvalueref_as_object = self._handle.get_function[fn_jvalueref_as_object]("JValueRef_as_object")
        
        self._jvalueref_as_object_ref = self._handle.get_function[fn_jvalueref_as_object_ref]("JValueRef_as_object_ref")
        
        self._jvalueref_as_array = self._handle.get_function[fn_jvalueref_as_array]("JValueRef_as_array")
        
        self._jvalueref_as_array_ref = self._handle.get_function[fn_jvalueref_as_array_ref]("JValueRef_as_array_ref")
        
        self._jvalueref_to_string = self._handle.get_function[fn_jvalueref_to_string]("JValueRef_to_string")
        
        self._jvalueref_destroy = self._handle.get_function[fn_jvalueref_destroy]("JValueRef_destroy")


@always_inline
fn jvalueref_clone(self: UnsafePointer[JValueRef]) -> UnsafePointer[JValue]:
    return __wrapper._jvalueref_clone(self)

@always_inline
fn jvalueref_get_type(self: UnsafePointer[JValueRef]) -> JsonType:
    return __wrapper._jvalueref_get_type(self)

@always_inline
fn jvalueref_is_true(self: UnsafePointer[JValueRef]) -> c_bool:
    return __wrapper._jvalueref_is_true(self)

@always_inline
fn jvalueref_is_false(self: UnsafePointer[JValueRef]) -> c_bool:
    return __wrapper._jvalueref_is_false(self)

@always_inline
fn jvalueref_is_i64(self: UnsafePointer[JValueRef]) -> c_bool:
    return __wrapper._jvalueref_is_i64(self)

@always_inline
fn jvalueref_is_u64(self: UnsafePointer[JValueRef]) -> c_bool:
    return __wrapper._jvalueref_is_u64(self)

@always_inline
fn jvalueref_is_f64(self: UnsafePointer[JValueRef]) -> c_bool:
    return __wrapper._jvalueref_is_f64(self)

@always_inline
fn jvalueref_is_str(self: UnsafePointer[JValueRef]) -> c_bool:
    return __wrapper._jvalueref_is_str(self)

@always_inline
fn jvalueref_is_object(self: UnsafePointer[JValueRef]) -> c_bool:
    return __wrapper._jvalueref_is_object(self)

@always_inline
fn jvalueref_is_array(self: UnsafePointer[JValueRef]) -> c_bool:
    return __wrapper._jvalueref_is_array(self)

@always_inline
fn jvalueref_as_bool(self: UnsafePointer[JValueRef]) -> OptionBoolResult:
    return __wrapper._jvalueref_as_bool(self)

@always_inline
fn jvalueref_as_i64(self: UnsafePointer[JValueRef]) -> OptionI64Result:
    return __wrapper._jvalueref_as_i64(self)

@always_inline
fn jvalueref_as_u64(self: UnsafePointer[JValueRef]) -> OptionU64Result:
    return __wrapper._jvalueref_as_u64(self)

@always_inline
fn jvalueref_as_f64(self: UnsafePointer[JValueRef]) -> OptionF64Result:
    return __wrapper._jvalueref_as_f64(self)

@always_inline
fn jvalueref_as_str(self: UnsafePointer[JValueRef], default: DiplomatStringView, write: UnsafePointer[DiplomatWrite]) -> None:
    return __wrapper._jvalueref_as_str(self, default, write)

@always_inline
fn jvalueref_as_str_ref(self: UnsafePointer[JValueRef], default: DiplomatStringView) -> DiplomatStringView:
    return __wrapper._jvalueref_as_str_ref(self, default)

@always_inline
fn jvalueref_as_object(self: UnsafePointer[JValueRef]) -> UnsafePointer[JObject]:
    return __wrapper._jvalueref_as_object(self)

@always_inline
fn jvalueref_as_object_ref(self: UnsafePointer[JValueRef]) -> UnsafePointer[JObjectRef]:
    return __wrapper._jvalueref_as_object_ref(self)

@always_inline
fn jvalueref_as_array(self: UnsafePointer[JValueRef]) -> UnsafePointer[JArray]:
    return __wrapper._jvalueref_as_array(self)

@always_inline
fn jvalueref_as_array_ref(self: UnsafePointer[JValueRef]) -> UnsafePointer[JArrayRef]:
    return __wrapper._jvalueref_as_array_ref(self)

@always_inline
fn jvalueref_to_string(self: UnsafePointer[JValueRef], write: UnsafePointer[DiplomatWrite]) -> None:
    return __wrapper._jvalueref_to_string(self, write)

@always_inline
fn jvalueref_destroy(self: UnsafePointer[JValueRef]) -> None:
    return __wrapper._jvalueref_destroy(self)

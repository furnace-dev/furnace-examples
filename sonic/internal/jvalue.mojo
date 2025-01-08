
from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *

from .jarray_d import *
from .jarraymut_d import *
from .jobject_d import *
from .jobjectmut_d import *
from .jsontype_d import *

from .jvalue_d import *



alias fn_jvalue_new = fn () -> UnsafePointer[JValue]

alias fn_jvalue_new_bool = fn (value: c_bool) -> UnsafePointer[JValue]

alias fn_jvalue_new_i64 = fn (value: c_int64) -> UnsafePointer[JValue]

alias fn_jvalue_new_u64 = fn (value: c_uint64) -> UnsafePointer[JValue]

alias fn_jvalue_new_f64 = fn (value: c_double) -> UnsafePointer[JValue]

alias fn_jvalue_new_str = fn (value: DiplomatStringView) -> UnsafePointer[JValue]

alias fn_jvalue_from_str = fn (s: DiplomatStringView) -> UnsafePointer[JValue]

alias fn_jvalue_clone = fn (self: UnsafePointer[JValue]) -> UnsafePointer[JValue]

alias fn_jvalue_get_type = fn (self: UnsafePointer[JValue]) -> JsonType

alias fn_jvalue_is_boolean = fn (self: UnsafePointer[JValue]) -> c_bool

alias fn_jvalue_is_true = fn (self: UnsafePointer[JValue]) -> c_bool

alias fn_jvalue_is_false = fn (self: UnsafePointer[JValue]) -> c_bool

alias fn_jvalue_is_null = fn (self: UnsafePointer[JValue]) -> c_bool

alias fn_jvalue_is_number = fn (self: UnsafePointer[JValue]) -> c_bool

alias fn_jvalue_is_str = fn (self: UnsafePointer[JValue]) -> c_bool

alias fn_jvalue_is_array = fn (self: UnsafePointer[JValue]) -> c_bool

alias fn_jvalue_is_object = fn (self: UnsafePointer[JValue]) -> c_bool

alias fn_jvalue_is_f64 = fn (self: UnsafePointer[JValue]) -> c_bool

alias fn_jvalue_is_i64 = fn (self: UnsafePointer[JValue]) -> c_bool

alias fn_jvalue_is_u64 = fn (self: UnsafePointer[JValue]) -> c_bool

alias fn_jvalue_as_bool = fn (self: UnsafePointer[JValue]) -> OptionBoolResult

alias fn_jvalue_as_i64 = fn (self: UnsafePointer[JValue]) -> OptionI64Result

alias fn_jvalue_as_u64 = fn (self: UnsafePointer[JValue]) -> OptionU64Result

alias fn_jvalue_as_f64 = fn (self: UnsafePointer[JValue]) -> OptionF64Result

alias fn_jvalue_as_str = fn (self: UnsafePointer[JValue], default: DiplomatStringView, write: UnsafePointer[DiplomatWrite]) -> None

alias fn_jvalue_as_str_ref = fn (self: UnsafePointer[JValue], default: DiplomatStringView) -> DiplomatStringView

alias fn_jvalue_as_object = fn (self: UnsafePointer[JValue]) -> UnsafePointer[JObject]

alias fn_jvalue_as_object_mut = fn (self: UnsafePointer[JValue]) -> UnsafePointer[JObjectMut]

alias fn_jvalue_as_array = fn (self: UnsafePointer[JValue]) -> UnsafePointer[JArray]

alias fn_jvalue_as_array_mut = fn (self: UnsafePointer[JValue]) -> UnsafePointer[JArrayMut]

alias fn_jvalue_to_string = fn (self: UnsafePointer[JValue], write: UnsafePointer[DiplomatWrite]) -> None

alias fn_jvalue_destroy = fn (self: UnsafePointer[JValue]) -> None

var __wrapper = _DLWrapper()

@value
struct _DLWrapper:
    var _handle: DLHandle
    
    var _jvalue_new: fn_jvalue_new
    
    var _jvalue_new_bool: fn_jvalue_new_bool
    
    var _jvalue_new_i64: fn_jvalue_new_i64
    
    var _jvalue_new_u64: fn_jvalue_new_u64
    
    var _jvalue_new_f64: fn_jvalue_new_f64
    
    var _jvalue_new_str: fn_jvalue_new_str
    
    var _jvalue_from_str: fn_jvalue_from_str
    
    var _jvalue_clone: fn_jvalue_clone
    
    var _jvalue_get_type: fn_jvalue_get_type
    
    var _jvalue_is_boolean: fn_jvalue_is_boolean
    
    var _jvalue_is_true: fn_jvalue_is_true
    
    var _jvalue_is_false: fn_jvalue_is_false
    
    var _jvalue_is_null: fn_jvalue_is_null
    
    var _jvalue_is_number: fn_jvalue_is_number
    
    var _jvalue_is_str: fn_jvalue_is_str
    
    var _jvalue_is_array: fn_jvalue_is_array
    
    var _jvalue_is_object: fn_jvalue_is_object
    
    var _jvalue_is_f64: fn_jvalue_is_f64
    
    var _jvalue_is_i64: fn_jvalue_is_i64
    
    var _jvalue_is_u64: fn_jvalue_is_u64
    
    var _jvalue_as_bool: fn_jvalue_as_bool
    
    var _jvalue_as_i64: fn_jvalue_as_i64
    
    var _jvalue_as_u64: fn_jvalue_as_u64
    
    var _jvalue_as_f64: fn_jvalue_as_f64
    
    var _jvalue_as_str: fn_jvalue_as_str
    
    var _jvalue_as_str_ref: fn_jvalue_as_str_ref
    
    var _jvalue_as_object: fn_jvalue_as_object
    
    var _jvalue_as_object_mut: fn_jvalue_as_object_mut
    
    var _jvalue_as_array: fn_jvalue_as_array
    
    var _jvalue_as_array_mut: fn_jvalue_as_array_mut
    
    var _jvalue_to_string: fn_jvalue_to_string
    
    var _jvalue_destroy: fn_jvalue_destroy

    fn __init__(out self):
        self._handle = DLHandle(LIBNAME)
        
        self._jvalue_new = self._handle.get_function[fn_jvalue_new]("JValue_new")
        
        self._jvalue_new_bool = self._handle.get_function[fn_jvalue_new_bool]("JValue_new_bool")
        
        self._jvalue_new_i64 = self._handle.get_function[fn_jvalue_new_i64]("JValue_new_i64")
        
        self._jvalue_new_u64 = self._handle.get_function[fn_jvalue_new_u64]("JValue_new_u64")
        
        self._jvalue_new_f64 = self._handle.get_function[fn_jvalue_new_f64]("JValue_new_f64")
        
        self._jvalue_new_str = self._handle.get_function[fn_jvalue_new_str]("JValue_new_str")
        
        self._jvalue_from_str = self._handle.get_function[fn_jvalue_from_str]("JValue_from_str")
        
        self._jvalue_clone = self._handle.get_function[fn_jvalue_clone]("JValue_clone")
        
        self._jvalue_get_type = self._handle.get_function[fn_jvalue_get_type]("JValue_get_type")
        
        self._jvalue_is_boolean = self._handle.get_function[fn_jvalue_is_boolean]("JValue_is_boolean")
        
        self._jvalue_is_true = self._handle.get_function[fn_jvalue_is_true]("JValue_is_true")
        
        self._jvalue_is_false = self._handle.get_function[fn_jvalue_is_false]("JValue_is_false")
        
        self._jvalue_is_null = self._handle.get_function[fn_jvalue_is_null]("JValue_is_null")
        
        self._jvalue_is_number = self._handle.get_function[fn_jvalue_is_number]("JValue_is_number")
        
        self._jvalue_is_str = self._handle.get_function[fn_jvalue_is_str]("JValue_is_str")
        
        self._jvalue_is_array = self._handle.get_function[fn_jvalue_is_array]("JValue_is_array")
        
        self._jvalue_is_object = self._handle.get_function[fn_jvalue_is_object]("JValue_is_object")
        
        self._jvalue_is_f64 = self._handle.get_function[fn_jvalue_is_f64]("JValue_is_f64")
        
        self._jvalue_is_i64 = self._handle.get_function[fn_jvalue_is_i64]("JValue_is_i64")
        
        self._jvalue_is_u64 = self._handle.get_function[fn_jvalue_is_u64]("JValue_is_u64")
        
        self._jvalue_as_bool = self._handle.get_function[fn_jvalue_as_bool]("JValue_as_bool")
        
        self._jvalue_as_i64 = self._handle.get_function[fn_jvalue_as_i64]("JValue_as_i64")
        
        self._jvalue_as_u64 = self._handle.get_function[fn_jvalue_as_u64]("JValue_as_u64")
        
        self._jvalue_as_f64 = self._handle.get_function[fn_jvalue_as_f64]("JValue_as_f64")
        
        self._jvalue_as_str = self._handle.get_function[fn_jvalue_as_str]("JValue_as_str")
        
        self._jvalue_as_str_ref = self._handle.get_function[fn_jvalue_as_str_ref]("JValue_as_str_ref")
        
        self._jvalue_as_object = self._handle.get_function[fn_jvalue_as_object]("JValue_as_object")
        
        self._jvalue_as_object_mut = self._handle.get_function[fn_jvalue_as_object_mut]("JValue_as_object_mut")
        
        self._jvalue_as_array = self._handle.get_function[fn_jvalue_as_array]("JValue_as_array")
        
        self._jvalue_as_array_mut = self._handle.get_function[fn_jvalue_as_array_mut]("JValue_as_array_mut")
        
        self._jvalue_to_string = self._handle.get_function[fn_jvalue_to_string]("JValue_to_string")
        
        self._jvalue_destroy = self._handle.get_function[fn_jvalue_destroy]("JValue_destroy")


@always_inline
fn jvalue_new() -> UnsafePointer[JValue]:
    return __wrapper._jvalue_new()

@always_inline
fn jvalue_new_bool(value: c_bool) -> UnsafePointer[JValue]:
    return __wrapper._jvalue_new_bool(value)

@always_inline
fn jvalue_new_i64(value: c_int64) -> UnsafePointer[JValue]:
    return __wrapper._jvalue_new_i64(value)

@always_inline
fn jvalue_new_u64(value: c_uint64) -> UnsafePointer[JValue]:
    return __wrapper._jvalue_new_u64(value)

@always_inline
fn jvalue_new_f64(value: c_double) -> UnsafePointer[JValue]:
    return __wrapper._jvalue_new_f64(value)

@always_inline
fn jvalue_new_str(value: DiplomatStringView) -> UnsafePointer[JValue]:
    return __wrapper._jvalue_new_str(value)

@always_inline
fn jvalue_from_str(s: DiplomatStringView) -> UnsafePointer[JValue]:
    return __wrapper._jvalue_from_str(s)

@always_inline
fn jvalue_clone(self: UnsafePointer[JValue]) -> UnsafePointer[JValue]:
    return __wrapper._jvalue_clone(self)

@always_inline
fn jvalue_get_type(self: UnsafePointer[JValue]) -> JsonType:
    return __wrapper._jvalue_get_type(self)

@always_inline
fn jvalue_is_boolean(self: UnsafePointer[JValue]) -> c_bool:
    return __wrapper._jvalue_is_boolean(self)

@always_inline
fn jvalue_is_true(self: UnsafePointer[JValue]) -> c_bool:
    return __wrapper._jvalue_is_true(self)

@always_inline
fn jvalue_is_false(self: UnsafePointer[JValue]) -> c_bool:
    return __wrapper._jvalue_is_false(self)

@always_inline
fn jvalue_is_null(self: UnsafePointer[JValue]) -> c_bool:
    return __wrapper._jvalue_is_null(self)

@always_inline
fn jvalue_is_number(self: UnsafePointer[JValue]) -> c_bool:
    return __wrapper._jvalue_is_number(self)

@always_inline
fn jvalue_is_str(self: UnsafePointer[JValue]) -> c_bool:
    return __wrapper._jvalue_is_str(self)

@always_inline
fn jvalue_is_array(self: UnsafePointer[JValue]) -> c_bool:
    return __wrapper._jvalue_is_array(self)

@always_inline
fn jvalue_is_object(self: UnsafePointer[JValue]) -> c_bool:
    return __wrapper._jvalue_is_object(self)

@always_inline
fn jvalue_is_f64(self: UnsafePointer[JValue]) -> c_bool:
    return __wrapper._jvalue_is_f64(self)

@always_inline
fn jvalue_is_i64(self: UnsafePointer[JValue]) -> c_bool:
    return __wrapper._jvalue_is_i64(self)

@always_inline
fn jvalue_is_u64(self: UnsafePointer[JValue]) -> c_bool:
    return __wrapper._jvalue_is_u64(self)

@always_inline
fn jvalue_as_bool(self: UnsafePointer[JValue]) -> OptionBoolResult:
    return __wrapper._jvalue_as_bool(self)

@always_inline
fn jvalue_as_i64(self: UnsafePointer[JValue]) -> OptionI64Result:
    return __wrapper._jvalue_as_i64(self)

@always_inline
fn jvalue_as_u64(self: UnsafePointer[JValue]) -> OptionU64Result:
    return __wrapper._jvalue_as_u64(self)

@always_inline
fn jvalue_as_f64(self: UnsafePointer[JValue]) -> OptionF64Result:
    return __wrapper._jvalue_as_f64(self)

@always_inline
fn jvalue_as_str(self: UnsafePointer[JValue], default: DiplomatStringView, write: UnsafePointer[DiplomatWrite]) -> None:
    return __wrapper._jvalue_as_str(self, default, write)

@always_inline
fn jvalue_as_str_ref(self: UnsafePointer[JValue], default: DiplomatStringView) -> DiplomatStringView:
    return __wrapper._jvalue_as_str_ref(self, default)

@always_inline
fn jvalue_as_object(self: UnsafePointer[JValue]) -> UnsafePointer[JObject]:
    return __wrapper._jvalue_as_object(self)

@always_inline
fn jvalue_as_object_mut(self: UnsafePointer[JValue]) -> UnsafePointer[JObjectMut]:
    return __wrapper._jvalue_as_object_mut(self)

@always_inline
fn jvalue_as_array(self: UnsafePointer[JValue]) -> UnsafePointer[JArray]:
    return __wrapper._jvalue_as_array(self)

@always_inline
fn jvalue_as_array_mut(self: UnsafePointer[JValue]) -> UnsafePointer[JArrayMut]:
    return __wrapper._jvalue_as_array_mut(self)

@always_inline
fn jvalue_to_string(self: UnsafePointer[JValue], write: UnsafePointer[DiplomatWrite]) -> None:
    return __wrapper._jvalue_to_string(self, write)

@always_inline
fn jvalue_destroy(self: UnsafePointer[JValue]) -> None:
    return __wrapper._jvalue_destroy(self)

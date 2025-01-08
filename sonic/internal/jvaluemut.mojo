
from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *

from .jarraymut_d import *
from .jobjectmut_d import *
from .jsontype_d import *
from .jvalue_d import *

from .jvaluemut_d import *



alias fn_jvaluemut_clone = fn (self: UnsafePointer[JValueMut]) -> UnsafePointer[JValue]

alias fn_jvaluemut_get_type = fn (self: UnsafePointer[JValueMut]) -> JsonType

alias fn_jvaluemut_is_boolean = fn (self: UnsafePointer[JValueMut]) -> c_bool

alias fn_jvaluemut_is_true = fn (self: UnsafePointer[JValueMut]) -> c_bool

alias fn_jvaluemut_is_false = fn (self: UnsafePointer[JValueMut]) -> c_bool

alias fn_jvaluemut_is_null = fn (self: UnsafePointer[JValueMut]) -> c_bool

alias fn_jvaluemut_is_number = fn (self: UnsafePointer[JValueMut]) -> c_bool

alias fn_jvaluemut_is_str = fn (self: UnsafePointer[JValueMut]) -> c_bool

alias fn_jvaluemut_is_array = fn (self: UnsafePointer[JValueMut]) -> c_bool

alias fn_jvaluemut_is_object = fn (self: UnsafePointer[JValueMut]) -> c_bool

alias fn_jvaluemut_is_f64 = fn (self: UnsafePointer[JValueMut]) -> c_bool

alias fn_jvaluemut_is_i64 = fn (self: UnsafePointer[JValueMut]) -> c_bool

alias fn_jvaluemut_is_u64 = fn (self: UnsafePointer[JValueMut]) -> c_bool

alias fn_jvaluemut_as_bool = fn (self: UnsafePointer[JValueMut]) -> OptionBoolResult

alias fn_jvaluemut_as_i64 = fn (self: UnsafePointer[JValueMut]) -> OptionI64Result

alias fn_jvaluemut_as_u64 = fn (self: UnsafePointer[JValueMut]) -> OptionU64Result

alias fn_jvaluemut_as_f64 = fn (self: UnsafePointer[JValueMut]) -> OptionF64Result

alias fn_jvaluemut_as_str = fn (self: UnsafePointer[JValueMut], default: DiplomatStringView, write: UnsafePointer[DiplomatWrite]) -> None

alias fn_jvaluemut_as_str_ref = fn (self: UnsafePointer[JValueMut], default: DiplomatStringView) -> DiplomatStringView

alias fn_jvaluemut_as_object_mut = fn (self: UnsafePointer[JValueMut]) -> UnsafePointer[JObjectMut]

alias fn_jvaluemut_as_array_mut = fn (self: UnsafePointer[JValueMut]) -> UnsafePointer[JArrayMut]

alias fn_jvaluemut_to_string = fn (self: UnsafePointer[JValueMut], write: UnsafePointer[DiplomatWrite]) -> None

alias fn_jvaluemut_destroy = fn (self: UnsafePointer[JValueMut]) -> None

var __wrapper = _DLWrapper()

@value
struct _DLWrapper:
    var _handle: DLHandle
    
    var _jvaluemut_clone: fn_jvaluemut_clone
    
    var _jvaluemut_get_type: fn_jvaluemut_get_type
    
    var _jvaluemut_is_boolean: fn_jvaluemut_is_boolean
    
    var _jvaluemut_is_true: fn_jvaluemut_is_true
    
    var _jvaluemut_is_false: fn_jvaluemut_is_false
    
    var _jvaluemut_is_null: fn_jvaluemut_is_null
    
    var _jvaluemut_is_number: fn_jvaluemut_is_number
    
    var _jvaluemut_is_str: fn_jvaluemut_is_str
    
    var _jvaluemut_is_array: fn_jvaluemut_is_array
    
    var _jvaluemut_is_object: fn_jvaluemut_is_object
    
    var _jvaluemut_is_f64: fn_jvaluemut_is_f64
    
    var _jvaluemut_is_i64: fn_jvaluemut_is_i64
    
    var _jvaluemut_is_u64: fn_jvaluemut_is_u64
    
    var _jvaluemut_as_bool: fn_jvaluemut_as_bool
    
    var _jvaluemut_as_i64: fn_jvaluemut_as_i64
    
    var _jvaluemut_as_u64: fn_jvaluemut_as_u64
    
    var _jvaluemut_as_f64: fn_jvaluemut_as_f64
    
    var _jvaluemut_as_str: fn_jvaluemut_as_str
    
    var _jvaluemut_as_str_ref: fn_jvaluemut_as_str_ref
    
    var _jvaluemut_as_object_mut: fn_jvaluemut_as_object_mut
    
    var _jvaluemut_as_array_mut: fn_jvaluemut_as_array_mut
    
    var _jvaluemut_to_string: fn_jvaluemut_to_string
    
    var _jvaluemut_destroy: fn_jvaluemut_destroy

    fn __init__(out self):
        self._handle = DLHandle(LIBNAME)
        
        self._jvaluemut_clone = self._handle.get_function[fn_jvaluemut_clone]("JValueMut_clone")
        
        self._jvaluemut_get_type = self._handle.get_function[fn_jvaluemut_get_type]("JValueMut_get_type")
        
        self._jvaluemut_is_boolean = self._handle.get_function[fn_jvaluemut_is_boolean]("JValueMut_is_boolean")
        
        self._jvaluemut_is_true = self._handle.get_function[fn_jvaluemut_is_true]("JValueMut_is_true")
        
        self._jvaluemut_is_false = self._handle.get_function[fn_jvaluemut_is_false]("JValueMut_is_false")
        
        self._jvaluemut_is_null = self._handle.get_function[fn_jvaluemut_is_null]("JValueMut_is_null")
        
        self._jvaluemut_is_number = self._handle.get_function[fn_jvaluemut_is_number]("JValueMut_is_number")
        
        self._jvaluemut_is_str = self._handle.get_function[fn_jvaluemut_is_str]("JValueMut_is_str")
        
        self._jvaluemut_is_array = self._handle.get_function[fn_jvaluemut_is_array]("JValueMut_is_array")
        
        self._jvaluemut_is_object = self._handle.get_function[fn_jvaluemut_is_object]("JValueMut_is_object")
        
        self._jvaluemut_is_f64 = self._handle.get_function[fn_jvaluemut_is_f64]("JValueMut_is_f64")
        
        self._jvaluemut_is_i64 = self._handle.get_function[fn_jvaluemut_is_i64]("JValueMut_is_i64")
        
        self._jvaluemut_is_u64 = self._handle.get_function[fn_jvaluemut_is_u64]("JValueMut_is_u64")
        
        self._jvaluemut_as_bool = self._handle.get_function[fn_jvaluemut_as_bool]("JValueMut_as_bool")
        
        self._jvaluemut_as_i64 = self._handle.get_function[fn_jvaluemut_as_i64]("JValueMut_as_i64")
        
        self._jvaluemut_as_u64 = self._handle.get_function[fn_jvaluemut_as_u64]("JValueMut_as_u64")
        
        self._jvaluemut_as_f64 = self._handle.get_function[fn_jvaluemut_as_f64]("JValueMut_as_f64")
        
        self._jvaluemut_as_str = self._handle.get_function[fn_jvaluemut_as_str]("JValueMut_as_str")
        
        self._jvaluemut_as_str_ref = self._handle.get_function[fn_jvaluemut_as_str_ref]("JValueMut_as_str_ref")
        
        self._jvaluemut_as_object_mut = self._handle.get_function[fn_jvaluemut_as_object_mut]("JValueMut_as_object_mut")
        
        self._jvaluemut_as_array_mut = self._handle.get_function[fn_jvaluemut_as_array_mut]("JValueMut_as_array_mut")
        
        self._jvaluemut_to_string = self._handle.get_function[fn_jvaluemut_to_string]("JValueMut_to_string")
        
        self._jvaluemut_destroy = self._handle.get_function[fn_jvaluemut_destroy]("JValueMut_destroy")


@always_inline
fn jvaluemut_clone(self: UnsafePointer[JValueMut]) -> UnsafePointer[JValue]:
    return __wrapper._jvaluemut_clone(self)

@always_inline
fn jvaluemut_get_type(self: UnsafePointer[JValueMut]) -> JsonType:
    return __wrapper._jvaluemut_get_type(self)

@always_inline
fn jvaluemut_is_boolean(self: UnsafePointer[JValueMut]) -> c_bool:
    return __wrapper._jvaluemut_is_boolean(self)

@always_inline
fn jvaluemut_is_true(self: UnsafePointer[JValueMut]) -> c_bool:
    return __wrapper._jvaluemut_is_true(self)

@always_inline
fn jvaluemut_is_false(self: UnsafePointer[JValueMut]) -> c_bool:
    return __wrapper._jvaluemut_is_false(self)

@always_inline
fn jvaluemut_is_null(self: UnsafePointer[JValueMut]) -> c_bool:
    return __wrapper._jvaluemut_is_null(self)

@always_inline
fn jvaluemut_is_number(self: UnsafePointer[JValueMut]) -> c_bool:
    return __wrapper._jvaluemut_is_number(self)

@always_inline
fn jvaluemut_is_str(self: UnsafePointer[JValueMut]) -> c_bool:
    return __wrapper._jvaluemut_is_str(self)

@always_inline
fn jvaluemut_is_array(self: UnsafePointer[JValueMut]) -> c_bool:
    return __wrapper._jvaluemut_is_array(self)

@always_inline
fn jvaluemut_is_object(self: UnsafePointer[JValueMut]) -> c_bool:
    return __wrapper._jvaluemut_is_object(self)

@always_inline
fn jvaluemut_is_f64(self: UnsafePointer[JValueMut]) -> c_bool:
    return __wrapper._jvaluemut_is_f64(self)

@always_inline
fn jvaluemut_is_i64(self: UnsafePointer[JValueMut]) -> c_bool:
    return __wrapper._jvaluemut_is_i64(self)

@always_inline
fn jvaluemut_is_u64(self: UnsafePointer[JValueMut]) -> c_bool:
    return __wrapper._jvaluemut_is_u64(self)

@always_inline
fn jvaluemut_as_bool(self: UnsafePointer[JValueMut]) -> OptionBoolResult:
    return __wrapper._jvaluemut_as_bool(self)

@always_inline
fn jvaluemut_as_i64(self: UnsafePointer[JValueMut]) -> OptionI64Result:
    return __wrapper._jvaluemut_as_i64(self)

@always_inline
fn jvaluemut_as_u64(self: UnsafePointer[JValueMut]) -> OptionU64Result:
    return __wrapper._jvaluemut_as_u64(self)

@always_inline
fn jvaluemut_as_f64(self: UnsafePointer[JValueMut]) -> OptionF64Result:
    return __wrapper._jvaluemut_as_f64(self)

@always_inline
fn jvaluemut_as_str(self: UnsafePointer[JValueMut], default: DiplomatStringView, write: UnsafePointer[DiplomatWrite]) -> None:
    return __wrapper._jvaluemut_as_str(self, default, write)

@always_inline
fn jvaluemut_as_str_ref(self: UnsafePointer[JValueMut], default: DiplomatStringView) -> DiplomatStringView:
    return __wrapper._jvaluemut_as_str_ref(self, default)

@always_inline
fn jvaluemut_as_object_mut(self: UnsafePointer[JValueMut]) -> UnsafePointer[JObjectMut]:
    return __wrapper._jvaluemut_as_object_mut(self)

@always_inline
fn jvaluemut_as_array_mut(self: UnsafePointer[JValueMut]) -> UnsafePointer[JArrayMut]:
    return __wrapper._jvaluemut_as_array_mut(self)

@always_inline
fn jvaluemut_to_string(self: UnsafePointer[JValueMut], write: UnsafePointer[DiplomatWrite]) -> None:
    return __wrapper._jvaluemut_to_string(self, write)

@always_inline
fn jvaluemut_destroy(self: UnsafePointer[JValueMut]) -> None:
    return __wrapper._jvaluemut_destroy(self)

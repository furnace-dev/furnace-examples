
from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *



@value
@register_passable("trivial")
struct JsonType:
    var _value: UInt32
    alias JsonType_Null = JsonType(0)
    alias JsonType_Boolean = JsonType(1)
    alias JsonType_Number = JsonType(2)
    alias JsonType_String = JsonType(3)
    alias JsonType_Object = JsonType(4)
    alias JsonType_Array = JsonType(5)

    fn __eq__(self, other: JsonType) -> Bool:
        return self._value == other._value


@value
@register_passable("trivial")
struct JsonType_option:
    var ok: JsonType
    var is_ok: c_bool

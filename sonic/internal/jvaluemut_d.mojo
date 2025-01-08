
from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *



@value
@register_passable("trivial")
struct JValueMut:
    pass

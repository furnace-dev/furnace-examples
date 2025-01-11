# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from sys import external_call
from memory import UnsafePointer


fn uname() -> UnsafePointer[Int8]:
    """C library <sys/un.h> function `uname`.
    Returns a pointer to a `struct utsname` containing information about the
    current operating system.
    """
    return external_call["uname", UnsafePointer[Int8]]()
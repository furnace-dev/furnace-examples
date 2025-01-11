# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from memory import UnsafePointer
from sys import external_call

from sys.info import is_x86, is_64bit

from .constant import c_schar


fn strlen(s: UnsafePointer[UInt8]) -> Int:
    """
        Libc POSIX `strlen` function.

        Reference: https://man7.org/linux/man-pages/man3/strlen.3p.html
        Fn signature: size_t strlen(const char *s)

        Args: s: A pointer to a C string.
        Returns: The length of the string.
    """
    return external_call["strlen", Int, UnsafePointer[UInt8]](s)


fn exit(status: c_int):
    """Libc POSIX `exit` function.

    Reference: https://man7.org/linux/man-pages/man3/exit.3.html
    Fn signature: void exit(int status)

    Args:
        status: The exit status.
    Returns: void.
    """
    _ = external_call["exit", c_void, c_int](status)


fn string_to_char_ptr(s: String) -> UnsafePointer[UInt8]:
    """
        Convert a string(only ASCII-characters) to a char pointer .
    """
    var length = len(s)
    var ptr = UnsafePointer[UInt8]().alloc(length)
    for i in range(length):
        ptr.store(i, ord(s[i]))
    ptr.store(length, 0)
    return ptr


fn char_ptr_to_string(c: UnsafePointer[UInt8]) -> String:
    """
        Convert a char pointer to a string.
    """
    length = strlen(c)
    return String(c, length+1)


@register_passable("trivial")
struct CString:
    var data: UnsafePointer[c_schar]

    fn __init__(out self, data: UnsafePointer[c_char]):
        self.data = data.bitcast[c_schar]()

    fn __str__(self) -> String:
        """
            Convert a CString to a String.
        """
        return StringRef(self.data)


@always_inline("nodebug")
fn is_x86_64() -> Bool:
    """
        Check if the current platform is x86_64.
    """
    return is_x86() and is_64bit()

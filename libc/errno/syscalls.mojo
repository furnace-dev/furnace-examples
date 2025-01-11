# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from sys import external_call, os_is_windows
from memory import stack_allocation



fn get_errno() -> Int32:
    """Get a copy of the current value of the `errno` global variable for the
    current thread.

    Returns:
        A copy of the current value of `errno` for the current thread.
    """

    @parameter
    if os_is_windows():
        var errno = stack_allocation[1, Int32]()
        _ = external_call["_get_errno", Int8, UnsafePointer[Int32]](errno)
        return errno[]
    else:
        return external_call["__errno_location", UnsafePointer[Int32]]()[]
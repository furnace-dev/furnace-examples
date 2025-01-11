# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from sys import external_call
from memory import UnsafePointer


@register_passable("trivial")
struct Rlimit:
    var rlim_cur: UInt32
    var rlim_max: UInt32


fn getrlimit(resource: Int32, rlimit: UnsafePointer[Rlimit]) -> Int32:
    """C library <sys/resource.h> function `getrlimit`.

    Reference:
        https://man7.org/linux/man-pages/man2/getrlimit.2.html
    
    Args:
        resource: The resource to get the limit for.
        rlimit: The limit to get.
    
    Returns:
        0 on success.
    """
    return external_call["getrlimit", Int32, Int32, UnsafePointer[Rlimit]](resource, rlimit)



fn setrlimit(resource: Int32, rlimit: UnsafePointer[Rlimit]) -> Int32:
    """C library <sys/resource.h> function `setrlimit`.

    Reference:
        https://man7.org/linux/man-pages/man2/setrlimit.2.html
    
    Args:
        resource: The resource to set the limit for.
        rlimit: The limit to set.
    Returns:
        0 on success.
    """
    return external_call["setrlimit", Int32, Int32, UnsafePointer[Rlimit]](resource, rlimit)


fn prlimit(pid: Int32, resource: Int32, new_limit: UnsafePointer[Rlimit], old_limit: UnsafePointer[Rlimit]) -> Int32:
    """C library <sys/resource.h> function `prlimit`.

    Reference:
        https://man7.org/linux/man-pages/man2/prlimit.2.html
    
    Args:
        pid: The process ID to set the limit for.
        resource: The resource to set the limit for.
        new_limit: The new limit to set.
        old_limit: The old limit to set.
    
    Returns:
        0 on success.
    """
    return external_call["prlimit", Int32, Int32, Int32, UnsafePointer[Rlimit], UnsafePointer[Rlimit]](pid, resource, new_limit, old_limit)
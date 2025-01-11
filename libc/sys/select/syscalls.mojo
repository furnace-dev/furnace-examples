# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from sys import external_call
from memory import UnsafePointer


@register_passable("trivial")
struct Timeval:
    var tv_sec: Int32
    var tv_usec: Int32


fn select(nfds: Int32, read_set: UnsafePointer[NoneType], write_set: UnsafePointer[NoneType], error_set: UnsafePointer[NoneType], timeout: UnsafePointer[Timeval]) -> Int32:
    """C library <sys/select.h> function `select`.

    Reference:
        https://pubs.opengroup.org/onlinepubs/9699919799/functions/select.html

    Args:
        nfds: Number of file descriptors to check.
        read_set: Set of file descriptors to check for read availability.
        write_set: Set of file descriptors to check for write availability.
        error_set: Set of file descriptors to check for error availability.
        timeout: Timeout in seconds and microseconds .

    Returns:
        Int32: number of file descriptors ready .
    """
    return external_call["select", Int32, Int32, UnsafePointer[NoneType], UnsafePointer[NoneType], UnsafePointer[NoneType], UnsafePointer[Timeval]](nfds, read_set, write_set, error_set, timeout)


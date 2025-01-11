# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from sys import external_call
from memory import UnsafePointer


fn getrandom(buf: UnsafePointer[Int8], buflen: UInt64, flags: UInt32) -> UInt64:
    """C library <sys/random.h> function `getrandom`.

    Reference:
        https://man7.org/linux/man-pages/man2/getrandom.2.html

    Args:
        buf: The buffer to store the random data.
        buflen: The length of the buffer.
        flags: The flags to use for getrandom.

    Returns:
        The number of bytes written to the buffer.
    """
    return external_call["getrandom", UInt64, UnsafePointer[Int8], UInt64, UInt32](buf, buflen, flags)
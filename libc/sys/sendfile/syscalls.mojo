# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from sys import external_call
from memory import UnsafePointer


fn sendfile(out_fd: Int32, in_fd: Int32, offset: UnsafePointer[Int64], count: Int64) -> Int64:
    """C library <sys/sendfile.h> function `sendfile`.

    Reference:
        https://man7.org/linux/man-pages/man2/sendfile.2.html

    Args:
        out_fd: Output file descriptor.
        in_fd: Input file descriptor.
        offset: Offset in bytes.
        count: Number of bytes to transfer.

    Description:
        sendfile() transfers data between two file descriptors.

    Returns:
        Int64: number of bytes transferred.
    """
    return external_call["sendfile", Int64, Int32, Int32, UnsafePointer[Int64], Int64](
        out_fd, in_fd, offset, count
    )
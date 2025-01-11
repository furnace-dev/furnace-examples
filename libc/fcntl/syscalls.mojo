# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from memory import UnsafePointer
from sys import external_call



fn creat(path: UnsafePointer[Int8], mode: UInt32) -> Int32:
    """Libc POSIX `creat` function.

    Args:
        path: A path to a file.
        mode: A mode to open the file with.

    Returns:
        A File Descriptor. Otherwise -1 and `errno` is set.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/creat.3p.html).
        Fn signature: `int creat(const char *path, mode_t mode)`.
    """
    return external_call["creat", Int32, UnsafePointer[Int8], UInt32](
        path, mode
    )


fn fcntl(fildes: Int32, cmd: Int32) -> Int32:
    """Libc POSIX `fcntl` function.

    Args:
        fildes: A File Descriptor to close.
        cmd: A command to execute.

    Returns:
        Value 0 on success, -1 on error and `errno` is set.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/close.3p.html).
        Fn signature: `int fcntl(int fildes, int cmd, ...)`.
    """
    return external_call["fcntl", Int32, Int32, Int32](fildes, cmd)


fn open(path: UnsafePointer[Int8], oflag: Int32) -> Int32:
    """Libc POSIX `open` function.

    Args:
        path: A path to a file.
        oflag: A flag to open the file with.

    Returns:
        A File Descriptor. Otherwise -1 and `errno` is set.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/open.3p.html).
        Fn signature: `int open(const char *path, int oflag, ...)`.
    """
    return external_call["open", Int32, UnsafePointer[Int8], Int32](
        path, oflag
    )


fn openat(fd: Int32, path: UnsafePointer[Int8], oflag: Int32) -> Int32:
    """Libc POSIX `open` function.

    Args:
        fd: A File Descriptor to open the file with.
        path: A path to a file.
        oflag: A flag to open the file with.

    Returns:
        A File Descriptor. Otherwise -1 and `errno` is set.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/open.3p.html).
        Fn signature: `int openat(int fd, const char *path, int oflag, ...)`.
    """
    return external_call["openat", Int32, Int32, UnsafePointer[Int8], Int32](
        fd, path, oflag
    )
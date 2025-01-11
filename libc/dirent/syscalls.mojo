# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from sys import external_call
from memory import UnsafePointer
from libc.constant import *


@value
@register_passable("trivial")
struct DIR:
    pass


@value
@register_passable("trivial")
struct dirent:
    var d_ino: c_ulong
    var d_off: c_ulong
    var d_reclen: c_ushort
    var d_type: c_char
    var d_name: UnsafePointer[c_char]


fn closedir(arg: UnsafePointer[DIR]) -> Int32:
    """Libc POSIX `closedir` function.

    Args:
        arg: An accessible object of the type DIR.  If a file descriptor is used to implement type DIR, that file descriptor shall be closed.

    Returns:
        Upon successful completion, closedir() shall return 0; otherwise,
       -1 shall be returned and errno set to indicate the error.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/closedir.3p.html).
        Fn signature: `  int closedir(DIR *dirp)`.
    """
    return external_call["closedir", Int32, UnsafePointer[DIR]](arg)


fn opendir(arg: UnsafePointer[c_char]) -> UnsafePointer[DIR]:
    return external_call["opendir", UnsafePointer[DIR], UnsafePointer[c_char]](arg)


fn readdir(arg: UnsafePointer[DIR]) -> UnsafePointer[dirent]:
    return external_call["readdir", UnsafePointer[dirent], UnsafePointer[DIR]](arg)


fn dirfd(arg: UnsafePointer[DIR])-> Int32:
     """Libc POSIX `dirfd` function.

    Args:
        arg: A file descriptor referring to the same directory.

    Returns:
        Upon successful completion, the dirfd() function shall return an
        integer which contains a file descriptor for the stream pointed
        to by dirp.  Otherwise, it shall return -1 and shall set errno to
        indicate the error.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/dirfd.3p.html).
        Fn signature: `  int dirfd(DIR *dirp)`.
    """
    return external_call["dirfd", Int32, UnsafePointer[DIR]](arg)
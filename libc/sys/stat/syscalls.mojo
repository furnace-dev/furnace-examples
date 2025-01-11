# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from sys import external_call
from memory import UnsafePointer


fn chmod(path: UnsafePointer[Int8], mode: Int32) -> Int32:
    """Libc POSIX `chmod` function.

    Args:
        path: A path to a file.
        mode: A mode to open the file with.

    Returns: A pointer to a socket.
    """
    return external_call[
        "chmod", Int32, UnsafePointer[Int8], Int32  # FnName, RetType  # Args
    ](path, mode)  # Args


fn fchmod(fd: Int32, mode: Int32) -> Int32:
    """Libc POSIX `fchmod` function.

    Args:
        fd: A file descriptor.
        mode: A mode to open the file with.

    Returns: A pointer to a socket.
    """
    return external_call[
        "fchmod", Int32, Int32, Int32
    ](fd, mode)


fn fchmodat(fd: Int32, path: UnsafePointer[Int8], mode: Int32) -> Int32:
    """Libc POSIX `fchmodat` function.

    Args:
        fd: A file descriptor.
        path: A path to a file.
        mode: A mode to open the file with.

    Returns: A pointer to a socket.
    """
    return external_call[
        "fchmodat", Int32, Int32, UnsafePointer[Int8], Int32
    ](fd, path, mode)



fn fstat(fd: Int32, stat: UnsafePointer[Stat]) -> Int32:
    """Libc POSIX `fstat` function.

    Args:
        fd: A file descriptor.
        stat: A pointer to a `stat` struct.

    Returns: A pointer to a socket.
    """
    return external_call[
        "fstat", Int32, Int32, UnsafePointer[Stat]
    ](fd, stat) 



fn lstat(path: UnsafePointer[Int8], stat: UnsafePointer[Stat]) -> Int32:
    """Libc POSIX `lstat` function.

    Args:
        path: A path to a file.
        stat: A pointer to a `stat` struct.

    Returns: A pointer to a socket.
    """
    return external_call[
        "lstat", Int32, UnsafePointer[Int8], UnsafePointer[Stat]
    ](path, stat) 


fn mkdir(path: UnsafePointer[Int8], mode: Int32) -> Int32:
    """Libc POSIX `mkdir` function.

    Args:
        path: A path to a directory.
        mode: A mode to create the directory with.

    Returns: A pointer to a socket.
    """
    return external_call[
        "mkdir", Int32, UnsafePointer[Int8], Int32
    ](path, mode) 


fn mkdirat(fd: Int32, path: UnsafePointer[Int8], mode: Int32) -> Int32:
    """Libc POSIX `mkdirat` function.

    Args:
        fd: A file descriptor.
        path: A path to a directory.
        mode: A mode to create the directory with.

    Returns: A pointer to a socket.
    """
    return external_call[
        "mkdirat", Int32, Int32, UnsafePointer[Int8], Int32
    ](fd, path, mode) 


fn mknod(path: UnsafePointer[Int8], mode: Int32, dev: Int32) -> Int32:
    """Libc POSIX `mknod` function.

    Args:
        path: A path to a file.
        mode: A mode to create the file with.
        dev: A device number.

    Returns: A pointer to a socket.
    """
    return external_call[
        "mknod", Int32, UnsafePointer[Int8], Int32, Int32
    ](path, mode, dev) 


fn mknodat(fd: Int32, path: UnsafePointer[Int8], mode: Int32, dev: Int32) -> Int32:
    """Libc POSIX `mknodat` function.

    Args:
        fd: A file descriptor.
        path: A path to a file.
        mode: A mode to create the file with.
        dev: A device number.

    Returns: A pointer to a socket.
    """
    return external_call[
        "mknodat", Int32, Int32, UnsafePointer[Int8], Int32, Int32
    ](fd, path, mode, dev) 


@register_passable('trivial')
struct Stat:
    var st_dev: Int32
    var st_ino: Int32
    var st_mode: Int32
    var st_nlink: Int32
    var st_uid: Int32
    var st_gid: Int32
    var st_rdev: Int32
    var st_size: Int32
    var st_atime: Int32
    var st_mtime: Int32
    var st_ctime: Int32

fn stat(pathname: UnsafePointer[Int8], statbuf: UnsafePointer[Stat]) -> Int32:
    """Libc POSIX `stat` function.

    Args:
        pathname: A pathname to a file.
        statbuf: A pointer to a `stat` struct.

    Returns: A pointer to a socket.
    """
    return external_call[
        "stat", Int32, UnsafePointer[Int8], UnsafePointer[Stat]
    ](pathname, statbuf) 


fn umask(mask: Int32) -> Int32:
    """Libc POSIX `umask` function.

    Args:
        mask: A mask to apply to file creation modes.

    Returns: The previous umask.
    """
    return external_call[
        "umask", Int32, Int32
    ](mask) 


fn utime(path: UnsafePointer[Int8], times: UnsafePointer[timeval]) -> Int32:
    """Libc POSIX `utime` function.

    Args:
        path: A path to a file.
        times: A pointer to a `timeval` struct.

    Returns: A pointer to a socket.
    """
    return external_call[
        "utime", Int32, UnsafePointer[Int8], UnsafePointer[timeval]
    ](path, times) 



@register_passable("trivial")
struct timespec:
    var tv_sec: Int32
    var tv_nsec: Int64


@register_passable("trivial")
struct timeval:
    var tv_sec: Int32
    var tv_usec: Int32


fn utimensat(fd: Int32, path: UnsafePointer[Int8], times: UnsafePointer[timespec], flag: Int32) -> Int32:
    """Libc POSIX `utimensat` function.

    Args:
        fd: A file descriptor.
        path: A path to a file.
        times: A pointer to a `timespec` struct.
        flag: A flag to modify the behavior of the function.

    Returns: A pointer to a socket.
    """
    return external_call[
        "utimensat", Int32, Int32, UnsafePointer[Int8], UnsafePointer[timespec], Int32
    ](fd, path, times, flag) 


fn futimens(fd: Int32, times: UnsafePointer[timespec]) -> Int32:
    """Libc POSIX `futimens` function.

    Args:
        fd: A file descriptor.
        times: A pointer to a `timespec` struct.

    Returns: A pointer to a socket.
    """
    return external_call[
        "futimens", Int32, Int32, UnsafePointer[timespec]
    ](fd, times) 


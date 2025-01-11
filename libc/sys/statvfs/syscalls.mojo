# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from sys import external_call
from memory import UnsafePointer


fn fstatvfs(fd: Int32, buf: UnsafePointer[Int8]) -> Int32:
    """Libc POSIX `fstatvfs` function.

    Reference:
        https://man7.org/linux/man-pages/man2/fstatvfs.2.html
    
    Args:
        fd: File descriptor.
        buf: Pointer to the buffer to store the result.
    
    Description:
        The `fstatvfs` function returns information about the file system
        corresponding to the file referenced by the file descriptor `fd`.
        The information is stored in the `statvfs` structure pointed to by `buf`.
        The `statvfs` structure contains information about the file system
        in the form of several fields, including:

        - `f_bsize`: The optimal I/O block size for the file system.
        - `f_frsize`: The fundamental I/O block size for the file system.
        - `f_blocks`: The total number of blocks in the file system.
        - `f_bfree`: The number of free blocks in the file system.
        - `f_bavail`: The number of free blocks available to non-superuser.
        - `f_files`: The total number of file nodes in the file system.
        - `f_ffree`: The number of free file nodes in the file system.
        - `f_favail`: The number of free file nodes available to non-superuser.
        - `f_fsid`: A unique identifier for the file system.
        - `f_flag`: Flags indicating the capabilities of the file system.
        - `f_namemax`: The maximum length of a file name.
    """
    return external_call["fstatvfs", Int32, Int32, UnsafePointer[Int8]](fd, buf)


fn statvfs(path: UnsafePointer[Int8], buf: UnsafePointer[Int8]) -> Int32:
    """Libc POSIX `statvfs` function.

    Reference:
        https://man7.org/linux/man-pages/man3/statvfs.3.html
    

    Args:
        path: Pointer to the path to the file.
        buf: Pointer to the buffer to store the result.
    
    Description:
        The `statvfs` function returns information about the file system
        corresponding to the file referenced by the path pointed to by `path`.
        The information is stored in the `statvfs` structure pointed to by `buf`.
        The `statvfs` structure contains information about the file system
        in the form of several fields, including:

        - `f_bsize`: The optimal I/O block size for the file system.
        - `f_frsize`: The fundamental I/O block size for the file system.
        - `f_blocks`: The total number of blocks in the file system.
        - `f_bfree`: The number of free blocks in the file system.
        - `f_bavail`: The number of free blocks available to non-superuser.
        - `f_files`: The total number of file nodes in the file system.
        - `f_ffree`: The number of free file nodes in the file system.
        - `f_favail`: The number of free file nodes available to non-superuser.
        - `f_fsid`: A unique identifier for the file system.
        - `f_flag`: Flags indicating the capabilities of the file system.
        - `f_namemax`: The maximum length of a file name.
    """
    return external_call["statvfs", Int32, UnsafePointer[Int8], UnsafePointer[Int8]](path, buf)
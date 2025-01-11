# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from sys import external_call
from memory import UnsafePointer


fn access(path: UnsafePointer[Int8], mode: Int32) -> Int32:
    """Libc POSIX `access` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/access.2.html
    
    Description:
        access() checks whether the calling process can access the file specified by path.

    Args:
        path: Path to the file.
        mode: Mode to check access.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["access", Int32, UnsafePointer[Int8], Int32](path, mode)



fn chdir(path: UnsafePointer[Int8]) -> Int32:
    """Libc POSIX `chdir` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/chdir.2.html
    
    Description:
        chdir() changes the current working directory of the calling process to the directory
        referenced by path.

    Args:
        path: Path to the directory.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["chdir", Int32, UnsafePointer[Int8]](path)



fn close(fd: Int32) -> Int32:
    """Libc POSIX `close` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/close.2.html
    
    Description:
        close() closes a file descriptor.

    Args:
        fd: File descriptor to close.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["close", Int32, Int32](fd)



fn dup(oldfd: Int32) -> Int32:
    """Libc POSIX `dup` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/dup.2.html
    
    Description:
        dup() duplicates a file descriptor.

    Args:
        oldfd: File descriptor to duplicate.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["dup", Int32, Int32](oldfd)



fn dup2(oldfd: Int32, newfd: Int32) -> Int32:
    """Libc POSIX `dup2` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/dup2.2.html
    
    Description:
        dup2() duplicates a file descriptor, closing the original file descriptor.

    Args:
        oldfd: File descriptor to duplicate.
        newfd: File descriptor to duplicate to.

    Returns:
        0 on success, -1 on error.
    """    
    return external_call["dup2", Int32, Int32, Int32](oldfd, newfd)


fn dup3(oldfd: Int32, newfd: Int32, flags: Int32) -> Int32:
    """Libc POSIX `dup3` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/dup3.2.html
    
    Description:
        dup3() duplicates a file descriptor, closing the original file descriptor.

    Args:
        oldfd: File descriptor to duplicate.
        newfd: File descriptor to duplicate to.
        flags: Flags to set on the new file descriptor.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["dup3", Int32, Int32, Int32, Int32](oldfd, newfd, flags)


fn environ() -> UnsafePointer[Int8]:
    """Libc POSIX `environ` function.

    Reference: 
        https://man7.org/linux/man-pages/man7/environ.7.html
    
    Description:
        environ is a global variable in the C library that points to an array of strings,
        each of which is a variable setting in the form of a "name=value" string.
        The first entry in the array is the environment string that was passed to the program.
        Each subsequent entry in the array is a string that contains one or more environment variables.
        Each environment variable has the form "name=value", where "name" is the environment variable name
        and "value" is the value assigned to it.
    
    Returns:
        The pointer to the array of strings.
    """
    return external_call["environ", UnsafePointer[Int8]]()



fn execve(path: UnsafePointer[Int8], argv: UnsafePointer[UnsafePointer[Int8]], envp: UnsafePointer[UnsafePointer[Int8]]) -> Int32:
    """Libc POSIX `execve` function.

    Reference:  
        https://man7.org/linux/man-pages/man2/execve.2.html
    
    Description:
        execve() replaces the calling process with a new process image.

    Args:
        path: Path to the file.
        argv: Array of arguments.
        envp: Array of environment variables.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["execve", Int32, UnsafePointer[Int8], UnsafePointer[UnsafePointer[Int8]], UnsafePointer[UnsafePointer[Int8]]](path, argv, envp)


fn execv(path: UnsafePointer[Int8], argv: UnsafePointer[UnsafePointer[Int8]]) -> Int32:
    """Libc POSIX `execv` function.

    Reference:  
        https://man7.org/linux/man-pages/man2/execv.2.html
    
    Description:
        execv() replaces the calling process with a new process image.

    Args:
        path: Path to the file.
        argv: Array of arguments.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["execv", Int32, UnsafePointer[Int8], UnsafePointer[UnsafePointer[Int8]]](path, argv)


fn execvp(file: UnsafePointer[Int8], argv: UnsafePointer[UnsafePointer[Int8]]) -> Int32:
    """Libc POSIX `execvp` function.

    Reference:  
        https://man7.org/linux/man-pages/man2/execvp.2.html
    
    Description:
        execvp() searches for the file specified by path in the directories specified by the PATH
        environment variable, and executes the program with the specified arguments.

    Args:
        file: Path to the file.
        argv: Array of arguments.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["execvp", Int32, UnsafePointer[Int8], UnsafePointer[UnsafePointer[Int8]]](file, argv)


fn fork() -> Int32:
    """Libc POSIX `fork` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/fork.2.html
    
    Description:
        fork() creates a new process by duplicating the calling process.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["fork", Int32]()



fn ftruncate(fd: Int32, length: Int64) -> Int32:
    """Libc POSIX `ftruncate` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/ftruncate.2.html
    
    Description:
        ftruncate() changes the size of the file associated with the file descriptor fd to the
        specified length.

    Args:
        fd: File descriptor.
        length: New size of the file.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["ftruncate", Int32, Int32, Int64](fd, length)


fn fchdir(fd: Int32) -> Int32:
    """Libc POSIX `fchdir` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/fchdir.2.html
    
    Description:
        fchdir() changes the current working directory of the calling process to the directory
        referenced by the file descriptor fd.

    Args:
        fd: File descriptor.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["fchdir", Int32, Int32](fd)


fn fpathconf(fd: Int32, name: Int32) -> Int64:
    """Libc POSIX `fpathconf` function.

    Reference: 
        https://man7.org/linux/man-pages/man3/fpathconf.3.html
    
    Description:
        fpathconf() returns the value of the configuration variable associated with the file
        descriptor fd.

    Args:
        fd: File descriptor.
        name: Name of the configuration variable.

    Returns:
        The value of the configuration variable.
    """
    return external_call["fpathconf", Int64, Int32, Int32](fd, name)


fn fsync(fd: Int32) -> Int32:
    """Libc POSIX `fsync` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/fsync.2.html
    
    Description:
        fsync() flushes the data and metadata of the file referenced by the file descriptor fd
        to the disk.

    Args:
        fd: File descriptor.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["fsync", Int32, Int32](fd)


fn getcwd(buf: UnsafePointer[Int8], size: Int32) -> Int32:
    """Libc POSIX `getcwd` function.

    Reference: 
        https://man7.org/linux/man-pages/man3/getcwd.3.html
    
    Description:
        getcwd() returns a pointer to a null-terminated string that contains the current working
        directory of the calling process.

    Args:
        buf: Pointer to the buffer to store the current working directory.
        size: The maximum size of the buffer.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["getcwd", Int32, UnsafePointer[Int8], Int32](buf, size)


fn geteuid() -> Int32:
    """Libc POSIX `geteuid` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/geteuid.2.html
    
    Description:
        geteuid() returns the effective user ID of the calling process.

    Returns:
        The effective user ID.
    """
    return external_call["geteuid", Int32]()


fn getopt(argc: Int32, argv: UnsafePointer[UnsafePointer[Int8]], optstring: UnsafePointer[Int8]) -> Int32:
    """Libc POSIX `getopt` function.

    Reference: 
        https://man7.org/linux/man-pages/man3/getopt.3.html
    
    Description:
        getopt() parses the command line arguments.

    Args:
        argc: Number of arguments.
        argv: Array of arguments.
        optstring: String of options.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["getopt", Int32, Int32, UnsafePointer[UnsafePointer[Int8]], UnsafePointer[Int8]](argc, argv, optstring)


fn getpid() -> Int32:
    """Libc POSIX `getpid` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/getpid.2.html
    
    Description:
        getpid() returns the process ID of the calling process.

    Returns:
        The process ID.
    """
    return external_call["getpid", Int32]()


fn getppid() -> Int32:
    """Libc POSIX `getppid` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/getppid.2.html
    
    Description:
        getppid() returns the process ID of the parent process of the calling process.

    Returns:
        The process ID of the parent process.
    """
    return external_call["getppid", Int32]()


fn getuid() -> Int32:
    """Libc POSIX `getuid` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/getuid.2.html
    
    Description:
        getuid() returns the real user ID of the calling process.

    Returns:
        The real user ID.
    """
    return external_call["getuid", Int32]()


fn gettid() -> Int32:
    """Libc POSIX `gettid` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/gettid.2.html
    
    Description:
        gettid() returns the thread ID of the calling process.

    Returns:
        The thread ID.
    """
    return external_call["gettid", Int32]()


fn isatty(fd: Int32) -> Int32:
    """Libc POSIX `isatty` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/isatty.2.html
    
    Description:
        isatty() checks whether the file descriptor fd is a terminal.

    Args:
        fd: File descriptor.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["isatty", Int32, Int32](fd)


fn link(oldpath: UnsafePointer[Int8], newpath: UnsafePointer[Int8]) -> Int32:
    """Libc POSIX `link` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/link.2.html
    
    Description:
        link() creates a hard link.

    Args:   
        oldpath: Path to the existing file.
        newpath: Path to the new link.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["link", Int32, UnsafePointer[Int8], UnsafePointer[Int8]](oldpath, newpath)


fn linkat(olddirfd: Int32, oldpath: UnsafePointer[Int8], newdirfd: Int32, newpath: UnsafePointer[Int8], flags: Int32) -> Int32:
    """Libc POSIX `linkat` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/linkat.2.html
    
    Description:
        linkat() creates a hard link.

    Args:
        olddirfd: File descriptor for the old path.
        oldpath: Path to the existing file.
        newdirfd: File descriptor for the new path.
        newpath: Path to the new link.
        flags: Flags to set on the new link.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["linkat", Int32, Int32, UnsafePointer[Int8], Int32, UnsafePointer[Int8], Int32](olddirfd, oldpath, newdirfd, newpath, flags)


fn lseek(fd: Int32, offset: Int64, whence: Int32) -> Int64:
    """Libc POSIX `lseek` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/lseek.2.html
    
    Description:
        lseek() repositions the file pointer of the file associated with the file descriptor fd
        to the argument offset according to the directive whence.

    Args:
        fd: File descriptor.
        offset: Offset.
        whence: Whence.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["lseek", Int64, Int32, Int64, Int32](fd, offset, whence)


fn pipe(fds: UnsafePointer[Int32]) -> Int32:
    """Libc POSIX `pipe` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/pipe.2.html
    
    Description:
        pipe() creates a pipe.

    Args:
        fds: Pointer to an array of two file descriptors.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["pipe", Int32, UnsafePointer[Int32]](fds)


fn pread(fd: Int32, buf: UnsafePointer[Int8], count: UInt32, offset: Int8) -> UInt32:
    """Libc POSIX `pread` function.

    Reference:    
        https://man7.org/linux/man-pages/man2/pread.2.html
    
    Description:
        pread() reads count bytes from the file associated with the file descriptor fd into the
        buffer starting at the location pointed to by buf, starting at the file position
        specified by offset.

    Args:
        fd: File descriptor.
        buf: Buffer to read into.
        count: Number of bytes to read.
        offset: Offset.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["pread", UInt32, Int32, UnsafePointer[Int8], UInt32, Int8](fd, buf, count, offset)


fn pwrite(fd: Int32, buf: UnsafePointer[Int8], count: UInt32, offset: Int8) -> UInt32:
    """Libc POSIX `pwrite` function.

    Reference:    
        https://man7.org/linux/man-pages/man2/pwrite.2.html
    
    Description:
        pwrite() writes count bytes from the buffer starting at the location pointed to by buf
        into the file associated with the file descriptor fd, starting at the file position
        specified by offset.

    Args:
        fd: File descriptor.
        buf: Buffer to write from.
        count: Number of bytes to write.
        offset: Offset.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["pwrite", UInt32, Int32, UnsafePointer[Int8], UInt32, Int8](fd, buf, count, offset)


fn read(fd: Int32, buf: UnsafePointer[Int8], count: UInt32) -> UInt32:
    """Libc POSIX `read` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/read.2.html
    
    Description:
        read() reads count bytes from the file associated with the file descriptor fd into the
        buffer starting at the location pointed to by buf.
    
    Args:
        fd: File descriptor.
        buf: Buffer to read into.
        count: Number of bytes to read.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["read", UInt32, Int32, UnsafePointer[Int8], UInt32](fd, buf, count)


fn readlink(path: UnsafePointer[Int8], buf: UnsafePointer[Int8], size: Int32) -> Int32:
    """Libc POSIX `readlink` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/readlink.2.html
    
    Description:
        readlink() reads the contents of the file specified by path into the buffer starting at
        the location pointed to by buf.

    Args:
        path: Path to the file.
        buf: Buffer to read into.
        size: Size of the buffer.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["readlink", Int32, UnsafePointer[Int8], UnsafePointer[Int8], Int32](path, buf, size)


fn readlinkat(dirfd: Int32, path: UnsafePointer[Int8], buf: UnsafePointer[Int8], size: Int32) -> Int32:
    """Libc POSIX `readlinkat` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/readlinkat.2.html
    
    Description:
        readlinkat() reads the contents of the file specified by path into the buffer starting at
        the location pointed to by buf.

    Args:
        dirfd: File descriptor.
        path: Path to the file.
        buf: Buffer to read into.
        size: Size of the buffer.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["readlinkat", Int32, Int32, UnsafePointer[Int8], UnsafePointer[Int8], Int32](dirfd, path, buf, size)


fn rmdir(path: UnsafePointer[Int8]) -> Int32:
    """Libc POSIX `rmdir` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/rmdir.2.html
    
    Description:
        rmdir() removes the directory specified by path.

    Args:
        path: Path to the directory.
    
    Returns:
        0 on success, -1 on error.
    """
    return external_call["rmdir", Int32, UnsafePointer[Int8]](path)


fn swab(a: UnsafePointer[Int8], b: UnsafePointer[Int8], size: Int32) -> Int8:
    """Libc POSIX `swab` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/swab.2.html
    
    Description:
        swab() swaps the bytes in the two buffers.
    
    Args:
        a: First buffer.
        b: Second buffer.
        size: Size of the buffer.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["swab", Int8, UnsafePointer[Int8], UnsafePointer[Int8], Int32](a, b, size)


fn symlink(oldpath: UnsafePointer[Int8], newpath: UnsafePointer[Int8]) -> Int32:
    """Libc POSIX `symlink` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/symlink.2.html
    
    Description:
        symlink() creates a symbolic link.

    Args:
        oldpath: Path to the existing file.
        newpath: Path to the new link.
    
    Returns:
        0 on success, -1 on error.
    """
    return external_call["symlink", Int32, UnsafePointer[Int8], UnsafePointer[Int8]](oldpath, newpath)


fn symlinkat(oldpath: UnsafePointer[Int8], newdirfd: Int32, newpath: UnsafePointer[Int8]) -> Int32:
    """Libc POSIX `symlinkat` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/symlinkat.2.html
    
    Description:
        symlinkat() creates a symbolic link.

    Args:
        oldpath: Path to the existing file.
        newdirfd: File descriptor for the new path.
        newpath: Path to the new link.
    
    Returns:
        0 on success, -1 on error.
    """
    return external_call["symlinkat", Int32, UnsafePointer[Int8], Int32, UnsafePointer[Int8]](oldpath, newdirfd, newpath)


# remember update
fn syscall(number: Int32) -> Int32:
    """Libc POSIX `syscall` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/syscall.2.html
    
    Description:
        syscall() executes a system call.

    Args:
        number: System call number.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["syscall", Int32, Int32](number)


fn unlink(path: UnsafePointer[Int8]) -> Int32:
    """Libc POSIX `unlink` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/unlink.2.html
    
    Description:
        unlink() removes the file specified by path.

    Args:
        path: Path to the file.
    
    Returns:
        0 on success, -1 on error.
    """
    return external_call["unlink", Int32, UnsafePointer[Int8]](path)


fn unlinkat(dirfd: Int32, path: UnsafePointer[Int8], flags: Int32) -> Int32:
    """Libc POSIX `unlinkat` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/unlinkat.2.html
    
    Description:
        unlinkat() removes the file specified by path.
    
    Args:
        dirfd: File descriptor.
        path: Path to the file.
        flags: Flags.
    
    Returns:
        0 on success, -1 on error.
    """
    return external_call["unlinkat", Int32, Int32, UnsafePointer[Int8], Int32](dirfd, path, flags)


fn truncate(path: UnsafePointer[Int8], length: Int64) -> Int32:
    """Libc POSIX `truncate` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/truncate.2.html
    
    Description:
        truncate() changes the size of the file specified by path.

    Args:
        path: Path to the file.
        length: Length.
    
    Returns:
        0 on success, -1 on error.
    """
    return external_call["truncate", Int32, UnsafePointer[Int8], Int64](path, length)


fn truncateat(dirfd: Int32, path: UnsafePointer[Int8], length: Int64) -> Int32:
    """Libc POSIX `truncateat` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/truncateat.2.html
    
    Description:
        truncateat() changes the size of the file specified by path.

    Args:
        dirfd: File descriptor.
        path: Path to the file.
        length: Length.
    
    Returns:
        0 on success, -1 on error.
    """
    return external_call["truncateat", Int32, Int32, UnsafePointer[Int8], Int64](dirfd, path, length)


fn write(fd: Int32, buf: UnsafePointer[Int8], count: UInt32) -> UInt32:
    """Libc POSIX `write` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/write.2.html
    
    Description:
        write() writes count bytes from the buffer starting at the location pointed to by buf
        into the file associated with the file descriptor fd.

    Args:
        fd: File descriptor.
        buf: Buffer to write from.
        count: Number of bytes to write.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["write", UInt32, Int32, UnsafePointer[Int8], UInt32](fd, buf, count)


fn writev(fd: Int32, iov: UnsafePointer[Int8], iovcnt: UInt32) -> UInt32:
    """Libc POSIX `writev` function.

    Reference: 
        https://man7.org/linux/man-pages/man2/writev.2.html
    
    Description:
        writev() writes iovcnt buffers of data described by iov to the file associated with the
        file descriptor fd.

    Args:    
        fd: File descriptor.
        iov: Buffer to write from.
        iovcnt: Number of buffers to write.

    Returns:
        0 on success, -1 on error.
    """
    return external_call["writev", UInt32, Int32, UnsafePointer[Int8], UInt32](fd, iov, iovcnt)
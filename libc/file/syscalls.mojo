# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from libc.constant import * 
from sys import external_call


@register_passable("trivial")
struct FILE:
    pass


fn fflush(arg: UnsafePointer[FILE]) -> Int32:
    """

    """
    return external_call["fflush", Int32, UnsafePointer[FILE]](arg)



fn fcntl(fildes: c_int, cmd: c_int) -> c_int:
    """Libc POSIX `fcntl` function.

    Args:
        fildes: A File Descriptor to close.
        cmd: A command to execute.

    Returns:
        0 if succesful, otherwise -1 and errno set to indicate the error.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/close.3p.html).
        Fn signature: `int fcntl(int fildes, int cmd, ...)`.
    """

    return external_call["fcntl", c_int, c_int, c_int](fildes, cmd)


fn close(fildes: c_int) -> c_int:
    """Libc POSIX `close` function.

    Args:
        fildes: A File Descriptor to close.

    Returns:
        0 if succesful, otherwise -1 and errno set to indicate the error.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/close.3p.html).
        Fn signature: `int close(int fildes)`.
    """
    return external_call["close", c_int, c_int](fildes)


fn open(path: UnsafePointer[c_char], oflag: c_int) -> c_int:
    """Libc POSIX `open` function.

    Args:
        path: A path to a file.
        oflag: A flag to open the file with.

    Returns:
        A File Descriptor or -1 in case of failure

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/open.3p.html).
        Fn signature: `int open(const char *path, int oflag, ...)`.
    """

    return external_call["open", c_int, UnsafePointer[c_char], c_int](
        path, oflag
    )


fn openat(fd: c_int, path: UnsafePointer[c_char], oflag: c_int) -> c_int:
    """Libc POSIX `open` function.

    Args:
        fd: A File Descriptor to open the file with.
        path: A path to a file.
        oflag: A flag to open the file with.

    Returns:
        A File Descriptor or -1 in case of failure

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/open.3p.html).
        Fn signature: `int openat(int fd, const char *path, int oflag, ...)`.
    """
    return external_call["openat", c_int, c_int, UnsafePointer[c_char], c_int](
        fd, path, oflag
    )


fn fopen(
    pathname: UnsafePointer[c_char], mode: UnsafePointer[c_char]
) -> UnsafePointer[FILE]:
    """Libc POSIX `fopen` function.

    Args:
        pathname: A path to a file.
        mode: A mode to open the file with.

    Returns:
        A File Descriptor or -1 in case of failure.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/fopen.3p.html).
        Fn signature: `FILE *fopen(const char *restrict pathname,
            const char *restrict mode)`.
    """
    return external_call[
        "fopen",
        UnsafePointer[FILE],
        UnsafePointer[c_char],
        UnsafePointer[c_char],
    ](pathname, mode)


fn fdopen(fildes: c_int, mode: UnsafePointer[c_char]) -> UnsafePointer[FILE]:
    """Libc POSIX `fdopen` function.

    Args:
        fildes: A File Descriptor to open the file with.
        mode: A mode to open the file with.

    Returns:
        A File Descriptor or -1 in case of failure.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/fdopen.3p.html).
        Fn signature: `FILE *fdopen(int fildes, const char *mode)`.
    """
    return external_call[
        "fdopen", UnsafePointer[FILE], c_int, UnsafePointer[c_char]
    ](fildes, mode)


fn freopen(
    pathname: UnsafePointer[c_char],
    mode: UnsafePointer[c_char],
    stream: UnsafePointer[FILE],
) -> UnsafePointer[FILE]:
    """Libc POSIX `freopen` function.

    Args:
        pathname: A path to a file.
        mode: A mode to open the file with.
        stream: A pointer to a stream.

    Returns:
        A File Descriptor or -1 in case of failure.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/freopen.3p.html).
        Fn signature: `FILE *freopen(const char *restrict pathname,
            const char *restrict mode, FILE *restrict stream)`.
    """
    return external_call[
        "freopen",
        UnsafePointer[FILE],
        UnsafePointer[c_char],
        UnsafePointer[c_char],
        UnsafePointer[FILE],
    ](pathname, mode, stream)


fn fmemopen(
    buf: UnsafePointer[c_void], size: c_uint, mode: UnsafePointer[c_char]
) -> UnsafePointer[FILE]:
    """Libc POSIX `fmemopen` function.

    Args:
        buf: A pointer to a buffer.
        size: The size of the buffer.
        mode: A mode to open the file with.

    Returns:
        A File Descriptor or -1 in case of failure.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/fmemopen.3p.html).
        Fn signature: `FILE *fmemopen(void *restrict buf, size_t size,
            const char *restrict mode)`.
    """
    return external_call[
        "fmemopen",
        UnsafePointer[FILE],
        UnsafePointer[c_void],
        c_uint,
        UnsafePointer[c_char],
    ](buf, size, mode)


fn creat(path: UnsafePointer[c_char], mode: mode_t) -> c_int:
    """Libc POSIX `creat` function.

    Args:
        path: A path to a file.
        mode: A mode to open the file with.

    Returns:
        A File Descriptor or -1 in case of failure.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/creat.3p.html).
        Fn signature: `int creat(const char *path, mode_t mode)`.
    """
    return external_call["creat", c_int, UnsafePointer[c_char], mode_t](
        path, mode
    )


fn fseek(stream: UnsafePointer[FILE], offset: c_long, whence: c_int) -> c_int:
    """Libc POSIX `fseek` function.

    Args:
        stream: A pointer to a stream.
        offset: An offset to seek to.
        whence: A pointer to a buffer to store the length of the address of the
            accepted socket.

    Returns:
        A File Descriptor or -1 in case of failure

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/fseek.3p.html).
        Fn signature: `int fseek(FILE *stream, long offset, int whence)`.
    """
    return external_call["fseek", c_int, UnsafePointer[FILE], c_long, c_int](
        stream, offset, whence
    )


fn fseeko(stream: UnsafePointer[FILE], offset: off_t, whence: c_int) -> c_int:
    """Libc POSIX `fseeko` function.

    Args:
        stream: A pointer to a stream.
        offset: An offset to seek to.
        whence: A pointer to a buffer to store the length of the address of the
            accepted socket.

    Returns:
        A File Descriptor or -1 in case of failure.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/fseek.3p.html).
        Fn signature: `int fseeko(FILE *stream, off_t offset, int whence)`.
    """
    return external_call["fseeko", c_int, UnsafePointer[FILE], off_t, c_int](
        stream, offset, whence
    )


fn lseek(fildes: c_int, offset: off_t, whence: c_int) -> off_t:
    """Libc POSIX `lseek` function.

    Args:
        fildes: A File Descriptor to open the file with.
        offset: An offset to seek to.
        whence: A pointer to a buffer to store the length of the address of the
            accepted socket.

    Returns:
        A File Descriptor or -1 in case of failure.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/lseek.3p.html).
        Fn signature: `off_t lseek(int fildes, off_t offset, int whence)`.
    """
    return external_call["lseek", off_t, c_int, off_t, c_int](
        fildes, offset, whence
    )


fn fputc(c: c_int, stream: UnsafePointer[FILE]) -> c_int:
    """Libc POSIX `fputc` function.

    Args:
        c: A character to write.
        stream: A pointer to a stream.

    Returns:
        A File Descriptor or -1 in case of failure.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/fputc_3p.html).
        Fn signature: `int fputc(int c, FILE *stream)`.
    """
    return external_call["fputc", c_int, c_int, UnsafePointer[FILE]](c, stream)


fn fputs(s: UnsafePointer[c_char], stream: UnsafePointer[FILE]) -> c_int:
    """Libc POSIX `fputs` function.

    [Reference](https://man7.org/linux/man-pages/man3/fputs.3p.html).
    Fn signature: `int fputs(const char *restrict s, FILE *restrict stream)`.

    Args:
        s: A string to write.
        stream: A pointer to a stream.
    Returns: A File Descriptor or -1 in case of failure
    """
    return external_call[
        "fputs",
        c_int,
        UnsafePointer[c_char],
        UnsafePointer[FILE],
    ](s, stream)


fn fgetc(stream: UnsafePointer[FILE]) -> c_int:
    """Libc POSIX `fgetc` function.

    Args:
        stream: A pointer to a stream.

    Returns:
        A File Descriptor or -1 in case of failure.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/fgetc_3p.html).
        Fn signature: `int fgetc(FILE *stream)`.
    """
    return external_call["fgets", c_int, UnsafePointer[FILE]](stream)


fn fgets(
    s: UnsafePointer[c_char], n: c_int, stream: UnsafePointer[FILE]
) -> UnsafePointer[c_char]:
    """Libc POSIX `fgets` function.

    Args:
        s: A pointer to a buffer to store the read string.
        n: The maximum number of characters to read.
        stream: A pointer to a stream.

    Returns:
        A File Descriptor or -1 in case of failure.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/fgets.3p.html).
        Fn signature: `char *fgets(char *restrict s, int n,
            FILE *restrict stream)`.
    """
    return external_call[
        "fgets",
        UnsafePointer[c_char],
        UnsafePointer[c_char],
        c_int,
        UnsafePointer[FILE],
    ](s, n, stream)


fn dprintf(fildes: c_int, format: UnsafePointer[c_char]) -> c_int:
    """Libc POSIX `dprintf` function.

    Args:
        fildes: A File Descriptor to open the file with.
        format: A format string.

    Returns:
        A File Descriptor or -1 in case of failure.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/fprintf.3p.html).
        Fn signature: `int dprintf(int fildes,
            const char *restrict format, ...)`.
    """
    return external_call["dprintf", c_int, c_int, UnsafePointer[c_char]](
        fildes, format
    )


fn printf[*T: AnyType](format: UnsafePointer[c_char], *args: *T) -> c_int:
    """Libc POSIX `printf` function
    Reference: https://man7.org/linux/man-pages/man3/fprintf.3p.html
    Fn signature: int printf(const char *restrict format, ...).

    Args: format: A UnsafePointer to a C string containing the format.
        args: The optional arguments.
    Returns: The number of bytes written or -1 in case of failure.
    """
    return external_call[
        "printf",
        c_int,  # FnName, RetType
    ](format, args)


fn snprintf(
    s: UnsafePointer[c_char],
    n: c_uint,
    format: UnsafePointer[c_char],
) -> c_int:
    """Libc POSIX `snprintf` function.

    Args:
        s: A pointer to a buffer to store the read string.
        n: The maximum number of characters to read.
        format: A format string.

    Returns:
        A File Descriptor or -1 in case of failure

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/fprintf.3p.html).
        Fn signature: ``int snprintf(char *restrict s, size_t n,`.
            const char *restrict format, ...)`.
    """
    return external_call[
        "snprintf",
        c_int,
        UnsafePointer[c_char],
        c_uint,
        UnsafePointer[c_char],
    ](s, n, format)


fn sprintf(s: UnsafePointer[c_char], format: UnsafePointer[c_char]) -> c_int:
    """Libc POSIX `sprintf` function.

    Args:
        s: A pointer to a buffer to store the read string.
        format: A format string.

    Returns:
        A File Descriptor or -1 in case of failure.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/fprintf.3p.html).
        Fn signature: ``int sprintf(char *restrict s,`.
            const char *restrict format, ...)`.
    """
    return external_call[
        "sprintf", c_int, UnsafePointer[c_char], UnsafePointer[c_char]
    ](s, format)


fn fscanf(stream: UnsafePointer[FILE], format: UnsafePointer[c_char]) -> c_int:
    """Libc POSIX `fscanf` function.

    Args:
        stream: A pointer to a stream.
        format: A format string.

    Returns:
        A File Descriptor or -1 in case of failure.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/fscanf.3p.html).
        Fn signature: ``int fscanf(FILE *restrict stream,`.
            const char *restrict format, ...)`.
    """
    return external_call[
        "fscanf", c_int, UnsafePointer[FILE], UnsafePointer[c_char]
    ](stream, format)


fn scanf(format: UnsafePointer[c_char]) -> c_int:
    """Libc POSIX `scanf` function.

    Args:
        format: A format string.

    Returns:
        A File Descriptor or -1 in case of failure.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/fscanf.3p.html).
        Fn signature: ``int scanf(const char *restrict format, ...)`.`.
    """
    return external_call["scanf", c_int, UnsafePointer[c_char]](format)


fn sscanf(s: UnsafePointer[c_char], format: UnsafePointer[c_char]) -> c_int:
    """Libc POSIX `sscanf` function.

    Args:
        s: A pointer to a buffer to store the read string.
        format: A format string.

    Returns:
        A File Descriptor or -1 in case of failure.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/fscanf.3p.html).
        Fn signature: ``int sscanf(const char *restrict s,`.
            const char *restrict format, ...)`.
    """
    return external_call[
        "sscanf", c_int, UnsafePointer[c_char], UnsafePointer[c_char]
    ](s, format)


fn fread(
    ptr: UnsafePointer[c_void],
    size: c_uint,
    nitems: c_uint,
    stream: UnsafePointer[FILE],
) -> c_uint:
    """Libc POSIX `fread` function.

    Args:
        ptr: A pointer to a buffer to store the read string.
        size: The size of the buffer.
        nitems: The number of items to read.
        stream: A pointer to a stream.

    Returns:
        A File Descriptor or -1 in case of failure.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/fread.3p.html).
        Fn signature: `size_t fread(void *restrict ptr, size_t size,
            size_t nitems, FILE *restrict stream)`.
    """
    return external_call[
        "fread",
        c_uint,
        UnsafePointer[c_void],
        c_uint,
        c_uint,
        UnsafePointer[FILE],
    ](ptr, size, nitems, stream)


fn rewind(stream: UnsafePointer[FILE]) -> c_void:
    """Libc POSIX `rewind` function.

    Args:
        stream: A pointer to a stream.

    Returns:
        A void.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/rewind.3p.html).
        Fn signature: `void rewind(FILE *stream)`.
    """
    return external_call["rewind", c_void, UnsafePointer[FILE]](stream)


fn getline(
    lineptr: UnsafePointer[UnsafePointer[FILE]],
    n: UnsafePointer[c_uint],
    stream: UnsafePointer[FILE],
) -> c_uint:
    """Libc POSIX `getline` function.

    Args:
        lineptr: A pointer to a pointer to a buffer to store the read string.
        n: A pointer to a buffer to store the length of the address of the
            accepted socket.
        stream: A pointer to a stream.

    Returns:
        Size of the lines read.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/getline.3p.html).
        Fn signature: `ssize_t getline(char **restrict lineptr,
            size_t *restrict n, FILE *restrict stream);`.
    """
    return external_call[
        "getline",
        c_uint,
        UnsafePointer[UnsafePointer[FILE]],
        UnsafePointer[c_uint],
        UnsafePointer[FILE],
    ](lineptr, n, stream)


fn pread(
    fildes: c_int, buf: UnsafePointer[c_void], nbyte: c_uint, offset: off_t
) -> c_uint:
    """Libc POSIX `pread` function.

    Args:
        fildes: A File Descriptor to open the file with.
        buf: A pointer to a buffer to store the read string.
        nbyte: The maximum number of characters to read.
        offset: An offset to seek to.

    Returns:
        A File Descriptor or -1 in case of failure.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/read.3p.html).
        Fn signature: `ssize_t pread(int fildes, void *buf, size_t nbyte,
            off_t offset)`.
    """
    return external_call[
        "pread", c_uint, c_int, UnsafePointer[c_void], c_uint, off_t
    ](fildes, buf, nbyte, offset)


fn read(fildes: c_int, buf: UnsafePointer[c_void], nbyte: c_uint) -> c_uint:
    """Libc POSIX `read` function.

    Args:
        fildes: A File Descriptor to open the file with.
        buf: A pointer to a buffer to store the read string.
        nbyte: The maximum number of characters to read.

    Returns:
        Amount of bytes read.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/read.3p.html).
        Fn signature: `sssize_t read(int fildes, void *buf, size_t nbyte)`.
    """
    return external_call[
        "read", c_uint, c_int, UnsafePointer[c_void], c_uint
    ](fildes, buf, nbyte)


fn pwrite(
    fildes: c_int, buf: UnsafePointer[c_void], nbyte: c_uint, offset: off_t
) -> c_uint:
    """Libc POSIX `pwrite` function.

    Args:
        fildes: A File Descriptor to open the file with.
        buf: A pointer to a buffer to store the read string.
        nbyte: The maximum number of characters to read.
        offset: An offset to seek to.

    Returns:
        Amount of bytes written.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/write.3p.html).
        Fn signature: `ssize_t pwrite(int fildes, const void *buf, size_t nbyte,
            off_t offset)`.
    """
    return external_call[
        "pwrite", c_uint, c_int, UnsafePointer[c_void], c_uint, off_t
    ](fildes, buf, nbyte, offset)


fn write(fildes: c_int, buf: UnsafePointer[c_void], nbyte: c_uint) -> c_uint:
    """Libc POSIX `write` function.

    Args:
        fildes: A File Descriptor to open the file with.
        buf: A pointer to a buffer to store the read string.
        nbyte: The maximum number of characters to read.

    Returns:
        Amount of bytes written.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/write.3p.html).
        Fn signature: `ssize_t write(int fildes, const void *buf,
            size_t nbyte)`.
    """
    return external_call[
        "write", c_uint, c_int, UnsafePointer[c_void], c_uint
    ](fildes, buf, nbyte)


fn fclose(stream: UnsafePointer[FILE]) -> c_int:
    """Libc POSIX `fclose` function.

    Args:
        stream: A pointer to a stream.

    Returns:
        A File Descriptor or -1 in case of failure.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/fclose.3p.html).
        Fn signature: `int fclose(FILE *stream)`.
    """
    return external_call["fclose", c_int, UnsafePointer[FILE]](stream)


fn ftell(stream: UnsafePointer[FILE]) -> c_long:
    """Libc POSIX `ftell` function.

    Args:
        stream: A pointer to a stream.

    Returns:
        The current file position of the given stream.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/ftell.3p.html).
        Fn signature: `long ftell(FILE *stream)`.
    """
    return external_call["ftell", c_long, UnsafePointer[FILE]](stream)


fn ftello(stream: UnsafePointer[FILE]) -> off_t:
    """Libc POSIX `ftello` function.

    Args:
        stream: A pointer to a stream.

    Returns:
        The current file position of the given stream.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/ftell.3p.html).
        Fn signature: `off_t ftello(FILE *stream)`.
    """
    return external_call["ftello", off_t, UnsafePointer[FILE]](stream)


fn clearerr(stream: UnsafePointer[FILE]) -> c_void:
    """Libc POSIX `feof` function.

    Args:
        stream: A pointer to a stream.

    Returns:
        A void.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/clearerr.3p.html).
        Fn signature: `void clearerr(FILE *stream)`.
    """
    return external_call["clearerr", c_void, UnsafePointer[FILE]](stream)


fn feof(stream: UnsafePointer[FILE]) -> c_int:
    """Libc POSIX `feof` function.

    Args:
        stream: A pointer to a stream.

    Returns:
        1 if the end-of-file indicator associated with the stream is set,
            else 0.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/feof.3p.html).
        Fn signature: `int feof(FILE *stream)`.
    """
    return external_call["feof", c_int, UnsafePointer[FILE]](stream)


fn ferror(stream: UnsafePointer[FILE]) -> c_int:
    """Libc POSIX `ferror` function.

    Args:
        stream: A pointer to a stream.

    Returns:
        1 if the error indicator associated with the stream is set, else 0.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/ferror.3p.html).
        Fn signature: `int ferror(FILE *stream)`.
    """
    return external_call["ferror", c_int, UnsafePointer[FILE]](stream)


fn ioctl(fildes: c_int, request: c_int) -> c_int:
    """Libc POSIX `ioctl` function.

    Args:
        fildes: A File Descriptor to open the file with.
        request: An offset to seek to.

    Returns:
        A File Descriptor or -1 in case of failure

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/ioctl.3p.html).
        Fn signature: `int ioctl(int fildes, int request, ... /* arg */)`.
    """
    return external_call["ioctl", c_int, c_int, c_int](fildes, request)
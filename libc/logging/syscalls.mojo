# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from sys import external_call
from libc.constant import * 


fn openlog(
    ident: UnsafePointer[c_char], logopt: c_int, facility: c_int
) -> c_void:
    """Libc POSIX `openlog` function.

    Args:
        ident: A File Descriptor to open the file with.
        logopt: An offset to seek to.
        facility: Arguments for the format string.

    Returns:
        A File Descriptor or -1 in case of failure.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/closelog.3p.html).
        Fn signature: `void openlog(const char *ident, int logopt,
            int facility)`.
    """
    return external_call[
        "openlog", c_void, UnsafePointer[c_char], c_int, c_int
    ](ident, logopt, facility)


fn syslog(priority: c_int, message: UnsafePointer[c_char]) -> c_void:
    """Libc POSIX `syslog` function.

    Args:
        priority: A File Descriptor to open the file with.
        message: An offset to seek to.

    Returns:
        A File Descriptor or -1 in case of failure.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/closelog.3p.html).
        Fn signature: `void syslog(int priority, const char *message,
            ... /* arguments */)`.
    """
    return external_call["syslog", c_void, c_int, UnsafePointer[c_char]](
        priority, message
    )




fn setlogmask(maskpri: c_int) -> c_int:
    """Libc POSIX `setlogmask` function.

    Args:
        maskpri: A File Descriptor to open the file with.

    Returns:
        A File Descriptor or -1 in case of failure.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/closelog.3p.html).
        Fn signature: ` int setlogmask(int maskpri)`.
    """
    return external_call["setlogmask", c_int, c_int](maskpri)


fn closelog():
    """Libc POSIX `closelog` function.

    Notes:
        [Reference](https://man7.org/linux/man-pages/man3/closelog.3p.html).
        Fn signature: `void closelog(void)`.
    """
    _ = external_call["closelog", c_void]()
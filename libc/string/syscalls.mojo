# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from sys import external_call
from memory import UnsafePointer


@always_inline("nodebug")
fn strcat(s1: UnsafePointer[UInt8], s2: UnsafePointer[UInt8]) -> UnsafePointer[UInt8]:
    """C library <string.h> function `strcat`.

    Reference:
        https://pubs.opengroup.org/onlinepubs/9699919799/functions/strcat.html

    Prototype:
        char *strcat(char *s1, const char *s2)
    
    Description:
        Appends the string pointed to by s2 to the end of the string pointed to by s1.
    """

    return external_call["strcat", UnsafePointer[UInt8], UnsafePointer[UInt8], UnsafePointer[UInt8]](s1, s2)


@always_inline("nodebug")
fn strcpy(s1: UnsafePointer[UInt8], s2: UnsafePointer[UInt8]) -> UnsafePointer[UInt8]:
    """C library <string.h> function `strcpy`.

    Reference:
        https://pubs.opengroup.org/onlinepubs/9699919799/functions/strcpy.html

    Prototype:
        char *strcpy(char *s1, const char *s2)
    
    Description:
        Copies the string pointed to by s2 (including the terminating null character) to the array pointed to by s1.
    """

    return external_call["strcpy", UnsafePointer[UInt8], UnsafePointer[UInt8], UnsafePointer[UInt8]](s1, s2)


@always_inline("nodebug")
fn strncpy(s1: UnsafePointer[UInt8], s2: UnsafePointer[UInt8], n: UInt64) -> UnsafePointer[UInt8]:
    """C library <string.h> function `strncpy`.

    Reference:
        https://pubs.opengroup.org/onlinepubs/9699919799/functions/strncpy.html

    Prototype:
        char *strncpy(char *s1, const char *s2, size_t n)
    
    Description:
        Copies at most n characters from the string pointed to by s2 (including the terminating null character) to the array
        pointed to by s1. If the length of s2 is less than n, null characters are appended to the end of s1 to ensure that it
        is exactly n characters long.
    
    Return Value:
        The function returns a pointer to the resulting string s1.
    """

    return external_call["strncpy", UnsafePointer[UInt8], UnsafePointer[UInt8], UnsafePointer[UInt8], UInt64](s1, s2, n)


@always_inline("nodebug")
fn memcpy(
    dest: UnsafePointer[NoneType], src: UnsafePointer[NoneType], n: UInt64
) -> UnsafePointer[NoneType]:
    return external_call["memcpy", UnsafePointer[NoneType]](dest, src, n)


@always_inline("nodebug")
fn mempcopy(
    dest: UnsafePointer[NoneType], src: UnsafePointer[NoneType], n: UInt64
) -> UnsafePointer[NoneType]:
    return external_call["mempcopy", UnsafePointer[NoneType]](dest, src, n)


@always_inline("nodebug")
fn memmove(
    dest: UnsafePointer[NoneType], src: UnsafePointer[NoneType], n: UInt64
) -> UnsafePointer[NoneType]:
    return external_call["memmove", UnsafePointer[NoneType]](dest, src, n)


@always_inline("nodebug")
fn memset(
    s: UnsafePointer[NoneType], c: Int32, n: UInt64
) -> UnsafePointer[NoneType]:
    return external_call["memset", UnsafePointer[NoneType]](s, c, n)


@always_inline("nodebug")
fn strcopy(
    dest: UnsafePointer[UInt8], src: UnsafePointer[UInt8]
) -> UnsafePointer[UInt8]:
    return external_call["strcpy", UnsafePointer[UInt8]](dest, src)


@always_inline("nodebug")
fn strncopy(
    dest: UnsafePointer[UInt8], src: UnsafePointer[UInt8], n: UInt64
) -> UnsafePointer[UInt8]:
    return external_call["strncpy", UnsafePointer[UInt8]](dest, src, n)


@always_inline("nodebug")
fn strdup(s: UnsafePointer[UInt8]) -> UnsafePointer[UInt8]:
    return external_call["strdup", UnsafePointer[UInt8]](s)


@always_inline("nodebug")
fn strndup(s: UnsafePointer[UInt8], n: UInt64) -> UnsafePointer[UInt8]:
    return external_call["strndup", UnsafePointer[UInt8]](s, n)


@always_inline("nodebug")
fn strlen(s: UnsafePointer[UInt8]) -> UInt64:
    return external_call["strlen", UInt64](s)


@always_inline("nodebug")
fn strnlen(s: UnsafePointer[UInt8], maxlen: UInt64) -> UInt64:
    return external_call["strnlen", UInt64](s, maxlen)

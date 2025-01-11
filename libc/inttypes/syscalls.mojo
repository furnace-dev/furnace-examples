# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from sys import external_call


@register_passable('trivial')
struct imaxdiv_t:
  var quot: Int64
  var rem: Int64



fn imaxabs(j: Int64) -> Int64:
    """C library <math.h> function `imaxabs`.

    Link:
        https://man7.org/linux/man-pages/man3/imaxabs.3.html

    Prototype:
        intmax_t llabs(intmax_t j)

    Description:
        Computes the absolute value of j.

    Arguments:
        j: The number for which the absolute value is to be computed.

    Return value:
        The absolute value of j.
    """
    return external_call["imaxabs", Int64, Int64](j)


fn imaxdiv(numer: Int64, denom: Int64) -> imaxdiv_t:
    """C library <math.h> function `imaxdiv`.

    Link:
        https://man7.org/linux/man-pages/man3/ldiv.3.html

    Prototype:
        ldiv_t div(long x, long y)

    Description:
        Computes the quotient and remainder of  the division of the numerator numer by the denominator denom. 

    Arguments:
        numer: the numerator
        denom: the denominator

    Return value:
        The quotient and remainder of  the division of the numerator numer by the denominator denom.
    """
    return external_call["imaxdiv", imaxdiv_t, Int64, Int64](numer, denom)


fn strtoimax(nptr: UnsafePointer[Int8], endptr:UnsafePointer[UnsafePointer[Int8]], base: Int32) -> Int64:
    """C library <math.h> function `strtoimax`.

    Link:
        https://man7.org/linux/man-pages/man3/strtoimax.3.html
    
    Prototype:
        intmax_t strtoimax(const char *nptr, char **endptr, int base)

    Description:
        Converts the initial part of the string pointed to by nptr to a signed integer value using the given base, which must be between 2 and 36 inclusive.
    Arguments:
        nptr: a pointer to the string to be converted
        endptr: a pointer to a pointer to the first invalid character in the string
        base: the base to be used for the conversion

    Return value:
        On success, the converted value is returned. On error, -1 is returned.
    """
    return external_call["strtoimax", Int64, UnsafePointer[Int8], UnsafePointer[UnsafePointer[Int8]], Int32](nptr, endptr, base)



fn strtoumax(nptr: UnsafePointer[Int8], endptr:UnsafePointer[UnsafePointer[Int8]], base: Int32) -> UInt64:
    """C library <math.h> function `strtoumax`.

    Link:
        https://man7.org/linux/man-pages/man3/strtoumax.3.html
    
    Prototype:
        uintmax_t strtoimax(const char *nptr, char **endptr, int base)

    Description:
        Converts the initial part of the string pointed to by nptr to a signed integer value using the given base, which must be between 2 and 36 inclusive.
    Arguments:
        nptr: a pointer to the string to be converted
        endptr: a pointer to a pointer to the first invalid character in the string
        base: the base to be used for the conversion

    Return value:
        On success, the converted value is returned. On error, -1 is returned.
    """
    return external_call["strtoimax", UInt64, UnsafePointer[Int8], UnsafePointer[UnsafePointer[Int8]], Int32](nptr, endptr, base)
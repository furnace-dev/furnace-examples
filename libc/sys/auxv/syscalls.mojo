# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from sys import external_call


fn getauxval(type: UInt64) -> UInt64:
    """C library <sys/auxv.h> function `getauxval`.

    Reference:
        https://man7.org/linux/man-pages/man3/getauxval.3.html

    Args:
        type: The identifier associated with the value to retrieve.

    Returns:
        The value associated with the given identifier, or 0 if the identifier is not found.
    """
    return  external_call["getauxval", UInt64, UInt64](type)

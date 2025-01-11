# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from sys import external_call
from memory import UnsafePointer



fn btowc(c: Int32) -> Int32:
    """C library <wchar.h> function `btowc`.

    Reference:
        https://man7.org/linux/man-pages/man3/btowc.3.html
    
    Description:
        btowc() converts a single byte character to a wide character.

    Args:
        c: An integer representing a single byte character.
    
    Returns: 
        A wide character.
    """
    return external_call["btowc", Int32, Int32](c)



fn wctob(wc: Int32) -> Int32:
    """C library <wchar.h> function `wctob`.

    Reference:
        https://man7.org/linux/man-pages/man3/wctob.3.html
    
    Description:
        wctob() converts a wide character to a single byte character.
    
    Args:
        wc: A wide character.
    
    Returns:
        An integer representing a single byte character.
    """
    return external_call["wctob", Int32, Int32](wc)
# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from sys import external_call
from libc.constant import *


fn htonl(hostlong: c_uint) -> c_uint:
    """Libc POSIX `htonl` function.

    Reference: https://man7.org/linux/man-pages/man3/htonl.3p.html
    Fn signature: uint32_t htonl(uint32_t hostlong)

    Args: hostlong: A 32-bit unsigned integer in host byte order.
    Returns: A 32-bit unsigned integer in network byte order."""
    return external_call["htonl", c_uint, c_uint](hostlong)


fn htons(hostshort: c_ushort) -> c_ushort:
    """Libc POSIX `htons` function.

    Reference: https://man7.org/linux/man-pages/man3/htonl.3p.html
    Fn signature: uint16_t htons(uint16_t hostshort)

    Args:
        hostshort: A 16-bit unsigned integer in host byte order.
    Returns: A 16-bit unsigned integer in network byte order.
    """
    return external_call["htons", c_ushort, c_ushort](hostshort)


fn ntohl(netlong: c_uint) -> c_uint:
    """Libc POSIX `ntohl` function.

    Reference: https://man7.org/linux/man-pages/man3/htonl.3p.html
    Fn signature: uint32_t ntohl(uint32_t netlong)

    Args:
        netlong: A 32-bit unsigned integer in network byte order.
    Returns: A 32-bit unsigned integer in host byte order.
    """
    return external_call["ntohl", c_uint, c_uint](netlong)


fn ntohs(netshort: c_ushort) -> c_ushort:
    """Libc POSIX `ntohs` function.

    Reference: https://man7.org/linux/man-pages/man3/htonl.3p.html
    Fn signature: uint16_t ntohs(uint16_t netshort)

    Args:
        netshort: A 16-bit unsigned integer in network byte order.
    Returns: A 16-bit unsigned integer in host byte order.
    """
    return external_call["ntohs", c_ushort, c_ushort](netshort)

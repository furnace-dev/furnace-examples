# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from sys import external_call
from memory import UnsafePointer
from utils.static_tuple import StaticTuple


@value
@register_passable("trivial")
struct socketaddr:
    var sa_family: UInt16
    var sa_data: StaticTuple[UInt8, 14]


fn bind(socket: Int32, address: UnsafePointer[socketaddr], address_len: UInt32) -> Int32:
    """Libc POSIX `bind` function.

    Reference: https://man7.org/linux/man-pages/man3/bind.3p.html
    Fn signature: int bind(int socket, const struct socketaddr *address, UInt32 address_len)
    """
    return external_call[
        "bind", Int32, Int32, UnsafePointer[socketaddr], UInt32](socket, address, address_len)


fn recvfrom(
    socket: Int32,
    buffer: UnsafePointer[Int8],
    length: UInt64,
    flags: Int32,
    address: UnsafePointer[socketaddr],
    address_len: UnsafePointer[UInt32],
) -> Int:
    """Libc POSIX `recvfrom` function.

    Reference: https://man7.org/linux/man-pages/man3/recvfrom.3p.html
    Fn signature: ssize_t recvfrom(int socket, void *restrict buffer, size_t length, int flags, struct sockaddr *restrict address, UInt32 *restrict address_len)
    """
    return external_call["recvfrom", Int, Int32, UnsafePointer[Int8], UInt64, Int32, UnsafePointer[socketaddr], UnsafePointer[UInt32]](socket, buffer, length, flags, address, address_len)



fn recv(
    socket: Int32, buffer: UnsafePointer[Int8], length: UInt64, flags: Int32
) -> Int:
    """Libc POSIX `recv` function.

    Reference: https://man7.org/linux/man-pages/man3/recv.3p.html
    Fn signature: ssize_t recv(int socket, void *buffer, size_t length, int flags)
    """
    return external_call[
        "recv",
        Int,  # FnName, RetType
        Int32,
        UnsafePointer[Int8],
        UInt64,
        Int32,  # Args
    ](socket, buffer, length, flags)




fn send(
    socket: Int32, buffer: UnsafePointer[Int8], length: UInt64, flags: Int32
) -> Int:
    """Libc POSIX `send` function.

    Reference: https://man7.org/linux/man-pages/man3/send.3p.html
    Fn signature: ssize_t send(int socket, const void *buffer, size_t length, int flags)

    Args:
        socket: A pointer to a socket.
        buffer: A pointer to a buffer to store the address of the accepted socket.
        length: A pointer to a buffer to store the length of the address of the accepted socket.
        flags: A pointer to a buffer to store the length of the address of the accepted socket.
    Returns: A pointer to a socket.
    """
    return external_call[
        "send",
        Int,  # FnName, RetType
        Int32,
        UnsafePointer[Int8],
        UInt64,
        Int32,  # Args
    ](socket, buffer, length, flags)


fn sendto(
    socket: Int32,
    message: UnsafePointer[Int8],
    length: UInt64,
    flags: Int32,
    dest_addr: UnsafePointer[socketaddr],
    dest_len: UInt32,
) -> Int:
    """Libc POSIX `sendto` function.

    Reference: https://man7.org/linux/man-pages/man3/sendto.3p.html
    Fn signature: ssize_t sendto(int socket, const void *message, size_t length, int flags, const struct sockaddr *dest_addr, UInt32 dest_len)

    Args:
        socket: A pointer to a socket.
        message: A pointer to a buffer to store the address of the accepted socket.
        length: A pointer to a buffer to store the length of the address of the accepted socket.
        flags: A pointer to a buffer to store the length of the address of the accepted socket.
        dest_addr: A pointer to a buffer to store the length of the address of the accepted socket.
        dest_len: A pointer to a buffer to store the length of the address of the accepted socket.
    Returns: A pointer to a socket.
    """
    return external_call[
        "sendto",
        Int,  # FnName, RetType
        Int32,
        UnsafePointer[Int8],
        UInt64,
        Int32,
        UnsafePointer[socketaddr],
        UInt32,  # Args
    ](socket, message, length, flags, dest_addr, dest_len)


@value
@register_passable("trivial")
struct iovec:
    var iov_base: UnsafePointer[UInt8]
    var iov_len: UInt64


@value
@register_passable("trivial")
struct msghdr:
    var msg_name: UnsafePointer[UInt8]
    var msg_namelen: UInt16
    var msg_iov: UnsafePointer[iovec]
    var msg_iovlen: UInt64
    var msg_control: UnsafePointer[UInt8]
    var msg_controllen: UInt64
    var msg_flags: Int32


fn sendmsg(sockfd: Int32, msg: UnsafePointer[msghdr], flags: Int32) -> Int64:
    """Libc POSIX `sendmsg` function.

    Reference: https://man7.org/linux/man-pages/man3/sendmsg.3p.html
    Fn signature: ssize_t sendmsg(int sockfd, const struct msghdr *msg, int flags)
    
    Args:
        sockfd: A pointer to a socket.
        msg: A pointer to a buffer to store the address of the accepted socket.
        flags: A pointer to a buffer to store the length of the address of the accepted socket.
    
    Returns: 
        A pointer to a socket.
    """
    return external_call["sendmsg", Int64, Int32, UnsafePointer[msghdr], Int32](sockfd, msg, flags)


fn socket(domain: Int32, type: Int32, protocol: Int32) -> Int32:
    """Libc POSIX `socket` function.

    Reference: https://man7.org/linux/man-pages/man3/socket.3p.html
    Fn signature: int socket(int domain, int type, int protocol)

    Args:
        domain: Address Family see AF_ alises.
        type: Socket Type see SOCK_ alises.
        protocol: Protocol see IPPROTO_ alises.
    Returns: A pointer to a socket.
    """
    return external_call[
        "socket", Int32, Int32, Int32, Int32  # FnName, RetType  # Args
    ](domain, type, protocol)


fn socketpair(domain: Int32, type: Int32, protocol: Int32, sv: UnsafePointer[Int32]) -> Int32:
    """Libc POSIX `socketpair` function.

    Reference: https://man7.org/linux/man-pages/man3/socketpair.3p.html
    Fn signature: int socketpair(int domain, int type, int protocol, int sv[2])

    Args:
        domain: Address Family see AF_ alises.
        type: Socket Type see SOCK_ alises.
        protocol: Protocol see IPPROTO_ alises.
        sv: A pointer to a socket.
    Returns: A pointer to a socket.
    """
    return external_call[
        "socketpair", Int32, Int32, Int32, Int32, UnsafePointer[Int32]  # FnName, RetType  # Args
    ](domain, type, protocol, sv)


fn connect(socket: Int32, address: UnsafePointer[socketaddr], address_len: UInt32) -> Int32:
    """Libc POSIX `connect` function.

    Reference: https://man7.org/linux/man-pages/man3/connect.3p.html
    Fn signature: int connect(int socket, const struct socketaddr *address, UInt32 address_len)

    Args:
        socket: A pointer to a socket.
        address: A pointer to a buffer to store the address of the accepted socket.
        address_len: A pointer to a buffer to store the length of the address of the accepted socket.
    Returns: A pointer to a socket.
    """
    return external_call[
        "connect", Int32, Int32, UnsafePointer[socketaddr], UInt32  # FnName, RetType  # Args
    ](socket, address, address_len)


fn listen(socket: Int32, backlog: Int32) -> Int32:
    """Libc POSIX `listen` function.

    Reference: https://man7.org/linux/man-pages/man3/listen.3p.html
    Fn signature: int listen(int socket, int backlog)

    Args:
        socket: A pointer to a socket.
        backlog: A pointer to a buffer to store the length of the address of the accepted socket.
    Returns: A pointer to a socket.
    """
    return external_call[
        "listen", Int32  # FnName, RetType  # Args
    ](socket, backlog)


fn accept(socket: Int32, address: UnsafePointer[socketaddr], address_len: UnsafePointer[UInt32]) -> Int32:
    """Libc POSIX `accept` function.

    Reference: https://man7.org/linux/man-pages/man3/accept.3p.html
    Fn signature: int accept(int socket, struct socketaddr *restrict address, UInt32 *restrict address_len)

    Args:
        socket: A pointer to a socket.
        address: A pointer to a buffer to store the address of the accepted socket.
        address_len: A pointer to a buffer to store the length of the address of the accepted socket.
    Returns: A pointer to a socket.
    """
    return external_call[
        "accept", Int32, Int32, UnsafePointer[socketaddr], UnsafePointer[UInt32]  # FnName, RetType  # Args
    ](socket, address, address_len)


fn getsockname(socket: Int32, address: UnsafePointer[socketaddr], address_len: UnsafePointer[UInt32]) -> Int32:
    """Libc POSIX `getsockname` function.

    Reference: https://man7.org/linux/man-pages/man3/getsockname.3p.html
    Fn signature: int getsockname(int socket, struct socketaddr *restrict address, UInt32 *restrict address_len)

    Args:
        socket: A pointer to a socket.
        address: A pointer to a buffer to store the address of the accepted socket.
        address_len: A pointer to a buffer to store the length of the address of the accepted socket.
    Returns: A pointer to a socket.
    """
    return external_call[
        "getsockname", Int32, Int32, UnsafePointer[socketaddr], UnsafePointer[UInt32]  # FnName, RetType  # Args
    ](socket, address, address_len)


fn getpeername(socket: Int32, address: UnsafePointer[socketaddr], address_len: UnsafePointer[UInt32]) -> Int32:
    """Libc POSIX `getpeername` function.

    Reference: https://man7.org/linux/man-pages/man3/getpeername.3p.html
    Fn signature: int getpeername(int socket, struct socketaddr *restrict address, UInt32 *restrict address_len)

    Args:
        socket: A pointer to a socket.
        address: A pointer to a buffer to store the address of the accepted socket.
        address_len: A pointer to a buffer to store the length of the address of the accepted socket.
    Returns: A pointer to a socket.
    """
    return external_call[
        "getpeername", Int32, Int32, UnsafePointer[socketaddr], UnsafePointer[UInt32]  # FnName, RetType  # Args
    ](socket, address, address_len)


fn shutdown(socket: Int32, how: Int32) -> Int32:
    """Libc POSIX `shutdown` function.

    Reference: https://man7.org/linux/man-pages/man3/shutdown.3p.html
    Fn signature: int shutdown(int socket, int how)

    Args:
        socket: A pointer to a socket.
        how: A pointer to a buffer to store the length of the address of the accepted socket.
    Returns: A pointer to a socket.
    """
    return external_call[
        "shutdown", Int32, Int32, Int32  # FnName, RetType  # Args
    ](socket, how)


fn close(socket: Int32) -> Int32:
    """Libc POSIX `close` function.

    Reference: https://man7.org/linux/man-pages/man3/close.3p.html
    Fn signature: int close(int socket)

    Args:
        socket: A pointer to a socket.
    Returns: A pointer to a socket.
    """
    return external_call[
        "close", Int32, Int32# FnName, RetType  # Args
    ](socket)


fn accept4(socket: Int32, address: UnsafePointer[socketaddr], address_len: UnsafePointer[UInt32]) -> Int32:
    """Libc POSIX `accept4` function.

    Reference: https://man7.org/linux/man-pages/man3/accept4.3p.html
    Fn signature: int accept4(int socket, struct socketaddr *restrict address, UInt32 *restrict address_len, int flags)

    Args:
        socket: A pointer to a socket.
        address: A pointer to a buffer to store the address of the accepted socket.
        address_len: A pointer to a buffer to store the length of the address of the accepted socket.
    Returns: A pointer to a socket.
    """
    return external_call[
        "accept4", Int32, Int32, UnsafePointer[socketaddr], UnsafePointer[UInt32]  # FnName, RetType  # Args
    ](socket, address, address_len) 

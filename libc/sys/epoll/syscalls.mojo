# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from sys import external_call
from memory import UnsafePointer


fn epoll_create(size: Int32) -> Int32:
    """C library <sys/epoll.h> function `epoll_create`.

    Reference:
        https://man7.org/linux/man-pages/man2/epoll_create.2.html
    
    Args:
        size: The size of the epoll instance.
    
    Description:
        Creates a new epoll instance.

    Returns:
        The file descriptor of the new epoll instance.
    """
    return external_call["epoll_create", Int32, Int32](size)


fn epoll_create1(flags: Int32) -> Int32:
    """C library <sys/epoll.h> function `epoll_create1`.

    Reference:
        https://man7.org/linux/man-pages/man2/epoll_create1.2.html
    
    Args:
        flags: Flags to control the behavior of the epoll instance.
    
    Description:
        Creates a new epoll instance with the specified flags.
    Returns:
        The file descriptor of the new epoll instance.
    """
    return external_call["epoll_create1", Int32, Int32](flags)
    

# @register_passable("trivial")
# struct event_data:
#     ptr: UnsafePointer[Int8]
#     fd: Int32
#     u32: UInt32
#     u64: UInt64


@register_passable("trivial")
struct epoll_event:
    pass


fn epoll_ctl(epfd: Int32, op: Int32, fd: Int32, event: UnsafePointer[epoll_event]) -> Int32:
    """C library <sys/epoll.h> function `epoll_ctl`.

    Reference:
        https://man7.org/linux/man-pages/man2/epoll_ctl.2.html
    
    Args:
        epfd: The file descriptor of the epoll instance.
        op: The operation to perform on the epoll instance.
        fd: The file descriptor of the epoll instance.
        event: The event to add or modify in the epoll instance.
    
    Description:
        Adds or modifies an event in the epoll instance.
    
    Returns:
        0 on success, or -1 on error.
    """
    return external_call["epoll_ctl", Int32, Int32, Int32, Int32, UnsafePointer[epoll_event]](epfd, op, fd, event)    




fn epoll_pwait(epfd: Int32, events: UnsafePointer[epoll_event], maxevents: Int32, timeout: Int32, sigmask: UnsafePointer[epoll_event]) -> Int32:
    """C library <sys/epoll.h> function `epoll_pwait`.

    Reference:
        https://man7.org/linux/man-pages/man2/epoll_pwait.2.html
    
    Args:
        epfd: The file descriptor of the epoll instance.
        events: The events to wait for.
        maxevents: The maximum number of events to wait for.
        timeout: The timeout in milliseconds.
        sigmask: The signal mask to apply to the wait.
    
    Description:
        Waits for events on the epoll instance.
    
    Returns:
        The number of events that were signaled, or -1 on error.
    """
    return external_call["epoll_pwait", Int32, Int32, UnsafePointer[epoll_event], Int32, Int32, UnsafePointer[epoll_event]](epfd, events, maxevents, timeout, sigmask)


@register_passable("trivial")
struct timespec:
    var tv_sec: Int32
    var tv_nsec: Int64


fn epoll_pwait2(epfd: Int32, events: UnsafePointer[epoll_event], maxevents: Int32, timeout: UnsafePointer[timespec], sigmask: UnsafePointer[epoll_event]) -> Int32:
    """C library <sys/epoll.h> function `epoll_pwait2`.

    Reference:
        https://man7.org/linux/man-pages/man2/epoll_pwait.2.html
    
    Args:
        epfd: The file descriptor of the epoll instance.
        events: The events to wait for.
        maxevents: The maximum number of events to wait for.
        timeout: The timeout in milliseconds.
        sigmask: The signal mask to apply to the wait.
    
    Description:
        Waits for events on the epoll instance.
    
    Returns:
        The number of events that were signaled, or -1 on error.
    """
    return external_call["epoll_pwait2", Int32, Int32, UnsafePointer[epoll_event], Int32, UnsafePointer[timespec], UnsafePointer[epoll_event]](epfd, events, maxevents, timeout, sigmask)



fn epoll_wait(epfd: Int32, events: UnsafePointer[epoll_event], maxevents: Int32, timeout: Int32) -> Int32:
    """C library <sys/epoll.h> function `epoll_wait`.

    Reference:
        https://man7.org/linux/man-pages/man2/epoll_wait.2.html

    Args:
        epfd: The file descriptor of the epoll instance.
        events: The events to wait for.
        maxevents: The maximum number of events to wait for.
        timeout: The timeout in milliseconds.

    Description:
        Waits for events on the epoll instance.
    
    Returns:
        The number of events that were signaled, or -1 on error.
    """
    return external_call["epoll_wait", Int32, Int32, UnsafePointer[epoll_event], Int32, Int32](epfd, events, maxevents, timeout)
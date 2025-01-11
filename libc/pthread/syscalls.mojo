# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from memory import UnsafePointer
from sys import external_call


@register_passable("trivial")
struct pthread_attr_t:
    var detachstate: Int32
    var stack: UnsafePointer[Int8]
    var stacksize: Int
    var guardsize: Int


@register_passable("trivial")
struct pthread_condattr_t:
    var clockid: Int32
    var pshared: Int32


fn pthread_atfork(prepare: UnsafePointer[Int8], parent: UnsafePointer[Int8], child: UnsafePointer[Int8]) -> Int32:
    """C library <pthread.h> function `pthread_atfork`.

    Reference:
        https://man7.org/linux/man-pages/man3/pthread_atfork.3.html
    
    Args:
        prepare: The function to be called before the fork.
        parent: The function to be called in the parent process.
        child: The function to be called in the child process.
    
    Returns:
        0 on success, or -1 on error.
    """
    return external_call["pthread_atfork", Int32, UnsafePointer[Int8], UnsafePointer[Int8], UnsafePointer[Int8]](
        prepare, parent, child
    )



fn pthread_attr_destroy(attr: pthread_attr_t) -> Int32:
    """C library <pthread.h> function `pthread_attr_destroy`.

    Reference:
        https://man7.org/linux/man-pages/man3/pthread_attr_destroy.3.html
    
    Args:
        attr: The attribute object to be destroyed.
    
    Returns:
        On success, these functions return 0; on error, they return a
       nonzero error number.
    """
    return external_call["pthread_attr_destroy", Int32, pthread_attr_t](attr)


fn pthread_attr_init(attr: pthread_attr_t) -> Int32:
    """C library <pthread.h> function `pthread_attr_init`.

    Reference:
        https://man7.org/linux/man-pages/man3/pthread_attr_init.3.html
    
    Args:
        attr: The attribute object to be initialized.
    
    Returns:
        On success, these functions return 0; on error, they return a
       nonzero error number.
    """
    return external_call["pthread_attr_init", Int32, pthread_attr_t](attr)


fn pthread_attr_getdetachstate(attr: pthread_attr_t, detachstate: Int32) -> Int32:
    """C library <pthread.h> function `pthread_attr_getdetachstate`.

    Reference:
        https://man7.org/linux/man-pages/man3/pthread_attr_getdetachstate.3.html
    
    Args:
        attr: The attribute object to be queried.
        detachstate: The value of the detachstate attribute.
    
    Returns:
        On success, these functions return 0; on error, they return a
       nonzero error number.
    """
    return external_call["pthread_attr_getdetachstate", Int32, pthread_attr_t, Int32](attr, detachstate)


fn pthread_attr_setdetachstate(attr: pthread_attr_t, detachstate: Int32) -> Int32:
    """C library <pthread.h> function `pthread_attr_setdetachstate`.

    Reference:
        https://man7.org/linux/man-pages/man3/pthread_attr_setdetachstate.3.html
    
    Args:
        attr: The attribute object to be set.
        detachstate: The value of the detachstate attribute.
    
    Returns:
        On success, these functions return 0; on error, they return a
       nonzero error number.
    """
    return external_call["pthread_attr_setdetachstate", Int32, pthread_attr_t, Int32](attr, detachstate)


fn pthread_attr_getguardsize(attr: UnsafePointer[pthread_attr_t], guardsize: UnsafePointer[Int32]) -> Int32:
    """C library <pthread.h> function `pthread_attr_getguardsize`.

    Reference:
        https://man7.org/linux/man-pages/man3/pthread_attr_getguardsize.3.html
    
    Args:
        attr: The attribute object to be queried.
        guardsize: The value of the guardsize attribute.
    
    Returns:
        On success, these functions return 0; on error, they return a
       nonzero error number.
    """
    return external_call["pthread_attr_getguardsize", Int32, UnsafePointer[pthread_attr_t], UnsafePointer[Int32]](attr, guardsize)


fn pthread_attr_setguardsize(attr: UnsafePointer[pthread_attr_t], guardsize: Int32) -> Int32:
    """C library <pthread.h> function `pthread_attr_setguardsize`.

    Reference:
        https://man7.org/linux/man-pages/man3/pthread_attr_setguardsize.3.html
    
    Args:
        attr: The attribute object to be set.
        guardsize: The value of the guardsize attribute.
    
    Returns:
        On success, these functions return 0; on error, they return a
       nonzero error number.
    """
    return external_call["pthread_attr_setguardsize", Int32, UnsafePointer[pthread_attr_t], Int32](attr, guardsize)



fn pthread_attr_getstack(attr: UnsafePointer[pthread_attr_t], stackaddr: UnsafePointer[UnsafePointer[Int8]], stacksize: UnsafePointer[Int]) -> Int32:
    """C library <pthread.h> function `pthread_attr_getstack`.

    Reference:
        https://man7.org/linux/man-pages/man3/pthread_attr_getstack.3.html
    
    Args:
        attr: The attribute object to be queried.
        stackaddr: The value of the stackaddr attribute.
        stacksize: The value of the stacksize attribute.
    
    Returns:
        On success, these functions return 0; on error, they return a
       nonzero error number.
    """
    return external_call["pthread_attr_getstack", Int32, UnsafePointer[pthread_attr_t], UnsafePointer[UnsafePointer[Int8]], UnsafePointer[Int]](attr, stackaddr, stacksize)


fn pthread_attr_setstack(attr: UnsafePointer[pthread_attr_t], stackaddr: UnsafePointer[Int8], stacksize: Int) -> Int32:
    """C library <pthread.h> function `pthread_attr_setstack`.

    Reference:
        https://man7.org/linux/man-pages/man3/pthread_attr_setstack.3.html
    
    Args:
        attr: The attribute object to be set.
        stackaddr: The value of the stackaddr attribute.
        stacksize: The value of the stacksize attribute.
    
    Returns:
        On success, these functions return 0; on error, they return a
       nonzero error number.
    """
    return external_call["pthread_attr_setstack", Int32, UnsafePointer[pthread_attr_t], UnsafePointer[Int8], Int](attr, stackaddr, stacksize)   


fn pthread_attr_setstacksize(attr: UnsafePointer[pthread_attr_t], stacksize: Int) -> Int32:
    """C library <pthread.h> function `pthread_attr_setstacksize`.

    Reference:
        https://man7.org/linux/man-pages/man3/pthread_attr_setstacksize.3.html
    
    Args:
        attr: The attribute object to be set.
        stacksize: The value of the stacksize attribute.
    
    Returns:
        On success, these functions return 0; on error, they return a
       nonzero error number.
    """
    return external_call["pthread_attr_setstacksize", Int32, UnsafePointer[pthread_attr_t], Int](attr, stacksize)


fn pthread_attr_getstacksize(attr: UnsafePointer[pthread_attr_t], stacksize: UnsafePointer[Int]) -> Int32:
    """C library <pthread.h> function `pthread_attr_getstacksize`.

    Reference:
        https://man7.org/linux/man-pages/man3/pthread_attr_getstacksize.3.html
    
    Args:    
        attr: The attribute object to be queried.
        stacksize: The value of the stacksize attribute.
    
    Returns:
        On success, these functions return 0; on error, they return a
       nonzero error number.
    """
    return external_call["pthread_attr_getstacksize", Int32, UnsafePointer[pthread_attr_t], UnsafePointer[Int]](attr, stacksize)


fn pthread_condattr_destroy(attr: pthread_condattr_t) -> Int32:
    """C library <pthread.h> function `pthread_condattr_destroy`.

    Reference:
        https://man7.org/linux/man-pages/man3/pthread_condattr_destroy.3.html
    
    Args:
        attr: The attribute object to be destroyed.
    
    Returns:
        On success, these functions return 0; on error, they return a
       nonzero error number.
    """
    return external_call["pthread_condattr_destroy", Int32, pthread_condattr_t](attr)


# ....
# 后续补充



# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from sys import external_call
from memory import UnsafePointer

fn setjmp(env: UnsafePointer[Int32]) -> Int32:
    """C library <setjmp.h> function `setjmp`.
    
    Reference:
        https://man7.org/linux/man-pages/man3/setjmp.3.html
    
    Prototype:
        int setjmp(jmp_buf env)
    
    Description:
        The setjmp() function saves the current values of the registers in the jmp_buf structure pointed to by env.
        The return value is the value that setjmp() will return to if it encounters an exception.
        The setjmp() function returns 0 if it succeeds; it returns a non-zero value if it encounters an exception.
        The setjmp() function can be called from any function, including functions that are not marked with the __attribute__((__noreturn__)) attribute.
    """
    return external_call["setjmp", Int32, UnsafePointer[Int32]](env)


fn longjmp(env: UnsafePointer[Int32], val: Int32) -> Int32:
    """C library <setjmp.h> function `longjmp`.
    
    Reference:
        https://man7.org/linux/man-pages/man3/longjmp.3.html
    
    Prototype:
        void longjmp(jmp_buf env, int val)
    
    Description:
        The longjmp() function restores the values of the registers saved in the jmp_buf structure pointed to by env,
        and then returns the value val to the caller of setjmp().
        The longjmp() function can only be called from within the function that called setjmp().
        If the value val is 0, longjmp() returns to the point where setjmp() was called.
        If the value val is non-zero, longjmp() returns to the point where setjmp() was called,
        but with the value val as the return value of setjmp().
        If longjmp() is called outside the scope of the function that called setjmp(),
        the behavior is undefined.
    """
    return external_call["longjmp", Int32, UnsafePointer[Int32], Int32](env, val)
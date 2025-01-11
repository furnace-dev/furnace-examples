# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from sys import external_call
from memory import UnsafePointer


fn prctl(option: Int32, arg2: UInt64, arg3: UInt64, arg4: UInt64, arg5: UInt64) -> Int32:
    """C library <sys/prctl.h> function `prctl`.

    Reference:
        https://man7.org/linux/man-pages/man2/prctl.2.html
    
    Args:
        option: The operation to perform.
        arg2: The argument 2.
        arg3: The argument 3.
        arg4: The argument 4.
        arg5: The argument 5.
    
    Description:
        prctl() performs a privileged operation on the calling process.
        It is used to get and set various options controlling the behavior of the kernel.
        The operation is specified in the `option` argument, and additional arguments may be required depending on the operation.
        The `option` argument can be any of the following values:
        - `PR_SET_PDEATHSIG`: Set the parent death signal of the calling process.
        - `PR_GET_PDEATHSIG`: Get the parent death signal of the calling process.
        - `PR_SET_NAME`: Set the name of the calling process.
        - `PR_GET_NAME`: Get the name of the calling process.
        - `PR_GET_DUMPABLE`: Get the dumpable flag of the calling process.
        - `PR_SET_DUMPABLE`: Set the dumpable flag of the calling process.
        - `PR_GET_UNALIGN`: Get the unaligned flag of the calling process.
        - `PR_SET_UNALIGN`: Set the unaligned flag of the calling process.
        - `PR_GET_TIMING`: Get the timing flag of the calling process.
        - `PR_SET_TIMING`: Set the timing flag of the calling process.
        - `PR_GET_SECCOMP`: Get the seccomp flag of the calling process.
        - `PR_SET_SECCOMP`: Set the seccomp flag of the calling process.
        - `PR_GET_SECCOMP`: Get the seccomp flag of the calling process.
        - `PR_SET_TSC`: Set the TSC flag of the calling process.
        - `PR_GET_TSC`: Get the TSC flag of the calling process.
        - `PR_SET_TSC`: Set the TSC flag of the calling process.
        - `PR_GET_TSC`: Get the TSC flag of the calling process.
        - `PR_SET_TSC`: Set the TSC flag of the calling process.
        - `PR_GET_TSC`: Get the TSC flag of the calling process.
        - `PR_SET_SECUREBITS`: Set the securebits of the calling process.
        - `PR_GET_SECUREBITS`: Get the securebits of the calling process.
        - `PR_SET_TIMERSLACK`: Set the timerslack of the calling process.
        - `PR_GET_TIMERSLACK`: Get the timerslack of the calling process.
        ...
    
    return:
        The return value of the function is 0 on success, or -1 on error.
    """

    return external_call["prctl", Int32, Int32, UInt64, UInt64, UInt64, UInt64](option, arg2, arg3, arg4, arg5)


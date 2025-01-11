# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from sys import external_call
from memory import UnsafePointer


fn kill(pid: Int32, sig: Int32) -> Int32:
    """C library <signal.h> function `kill`.

    Reference:
        https://man7.org/linux/man-pages/man2/kill.2.html
    
    Prototype:
        int kill(pid_t pid, int sig)
    
    Description:
        The kill() function sends a signal to the process specified by pid.
        The signal sent is specified by sig. If sig is 0, no signal is sent, but error checking is still performed.
        If sig is SIGKILL or SIGSTOP, the process is killed or stopped, respectively.
        If sig is SIGSEGV, the program is terminated with a segmentation fault.
        If sig is SIGFPE, the program is terminated with a floating-point exception.
        If sig is SIGILL, the program is terminated with an illegal instruction.
        If sig is SIGBUS, the program is terminated with a bus error.

    Return Value:
        On success, kill() returns 0. On error, -1 is returned, and errno is set to indicate the error.
    """
    return external_call["kill", Int32, Int32, Int32](pid, sig)


fn Kill(pid: Int32, sig: Int32) -> Int32:
    """C library <signal.h> function `kill`.

    Reference:
        https://man7.org/linux/man-pages/man2/kill.2.html
    
    Prototype:
        int kill(pid_t pid, int sig)
    
    Description:
        The kill() function sends a signal to the process specified by pid.
        The signal sent is specified by sig. If sig is 0, no signal is sent, but error checking is still performed.
        If sig is SIGKILL or SIGSTOP, the process is killed or stopped, respectively.
        If sig is SIGSEGV, the program is terminated with a segmentation fault.
        If sig is SIGFPE, the program is terminated with a floating-point exception.
        If sig is SIGILL, the program is terminated with an illegal instruction.
        If sig is SIGBUS, the program is terminated with a bus error.

    Return Value:
        On success, kill() returns 0. On error, -1 is returned, and errno is set to indicate the error.
    """
    return external_call["Kill", Int32, Int32, Int32](pid, sig)


fn craise(sig: Int32) -> Int32:
    """C library <signal.h> function `raise`.

    Reference:
        https://man7.org/linux/man-pages/man3/raise.3.html

    Prototype:
        int raise(int sig)

    Description:
        The raise() function causes the signal sig to be sent to the calling process.
        If sig is 0, no signal is sent, but error checking is still performed.
        If sig is SIGKILL or SIGSTOP, the process is killed or stopped, respectively.
        If sig is SIGSEGV, the program is terminated with a segmentation fault.
        If sig is SIGFPE, the program is terminated with a floating-point exception.
        If sig is SIGILL, the program is terminated with an illegal instruction.
        If sig is SIGBUS, the program is terminated with a bus error.
    """
    return external_call["raise", Int32, Int32](sig)


fn sigaction(sig: Int32, act: UnsafePointer[Int8], oldact: UnsafePointer[Int8]) -> Int32:
    """C library <signal.h> function `sigaction`.

    Reference:
        https://man7.org/linux/man-pages/man3/sigaction.3.html
    
    Prototype:
        int sigaction(int signum, const struct sigaction *act, struct sigaction *oldact)

    Description:
        The sigaction() function sets the action for the signal specified by signum.
        If the action is SIG_IGN, the signal is ignored.
        If the action is SIG_DFL, the default action for the signal is used.
        Otherwise, the action is specified by the handler argument.
    """
    return external_call['sigaction', Int32, Int32, UnsafePointer[Int8], UnsafePointer[Int8]](sig, act, oldact)


fn sigaltstack(ss: UnsafePointer[Int8], oss: UnsafePointer[Int8]) -> Int32:
    """C library <signal.h> function `sigaltstack`.

    Reference:
        https://man7.org/linux/man-pages/man2/sigaltstack.2.html
    
    Prototype:
        int sigaltstack(const stack_t *ss, stack_t *oss)

    Description:
        The sigaltstack() function sets the alternate signal stack.
    """
    return external_call['sigaltstack', Int32, UnsafePointer[Int8], UnsafePointer[Int8]](ss, oss)


fn sigdelset(set: UnsafePointer[Int8], signo: Int32) -> Int32: 
    """C library <signal.h> function `sigdelset`.

    Reference:
        https://man7.org/linux/man-pages/man3/sigdelset.3.html
    
    Prototype:
        int sigdelset(sigset_t *set, int signo)

    Description:
        The sigdelset() function deletes the specified signal from the set.
    """
    return external_call['sigdelset', Int32, UnsafePointer[Int8], Int32](set, signo)


fn sigemptyset(set: UnsafePointer[Int8]) -> Int32:
    """C library <signal.h> function `sigemptyset`.
    
    Reference:
        https://man7.org/linux/man-pages/man3/sigemptyset.3.html
    
    Prototype:
        int sigemptyset(sigset_t *set)
    
    Description:
        The sigemptyset() function clears the set.
    """
    return external_call['sigemptyset', Int32, UnsafePointer[Int8]](set)


fn sigfillset(set: UnsafePointer[Int8]) -> Int32:
    """C library <signal.h> function `sigfillset`.

    Reference:
        https://man7.org/linux/man-pages/man3/sigfillset.3.html
    
    Prototype:
        int sigfillset(sigset_t *set)
    
    Description:
        The sigfillset() function fills the set with all possible signals.
    """
    return external_call['sigfillset', Int32, UnsafePointer[Int8]](set)


fn signal(signum: Int32, handler: UnsafePointer[Int8]) -> UnsafePointer[Int8]:
    """C library <signal.h> function `signal`.
    
    Reference:
        https://man7.org/linux/man-pages/man3/signal.3.html
    
    Prototype:
        sighandler_t signal(int signum, sighandler_t handler)
    
    Description:
        The signal() function sets the action for the signal specified by signum.
        If the action is SIG_IGN, the signal is ignored.
        If the action is SIG_DFL, the default action for the signal is used.
        Otherwise, the action is specified by the handler argument.

        The handler can be SIG_DFL, SIG_IGN, or a pointer to a function that takes an int argument.

        The signal() function returns the old action for the signal.

        The signal() function is equivalent to setting the handler to the specified action and then calling sigaction(signum, handler).
    """

    return external_call['signal', UnsafePointer[Int8], Int32, UnsafePointer[Int8]](signum, handler) 



fn sigprocmask(how: Int32, set: UnsafePointer[Int8], oldset: UnsafePointer[Int8]) -> Int32:
    """C library <signal.h> function `sigprocmask`.

    Reference:
        https://man7.org/linux/man-pages/man2/sigprocmask.2.html

    Prototype:
        int sigprocmask(int how, const sigset_t *set, sigset_t *oldset)

    Description:
        The sigprocmask() function manipulates the set of blocked signals.

    Return Value:
        On success, sigprocmask() returns 0. On error, -1 is returned, and errno is set to indicate the error.
    """
    return external_call['sigprocmask', Int32, Int32, UnsafePointer[Int8], UnsafePointer[Int8]](how, set, oldset)
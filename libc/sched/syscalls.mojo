# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from sys import external_call
from memory import UnsafePointer


@register_passable("trivial")
struct sched_param:
    var sched_priority: Int32


@register_passable("trivial")
struct timespec:
    var tv_sec: Int32
    var tv_nsec: Int64


fn sched_get_priority_max(policy: Int32)-> Int32:
    """C library <sched.h> function `sched_get_priority_max`.

    Reference:
        https://man7.org/linux/man-pages/man2/sched_get_priority_max.2.html

    Prototype:
        int sched_get_priority_max(int policy);

    Description:
        The sched_get_priority_max() function retrieves the maximum scheduling priority for the specified scheduling policy.
        The policy argument specifies the scheduling policy whose maximum priority is to be retrieved. The valid values for the policy argument are SCHED_OTHER, SCHED_FIFO, and SCHED_RR.
    
    Return Value:    
        On success, the maximum scheduling priority for the specified scheduling policy is returned. On error, -1 is returned, and errno is set to indicate the error.
        
    """
    return external_call["sched_get_priority_max", Int32, Int32](policy)


fn sched_get_priority_min(policy: Int32)-> Int32:
    """C library <sched.h> function `sched_get_priority_min`.

    Reference:
        https://man7.org/linux/man-pages/man2/sched_get_priority_min.2.html
    
    Prototype:
        int sched_get_priority_min(int policy);
    
    Description:
        The sched_get_priority_min() function retrieves the minimum scheduling priority for the specified scheduling policy.
        The policy argument specifies the scheduling policy whose minimum priority is to be retrieved. The valid values for the policy argument are SCHED_OTHER, SCHED_FIFO, and SCHED_RR.
    
    Return Value:
        On success, the minimum scheduling priority for the specified scheduling policy is returned. On error, -1 is returned, and errno is set to indicate the error.
        
    """
    return external_call["sched_get_priority_min", Int32, Int32](policy)


fn sched_getaffinity(pid: Int32, cpusetsize: Int32, cpuset: UnsafePointer[Int32])-> Int32:
    """C library <sched.h> function `sched_getaffinity`.

    Reference:
        https://man7.org/linux/man-pages/man2/sched_getaffinity.2.html

    Prototype:
        int sched_getaffinity(pid_t pid, size_t cpusetsize, cpu_set_t *cpuset);

    Description:
        The sched_getaffinity() function retrieves the CPU affinity of the process specified by the pid argument.
        The pid argument specifies the process ID of the process whose CPU affinity is to be retrieved. The pid argument can be 0, in which case the calling process is changed.

    Return Value:
        On success, sched_getaffinity() returns 0. On error, -1 is returned, and errno is set to indicate the error.

    """
    return external_call["sched_getaffinity", Int32, Int32, Int32, UnsafePointer[Int32]](pid, cpusetsize, cpuset) 


fn sched_getcpucount()-> Int32:
    """C library <sched.h> function `sched_getcpucount`.

    Reference:
        https://man7.org/linux/man-pages/man2/sched_getcpucount.2.html
    
    Prototype:
        int sched_getcpucount(void);
    
    Description:
        The sched_getcpucount() function returns the number of CPUs in the system.
    
    Return Value:
        The number of CPUs in the system.
    """
    return external_call["sched_getcpucount", Int32]()


fn sched_getparam(pid: Int32, param: UnsafePointer[sched_param])-> Int32:
    """C library <sched.h> function `sched_getparam`.

    Reference:
        https://man7.org/linux/man-pages/man2/sched_getparam.2.html
    
    Prototype:
        int sched_getparam(pid_t pid, struct sched_param *param);
    
    Description:
        The sched_getparam() function retrieves the scheduling parameters for the specified process.
        The pid argument specifies the process ID of the process whose scheduling parameters are to be retrieved. The pid argument can be 0, in which case the calling process is changed.

    Return Value:
        On success, sched_getparam() returns 0. On error, -1 is returned, and errno is set to indicate the error.
        
    """
    return external_call["sched_getparam", Int32, Int32, UnsafePointer[sched_param]](pid, param)


fn sched_getscheduler(pid: Int32)-> Int32:
    """C library <sched.h> function `sched_getscheduler`.

    Reference:
        https://man7.org/linux/man-pages/man2/sched_getscheduler.2.html

    Prototype:
        int sched_getscheduler(pid_t pid);
        
    Description:
        The sched_getscheduler() function retrieves the scheduling policy and parameters for the specified process.
        The pid argument specifies the process ID of the process whose scheduling policy and parameters are to be retrieved. The pid argument can be 0, in which case the calling process is changed.
        The policy and parameters are returned in the structure sched_param in the param argument. The structure sched_param is defined in <sched.h> and contains two members: sched_priority, which specifies the priority of the process, and sched_slice, which specifies the time slice for a round-robin scheduling policy.        
        
    Return Value:
        On success, the scheduling policy for the process is returned in the policy argument. Otherwise, -1 is returned, and errno is set to indicate the error.
    """
    return external_call["sched_getscheduler", Int32, Int32](pid)


fn sched_rr_get_interval(pid: Int32, interval: UnsafePointer[timespec])-> Int32:
    """C library <sched.h> function `sched_rr_get_interval`.

    Reference:
        https://man7.org/linux/man-pages/man2/sched_rr_get_interval.2.html

    Prototype:
        int sched_rr_get_interval(pid_t pid, struct timespec *interval);

    Description:
        The sched_rr_get_interval() function retrieves the time slice for a round-robin scheduling policy for the specified process.
        The pid argument specifies the process ID of the process whose time slice is to be retrieved. The pid argument can be 0, in which case the calling process is changed.        
        The interval argument specifies the time slice for the process. The interval argument is a pointer to a struct timespec structure that is filled in with the time slice for the process.
        
    Return Value:
        On success, the time slice for the process is returned in the interval argument. Otherwise, -1 is returned, and errno is set to indicate the error.
        
    """
    return external_call["sched_rr_get_interval", Int32, Int32, UnsafePointer[timespec]](pid, interval)


fn sched_setaffinity(pid: Int32, cpusetsize: Int32, cpuset: UnsafePointer[Int32]) -> Int32:
    """C library <sched.h> function `sched_setaffinity`.

    Reference:
        https://man7.org/linux/man-pages/man2/sched_setaffinity.2.html

    Prototype:
        int sched_setaffinity(pid_t pid, size_t cpusetsize, const cpu_set_t *cpuset);
        
    Description:
        The sched_setaffinity() function sets the CPU affinity of the process specified by the pid argument to the set of CPUs specified by the cpuset argument.
        The pid argument specifies the process ID of the process whose CPU affinity is to be set. The pid argument can be 0, in which case the calling process is changed.
        The cpuset argument specifies the set of CPUs for which the process's CPU affinity is to be set. The cpuset argument can be NULL, in which case the process's current CPU affinity is cleared.
        The cpusetsize argument specifies the size of the cpuset argument in bytes. The size of the cpuset argument must be at least sizeof(cpu_set_t).
        
    Return Value:
        On success, sched_setaffinity() returns 0. On error, -1 is returned, and errno is set to indicate the error.
        
    """
    return external_call["sched_setaffinity", Int32, Int32, Int32, UnsafePointer[Int32]](pid, cpusetsize, cpuset)


fn sched_setparam(pid: Int32, param: UnsafePointer[sched_param]) -> Int32:
    """C library <sched.h> function `sched_setparam`.

    Reference:
        https://man7.org/linux/man-pages/man2/sched_setparam.2.html
    
    Prototype:
        int sched_setparam(pid_t pid, const struct sched_param *param);
        
    Description:
        The sched_setparam() function sets the scheduling parameters for the specified process.
        The pid argument specifies the process ID of the process whose scheduling parameters are to be changed. The pid argument can be 0, in which case the calling process is changed.
    
    Return Value:
        On success, sched_setparam() returns 0. On error, -1 is returned, and errno is set to indicate the error.
        
    """
    return external_call["sched_setparam", Int32, Int32, UnsafePointer[sched_param]](pid, param)


fn sched_setscheduler(pid: Int32, policy: Int32, param: UnsafePointer[sched_param]) -> Int32:
    """C library <sched.h> function `sched_setscheduler`.

    Reference:
        https://man7.org/linux/man-pages/man2/sched_setscheduler.2.html

    Prototype:
        int sched_setscheduler(pid_t pid, int policy, const struct sched_param *param);
        
    Description:
        The sched_setscheduler() function sets the scheduling policy and parameters for the specified process.
        The policy and parameters specified in the param argument are used for the process specified by the pid argument.
        The pid argument specifies the process ID of the process whose scheduling policy and parameters are to be changed. The pid argument can be 0, in which case the calling process is changed.
        The policy argument specifies the new scheduling policy for the process. The valid values for the policy argument are SCHED_OTHER, SCHED_FIFO, and SCHED_RR.
        The param argument specifies the new scheduling parameters for the process. The structure sched_param is defined in <sched.h> and contains two members: sched_priority, which specifies the priority of the process, and sched_slice, which specifies the time slice for a round-robin scheduling policy.
        
    Return Value:
        On success, sched_setscheduler() returns 0. On error, -1 is returned, and errno is set to indicate the error.
        
    """
    return external_call["sched_setscheduler", Int32, Int32, Int32, UnsafePointer[sched_param]](pid, policy, param)


fn sched_yield() -> Int32:
    """C library <sched.h> function `sched_yield`.

    Reference:
        https://man7.org/linux/man-pages/man2/sched_yield.2.html

    Prototype:
        int sched_yield(void)
        
    Description:
        The sched_yield() function causes the calling thread to relinquish the CPU.
        The function is designed to give other threads a chance to run. The exact semantics are system-dependent.
        
    Return Value:
        On success, zero is returned. On error, -1 is returned, and errno is set to indicate the error.
        
    """
    return external_call["sched_yield", Int32]()
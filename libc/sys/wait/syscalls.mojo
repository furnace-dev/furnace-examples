# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from sys import external_call
from memory import UnsafePointer


fn waitpid(pid: Int32, status: UnsafePointer[Int32], options: Int32) -> Int32:
    return external_call[
        "waitpid", Int32, Int32, UnsafePointer[Int32], Int32
    ](pid, status, options)



fn wait(status: UnsafePointer[Int32]) -> Int32:
    return waitpid(-1, status, 0)


fn wait4(pid: Int32, status: UnsafePointer[Int32], options: Int32, rusage: UnsafePointer) -> Int32:
    return waitpid(pid, status, options)



fn wait4Impl(pid: Int32, status: UnsafePointer[Int32], options: Int32, rusage: UnsafePointer) -> Int32:
    return wait4(pid, status, options, rusage)
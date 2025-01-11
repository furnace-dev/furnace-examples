# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from sys import external_call


#  void *handle = handle: UnsafePointer[Int8]
# Here have some errors. 
# 后续补充
fn dlclose(handle: UnsafePointer[Int8])-> Int32:
    return external_call['dlclose', Int32, UnsafePointer[Int8]](handle) 


fn dlerror(handle: UnsafePointer[Int8])-> Int32:
    return external_call['dlerror', Int32, UnsafePointer[Int8]](handle) 


fn dlopen(handle: UnsafePointer[Int8])-> Int32:
    return external_call['dlopen', Int32, UnsafePointer[Int8]](handle) 


fn dlsym(handle: UnsafePointer[Int8]) -> Int32:
    return external_call['dlsym', Int32, UnsafePointer[Int8]](handle) 
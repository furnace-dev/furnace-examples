# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
# C type aliases
# x86_64

alias c_void = UInt8
alias c_char = UInt8
alias c_schar = Int8
alias c_uchar = UInt8
alias c_short = Int16
alias c_ushort = UInt16
alias c_int = Int32
alias c_uint = UInt32
alias c_long = Int64
alias c_ulong = UInt64
alias c_longlong = Int64
alias c_ulonglong = UInt64
alias c_float = Float32
alias c_double = Float64
alias c_size_t = UInt64
alias c_ssize_t = Int

alias intmax_t = Int64
alias uintmax_t = UInt64

alias size_t = Int 
alias ptrdiff_t = Int64
alias intptr_t = Int64
alias uintptr_t = UInt64
alias ssize_t = UInt64


alias INT_MIN: c_int = -2147483648
alias INT_MAX: c_int = 2147483647
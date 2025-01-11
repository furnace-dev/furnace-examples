from memory import UnsafePointer
from sys import external_call

alias void = UInt8
alias char = UInt8
alias schar = Int8
alias uchar = UInt8
alias short = Int16
alias ushort = UInt16
alias int = Int32
alias uint = UInt32
alias long = Int64
alias ulong = UInt64
alias float = Float32
alias double = Float64


@register_passable("trivial")
struct TimeVal:
    var tv_sec: Int
    """Seconds."""
    var tv_usec: Int
    """Microseconds."""

    fn __init__(out self, tv_sec: Int = 0, tv_usec: Int = 0):
        self.tv_sec = tv_sec
        self.tv_usec = tv_usec


@register_passable("trivial")
struct Tm:
    var tm_sec: Int32
    """Seconds."""
    var tm_min: Int32
    """Minutes."""
    var tm_hour: Int32
    """Hour."""
    var tm_mday: Int32
    """Day of the month."""
    var tm_mon: Int32
    """Month."""
    var tm_year: Int32
    """Year minus 1900."""
    var tm_wday: Int32
    """Day of the week."""
    var tm_yday: Int32
    """Day of the year."""
    var tm_isdst: Int32
    """Daylight savings flag."""
    var tm_gmtoff: Int64
    """Localtime zone offset seconds."""

    fn __init__(out self):
        self.tm_sec = 0
        self.tm_min = 0
        self.tm_hour = 0
        self.tm_mday = 0
        self.tm_mon = 0
        self.tm_year = 0
        self.tm_wday = 0
        self.tm_yday = 0
        self.tm_isdst = 0
        self.tm_gmtoff = 0


fn gettimeofday() -> TimeVal:
    var tv = TimeVal()
    _ = external_call["gettimeofday", NoneType](UnsafePointer.address_of(tv), 0)
    return tv


fn time() -> Int:
    var time = 0
    return external_call["time", Int](UnsafePointer.address_of(time))


fn localtime(owned tv_sec: Int) -> Tm:
    var buf = Tm()
    _ = external_call["localtime_r", UnsafePointer[Tm]](
        UnsafePointer.address_of(tv_sec), UnsafePointer.address_of(buf)
    )
    return buf


fn strptime(time_str: String, time_format: String) -> Tm:
    var tm = Tm()
    _ = external_call["strptime", NoneType](
        time_str.unsafe_ptr(),
        time_format.unsafe_ptr(),
        UnsafePointer.address_of(tm),
    )
    return tm


fn strftime(format: String, owned time: Tm) -> String:
    var buf = String(List[UInt8](capacity=26))
    _ = external_call["strftime", UInt](
        buf.unsafe_ptr(),
        len(format),
        format.unsafe_ptr(),
        UnsafePointer.address_of(time),
    )
    return buf


fn gmtime(owned tv_sec: Int) -> Tm:
    """Converts a time value to a broken-down UTC time."""
    var tm = external_call["gmtime", UnsafePointer[Tm]](
        UnsafePointer.address_of(tv_sec)
    ).take_pointee()
    return tm

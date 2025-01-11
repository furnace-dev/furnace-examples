from collections import Optional
import .c

alias UTC_TZ = TimeZone(0, String("UTC"))


fn local() -> TimeZone:
    var local_t = c.localtime(0)
    return TimeZone(int(local_t.tm_gmtoff), String("local"))


fn from_utc(utc_str: String) raises -> TimeZone:
    if len(utc_str) == 0:
        raise Error("utc_str is empty")
    if utc_str == "utc" or utc_str == "UTC" or utc_str == "Z":
        return TimeZone(0, String("utc"))
    var p = 3 if len(utc_str) > 3 and utc_str[0:3] == "UTC" else 0

    var sign = -1 if utc_str[p] == "-" else 1
    if utc_str[p] == "+" or utc_str[p] == "-":
        p += 1

    if len(utc_str) < p + 2 or not isdigit(ord(utc_str[p])) or not isdigit(ord(utc_str[p + 1])):
        raise Error("utc_str format is invalid")
    var hours: Int = atol(utc_str[p : p + 2])
    p += 2

    var minutes: Int
    if len(utc_str) <= p:
        minutes = 0
    elif len(utc_str) == p + 3 and utc_str[p] == ":":
        minutes = atol(utc_str[p + 1 : p + 3])
    elif len(utc_str) == p + 2 and isdigit(ord(utc_str[p])):
        minutes = atol(utc_str[p : p + 2])
    else:
        minutes = 0
        raise Error("utc_str format is invalid")
    var offset: Int = sign * (hours * 3600 + minutes * 60)
    return TimeZone(offset)


@value
struct TimeZone(Stringable):
    var offset: Int
    var name: Optional[String]

    fn __init__(out self, offset: Int = 0, name: String = "utc"):
        self.offset = offset
        self.name = name

    fn __str__(self) -> String:
        if self.name:
            return self.name.value()
        return ""

    fn __bool__(self) -> Bool:
        return self.name.__bool__()

    fn format(self, sep: String = ":") -> String:
        var sign: String
        var offset_abs: Int
        if self.offset < 0:
            sign = "-"
            offset_abs = -self.offset
        else:
            sign = "+"
            offset_abs = self.offset
        var hh = offset_abs // 3600
        var mm = offset_abs % 3600
        return sign + str(hh).rjust(2, "0") + sep + str(mm).rjust(2, "0")

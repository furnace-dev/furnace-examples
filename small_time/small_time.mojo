from collections import InlineList, InlineArray, Optional
import .c
import .time_zone
from .time_delta import TimeDelta
from .formatter import formatter


alias _DI400Y = 146097
"""Number of days in 400 years."""
alias _DI100Y = 36524
"""Number of days in 100 years."""
alias _DI4Y = 1461
"""Number of days in 4 years."""
alias _DAYS_IN_MONTH = InlineArray[Int, 13](-1, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
alias _DAYS_BEFORE_MONTH = InlineArray[Int, 13](
    -1, 0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334
)  # -1 is a placeholder for indexing purposes


fn _is_leap(year: Int) -> Bool:
    "year -> 1 if leap year, else 0."
    return year % 4 == 0 and (year % 100 != 0 or year % 400 == 0)


fn _days_before_year(year: Int) -> Int:
    "year -> number of days before January 1st of year."
    var y = year - 1
    return y * 365 + y // 4 - y // 100 + y // 400


fn _days_in_month(year: Int, month: Int) -> Int:
    "year, month -> number of days in that month in that year."
    if month == 2 and _is_leap(year):
        return 29
    return _DAYS_IN_MONTH[month]


fn _days_before_month(year: Int, month: Int) -> Int:
    "year, month -> number of days in year preceding first day of month."
    if month > 2 and _is_leap(year):
        return _DAYS_BEFORE_MONTH[month] + 1
    return _DAYS_BEFORE_MONTH[month]


fn _ymd2ord(year: Int, month: Int, day: Int) -> Int:
    """year, month, day -> ordinal, considering 01-Jan-0001 as day 1."""
    return _days_before_year(year) + _days_before_month(year, month) + day


alias _MAX_TIMESTAMP: Int = 32503737600
alias MAX_TIMESTAMP = _MAX_TIMESTAMP
alias MAX_TIMESTAMP_MS = MAX_TIMESTAMP * 1000
alias MAX_TIMESTAMP_US = MAX_TIMESTAMP * 1_000_000


fn normalize_timestamp(owned timestamp: Float64) raises -> Float64:
    """Normalize millisecond and microsecond timestamps into normal timestamps."""
    if timestamp > MAX_TIMESTAMP:
        if timestamp < MAX_TIMESTAMP_MS:
            timestamp /= 1000
        elif timestamp < MAX_TIMESTAMP_US:
            timestamp /= 1_000_000
        else:
            raise Error("The specified timestamp " + str(timestamp) + "is too large.")
    return timestamp


fn now(*, utc: Bool = False) raises -> SmallTime:
    return from_timestamp(c.gettimeofday(), utc)


fn _validate_timestamp(tm: c.Tm, time_val: c.TimeVal, time_zone: TimeZone) raises -> SmallTime:
    var year = int(tm.tm_year) + 1900
    if not -1 < year < 10000:
        raise Error("The year parsed out from the timestamp is too large or negative. Received: " + str(year))

    var month = int(tm.tm_mon) + 1
    if not -1 < month < 13:
        raise Error("The month parsed out from the timestamp is too large or negative. Received: " + str(month))

    var day = int(tm.tm_mday)
    if not -1 < day < 32:
        raise Error(
            "The day of the month parsed out from the timestamp is too large or negative. Received: " + str(day)
        )

    var hours = int(tm.tm_hour)
    if not -1 < hours < 25:
        raise Error("The hour parsed out from the timestamp is too large or negative. Received: " + str(hours))

    var minutes = int(tm.tm_min)
    if not -1 < minutes < 61:
        raise Error("The minutes parsed out from the timestamp is too large or negative. Received: " + str(minutes))

    var seconds = int(tm.tm_sec)
    if not -1 < seconds < 61:
        raise Error(
            "The day of the month parsed out from the timestamp is too large or negative. Received: " + str(seconds)
        )

    var microseconds = time_val.tv_usec
    if microseconds < 0:
        raise Error("Received negative microseconds. Received: " + str(microseconds))

    return SmallTime(
        year,
        month,
        day,
        hours,
        minutes,
        seconds,
        microseconds,
        time_zone,
    )


fn from_timestamp(t: c.TimeVal, utc: Bool) raises -> SmallTime:
    if utc:
        return _validate_timestamp(c.gmtime(t.tv_sec), t, TimeZone(0, String("UTC")))

    var tm = c.localtime(t.tv_sec)
    var tz = TimeZone(int(tm.tm_gmtoff), String("local"))
    return _validate_timestamp(tm, t, tz)


fn from_timestamp(timestamp: Float64, *, utc: Bool = False) raises -> SmallTime:
    var timestamp_ = normalize_timestamp(timestamp)
    return from_timestamp(c.TimeVal(int(timestamp_)), utc)


fn strptime(date_str: String, fmt: String, tzinfo: TimeZone = TimeZone()) raises -> SmallTime:
    """
    Create a SmallTime instance from a date string and format,
    in the style of `datetime.strptime`.  Optionally replaces the parsed time_zone.

    Usage::

    >>> strptime('20-01-2019 15:49:10', '%d-%m-%Y %H:%M:%S')
        <SmallTime [2019-01-20T15:49:10+00:00]>
    """
    var tm = c.strptime(date_str, fmt)
    var tz = TimeZone(int(tm.tm_gmtoff)) if not tzinfo else tzinfo
    return _validate_timestamp(tm, c.TimeVal(), tz)


fn strptime(date_str: String, fmt: String, tz_str: Optional[String] = None) raises -> SmallTime:
    """
    Create a SmallTime instance by time_zone_string with utc format.

    Usage::

    >>> strptime('20-01-2019 15:49:10', '%d-%m-%Y %H:%M:%S', '+08:00')
        <SmallTime [2019-01-20T15:49:10+08:00]>
    """
    if not tz_str:
        return strptime(date_str, fmt, TimeZone())
    return strptime(date_str, fmt, time_zone.from_utc(tz_str.value()))


fn from_ordinal(ordinal: Int) -> SmallTime:
    """Construct a SmallTime from a proleptic Gregorian ordinal.

    January 1 of year 1 is day 1.  Only the year, month and day are
    non-zero in the result.
    """
    # n is a 1-based index, starting at 1-Jan-1.  The pattern of leap years
    # repeats exactly every 400 years.  The basic strategy is to find the
    # closest 400-year boundary at or before n, then work with the offset
    # from that boundary to n.  Life is much clearer if we subtract 1 from
    # n first -- then the values of n at 400-year boundaries are exactly
    # those divisible by _DI400Y:
    #
    #     D  M   Y            n              n-1
    #     -- --- ----        ----------     ----------------
    #     31 Dec -400        -_DI400Y       -_DI400Y -1
    #      1 Jan -399         -_DI400Y +1   -_DI400Y      400-year boundary
    #     ...
    #     30 Dec  000        -1             -2
    #     31 Dec  000         0             -1
    #      1 Jan  001         1              0            400-year boundary
    #      2 Jan  001         2              1
    #      3 Jan  001         3              2
    #     ...
    #     31 Dec  400         _DI400Y        _DI400Y -1
    #      1 Jan  401         _DI400Y +1     _DI400Y      400-year boundary
    var n = ordinal
    n -= 1
    var n400 = n // _DI400Y
    n = n % _DI400Y
    var year = n400 * 400 + 1  # ..., -399, 1, 401, ...

    # Now n is the (non-negative) offset, in days, from January 1 of year, to
    # the desired date.  Now compute how many 100-year cycles precede n.
    # Note that it's possible for n100 to equal 4!  In that case 4 full
    # 100-year cycles precede the desired day, which implies the desired
    # day is December 31 at the end of a 400-year cycle.
    var n100 = n // _DI100Y
    n = n % _DI100Y

    # Now compute how many 4-year cycles precede it.
    var n4 = n // _DI4Y
    n = n % _DI4Y

    # And now how many single years.  Again n1 can be 4, and again meaning
    # that the desired day is December 31 at the end of the 4-year cycle.
    var n1 = n // 365
    n = n % 365

    year += n100 * 100 + n4 * 4 + n1
    if n1 == 4 or n100 == 4:
        return SmallTime(year - 1, 12, 31)

    # Now the year is correct, and n is the offset from January 1.  We find
    # the month via an estimate that's either exact or one too large.
    var leapyear = n1 == 3 and (n4 != 24 or n100 == 3)
    var month = (n + 50) >> 5
    var preceding: Int
    if month > 2 and leapyear:
        preceding = _DAYS_BEFORE_MONTH[month] + 1
    else:
        preceding = _DAYS_BEFORE_MONTH[month]
    if preceding > n:  # estimate is too large
        month -= 1
        if month == 2 and leapyear:
            preceding -= _DAYS_BEFORE_MONTH[month] + 1
        else:
            preceding -= _DAYS_BEFORE_MONTH[month]
    n -= preceding

    # Now the year and month are correct, and n is the offset from the
    # start of that month:  we're done!
    return SmallTime(year, month, n + 1)


@value
struct SmallTime(Stringable):
    var year: Int
    var month: Int
    var day: Int
    var hour: Int
    var minute: Int
    var second: Int
    var microsecond: Int
    var tz: TimeZone

    fn __init__(
        out self,
        year: Int,
        month: Int,
        day: Int,
        hour: Int = 0,
        minute: Int = 0,
        second: Int = 0,
        microsecond: Int = 0,
        tz: TimeZone = TimeZone(),
    ):
        self.year = year
        self.month = month
        self.day = day
        self.hour = hour
        self.minute = minute
        self.second = second
        self.microsecond = microsecond
        self.tz = tz

    fn format(self, fmt: String = "YYYY-MM-DD HH:mm:ss ZZ") -> String:
        """Returns a string representation of the `SmallTime`
        formatted according to the provided format string.

        :param fmt: the format string.

        Usage::
            >>> var m = now()
            >>> m.format('YYYY-MM-DD HH:mm:ss ZZ')
            '2013-05-09 03:56:47 -00:00'

            >>> m.format('MMMM DD, YYYY')
            'May 09, 2013'

            >>> m.format()
            '2013-05-09 03:56:47 -00:00'

        """
        return formatter.format(self, fmt)

    fn isoformat[timespec: String = "auto"](self, sep: String = "T") -> String:
        """Return the time formatted according to ISO.

        The full format looks like 'YYYY-MM-DD HH:MM:SS.mmmmmm'.

        If self.tzinfo is not None, the UTC offset is also attached, giving
        giving a full format of 'YYYY-MM-DD HH:MM:SS.mmmmmm+HH:MM'.

        Optional argument sep specifies the separator between date and
        time, default 'T'.

        The optional argument timespec specifies the number of additional
        terms of the time to include. Valid options are 'auto', 'hours',
        'minutes', 'seconds', 'milliseconds' and 'microseconds'.
        """
        alias valid = InlineList[String, 6]("auto", "hours", "minutes", "seconds", "milliseconds", "microseconds")
        constrained[
            timespec in valid,
            msg="timespec must be one of the following: 'auto', 'hours', 'minutes', 'seconds', 'milliseconds', 'microseconds'",
        ]()
        var date_str = (
            str(self.year).rjust(4, "0") + "-" + str(self.month).rjust(2, "0") + "-" + str(self.day).rjust(2, "0")
        )
        var time_str = String("")

        @parameter
        if timespec == "auto" or timespec == "microseconds":
            time_str = (
                str(self.hour).rjust(2, "0")
                + ":"
                + str(self.minute).rjust(2, "0")
                + ":"
                + str(self.second).rjust(2, "0")
                + "."
                + str(self.microsecond).rjust(6, "0")
            )
        elif timespec == "milliseconds":
            time_str = (
                str(self.hour).rjust(2, "0")
                + ":"
                + str(self.minute).rjust(2, "0")
                + ":"
                + str(self.second).rjust(2, "0")
                + "."
                + str(self.microsecond // 1000).rjust(3, "0")
            )
        elif timespec == "seconds":
            time_str = (
                str(self.hour).rjust(2, "0")
                + ":"
                + str(self.minute).rjust(2, "0")
                + ":"
                + str(self.second).rjust(2, "0")
            )
        elif timespec == "minutes":
            time_str = str(self.hour).rjust(2, "0") + ":" + str(self.minute).rjust(2, "0")
        elif timespec == "hours":
            time_str = str(self.hour).rjust(2, "0")

        if not self.tz:
            return sep.join(date_str, time_str)
        else:
            return sep.join(date_str, time_str) + self.tz.format()

    fn to_ordinal(self) -> Int:
        """Return proleptic Gregorian ordinal for the year, month and day.

        January 1 of year 1 is day 1.  Only the year, month and day values
        contribute to the result.
        """
        return _ymd2ord(self.year, self.month, self.day)

    fn iso_weekday(self) -> Int:
        # "Return day of the week, where Monday == 1 ... Sunday == 7."
        # 1-Jan-0001 is a Monday
        return self.to_ordinal() % 7 or 7

    fn __str__(self) -> String:
        return self.isoformat()

    fn __sub__(self, other: Self) -> TimeDelta:
        var days1 = self.to_ordinal()
        var days2 = other.to_ordinal()
        var secs1 = self.second + self.minute * 60 + self.hour * 3600
        var secs2 = other.second + other.minute * 60 + other.hour * 3600
        var base = TimeDelta(days1 - days2, secs1 - secs2, self.microsecond - other.microsecond)
        return base

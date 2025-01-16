alias DEFAULT_PRECISION = 10


@value
struct Precise:
    var integer: Int
    var decimals: Int
    var base: Int

    fn __init__(out self, number_string: String) raises:
        var modifier = 0
        var number = number_string.lower()
        if "e" in number:
            var split = number.split("e")
            number = split[0]
            modifier = int(split[1])
        var decimal_index = number.find(".")
        if decimal_index > -1:
            self.decimals = len(number) - decimal_index - 1
            self.integer = int(number.replace(".", ""))
        else:
            self.decimals = 0
            self.integer = int(number)
        self.decimals = self.decimals - modifier
        self.base = 10

    fn __init__(out self, number: Int, decimals: Int = 0):
        self.integer = number
        self.decimals = decimals
        self.base = 10

    fn __add__(self, other: Self) -> Self:
        return self.add(other)

    fn __sub__(self, other: Self) -> Self:
        return self.sub(other)

    fn __mul__(self, other: Self) -> Self:
        return self.mul(other)

    fn __truediv__(self, other: Self) -> Self:
        return self.div(other)

    fn __mod__(self, other: Self) -> Self:
        return self.mod(other)

    fn __neg__(self) -> Self:
        return self.neg()

    fn __abs__(self) -> Self:
        return self.abs()

    fn __min__(self, other: Self) -> Self:
        return self.min(other)

    fn __max__(self, other: Self) -> Self:
        return self.max(other)

    fn __lt__(self, other: Self) -> Bool:
        return self.lt(other)

    fn __le__(self, other: Self) -> Bool:
        return self.le(other)

    fn __gt__(self, other: Self) -> Bool:
        return self.gt(other)

    @always_inline
    fn __ge__(self, other: Self) -> Bool:
        return self.ge(other)

    @always_inline
    fn __eq__(self, other: Self) raises -> Bool:
        return self.equals(other)

    @always_inline
    fn __ne__(self, other: Self) raises -> Bool:
        return not self.equals(other)

    @always_inline
    fn mul(self, other: Self) -> Self:
        var integer_result = self.integer * other.integer
        return Self(integer_result, self.decimals + other.decimals)

    @always_inline
    fn div(self, other: Self, precision: Int = DEFAULT_PRECISION) -> Self:
        var distance = precision - self.decimals + other.decimals
        var numerator: Int
        var exponent: Int
        if distance == 0:
            numerator = self.integer
        elif distance < 0:
            exponent = self.base**-distance
            numerator = self.integer // exponent
        else:
            exponent = self.base**distance
            numerator = self.integer * exponent
        var t0 = divmod(numerator, other.integer)
        # var result, mod = divmod(numerator, other.integer)
        var result = t0[0]
        var mod = t0[1]
        # python floors negative numbers down instead of truncating
        # if mod is zero it will be floored to itself so we do not add one
        result = result + 1 if result < 0 and mod else result
        return Precise(result, precision)

    @always_inline
    fn add(self, other: Self) -> Self:
        if self.decimals == other.decimals:
            var integer_result = self.integer + other.integer
            return Precise(integer_result, self.decimals)
        else:
            var smaller: Self
            var bigger: Self
            if self.decimals > other.decimals:
                smaller = other
                bigger = self
            else:
                smaller = self
                bigger = other
            var exponent = bigger.decimals - smaller.decimals
            var normalised = smaller.integer * (self.base**exponent)
            var result = normalised + bigger.integer
            return Precise(result, bigger.decimals)

    @always_inline
    fn sub(self, other: Self) -> Self:
        var negative = Precise(-other.integer, other.decimals)
        return self.add(negative)

    @always_inline
    fn abs(self) -> Self:
        return Precise(abs(self.integer), self.decimals)

    @always_inline
    fn neg(self) -> Self:
        return Precise(-self.integer, self.decimals)

    @always_inline
    fn mod(self, other: Self) -> Self:
        var rationizerNumberator = max(-self.decimals + other.decimals, 0)
        var numerator = self.integer * (self.base**rationizerNumberator)
        var rationizerDenominator = max(-other.decimals + self.decimals, 0)
        var denominator = other.integer * (self.base**rationizerDenominator)
        var result = numerator % denominator
        return Precise(result, rationizerDenominator + other.decimals)

    @always_inline
    fn orn(self, other: Self) -> Self:
        integer_result = self.integer | other.integer
        return Precise(integer_result, self.decimals)

    @always_inline
    fn min(self, other: Self) -> Self:
        return self if self.lt(other) else other

    @always_inline
    fn max(self, other: Self) -> Self:
        return self if self.gt(other) else other

    @always_inline
    fn gt(self, other: Self) -> Bool:
        add = self.sub(other)
        return add.integer > 0

    @always_inline
    fn ge(self, other: Self) -> Bool:
        add = self.sub(other)
        return add.integer >= 0

    @always_inline
    fn lt(self, other: Self) -> Bool:
        return other.gt(self)

    @always_inline
    fn le(self, other: Self) -> Bool:
        return other.ge(self)

    @always_inline
    fn reduce(self) raises -> Self:
        var string = str(self.integer)
        var start = len(string) - 1
        var result = self
        if start == 0:
            if string == "0":
                result.decimals = 0
            return result
        var i_ = 0
        for i in range(start, -1, -1):
            i_ = i
            if string[i] != "0":
                break
        var difference = start - i_
        if difference == 0:
            return result
        result.decimals -= difference
        var integer_string = string[0 : i_ + 1]
        result.integer = int(integer_string)
        return result

    @always_inline
    fn equals(self, other: Self) raises -> Bool:
        self_reduced = self.reduce()
        other_reduced = other.reduce()
        return (
            self_reduced.decimals == other_reduced.decimals
            and self_reduced.integer == other_reduced.integer
        )

    fn __str__(self) raises -> String:
        var self_reduced = self.reduce()
        var result = String("")

        # Handle sign
        if self_reduced.integer < 0:
            result += "-"

        # Convert integer to string and pad with zeros
        var integer_str = str(abs(self_reduced.integer))
        while len(integer_str) < self_reduced.decimals:
            integer_str = "0" + integer_str

        var index = len(integer_str) - self_reduced.decimals

        if index == 0:
            result += "0."
            result += integer_str
        elif self_reduced.decimals < 0:
            result += integer_str
            for i in range(-self_reduced.decimals):
                result += "0"
        elif self_reduced.decimals == 0:
            result += integer_str
        else:
            result += integer_str[0:index]
            result += "."
            result += integer_str[index:]

        return result

    fn __repr__(self) raises -> String:
        return "Precise(" + str(self) + ")"

    fn __float__(self) raises -> Float64:
        return float(str(self))

    @staticmethod
    fn string_mul(string1: String, string2: String) raises -> Self:
        return Precise(string1).mul(Precise(string2))

    @staticmethod
    fn string_div(
        string1: String, string2: String, precision: Int = DEFAULT_PRECISION
    ) raises -> Self:
        var string2_precise = Precise(string2)
        return Precise(string1).div(string2_precise, precision)

    @staticmethod
    fn string_add(string1: String, string2: String) raises -> Self:
        return Precise(string1).add(Precise(string2))

    @staticmethod
    fn string_sub(string1: String, string2: String) raises -> Self:
        return Precise(string1).sub(Precise(string2))

    @staticmethod
    fn string_abs(string: String) raises -> Self:
        return Precise(string).abs()

    @staticmethod
    fn string_neg(string: String) raises -> Self:
        return Precise(string).neg()

    @staticmethod
    fn string_mod(string1: String, string2: String) raises -> Self:
        return Precise(string1).mod(Precise(string2))

    @staticmethod
    fn string_or(string1: String, string2: String) raises -> Self:
        return Self(str(Precise(string1).orn(Precise(string2))))

    @staticmethod
    fn string_equals(string1: String, string2: String) raises -> Bool:
        return Precise(string1).equals(Precise(string2))

    @staticmethod
    fn string_eq(string1: String, string2: String) raises -> Bool:
        return Precise(string1).equals(Precise(string2))

    @staticmethod
    fn string_min(string1: String, string2: String) raises -> Self:
        return Self(str(Precise(string1).min(Precise(string2))))

    @staticmethod
    fn string_max(string1: String, string2: String) raises -> Self:
        return Self(str(Precise(string1).max(Precise(string2))))

    @staticmethod
    fn string_gt(string1: String, string2: String) raises -> Bool:
        return Precise(string1).gt(Precise(string2))

    @staticmethod
    fn string_ge(string1: String, string2: String) raises -> Bool:
        return Precise(string1).ge(Precise(string2))

    @staticmethod
    fn string_lt(string1: String, string2: String) raises -> Bool:
        return Precise(string1).lt(Precise(string2))

    @staticmethod
    fn string_le(string1: String, string2: String) raises -> Bool:
        return Precise(string1).le(Precise(string2))

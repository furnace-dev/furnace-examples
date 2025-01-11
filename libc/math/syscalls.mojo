# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from sys import external_call
from memory import UnsafePointer

# -------------------------------------------------------
#  计算整数值的绝对值
# -------------------------------------------------------
fn abs(j: Int32) -> Int32:
    """C library <math.h> function `abs`.

    Link:
        https://man7.org/linux/man-pages/man3/abs.3.html

    Prototype:
        int abs(int j)

    Description:
        Computes the absolute value of j.

    Arguments:
        j: The number for which the absolute value is to be computed.

    Return value:
        The absolute value of j.
    """
    return external_call["abs", Int32, Int32](j)


fn labs(j: Int64) -> Int64:
    """C library <math.h> function `labs`.

    Link:
        https://man7.org/linux/man-pages/man3/abs.3.html

    Prototype:
        long labs(long j)

    Description:
        Computes the absolute value of j.

    Arguments:
        j: The number for which the absolute value is to be computed.

    Return value:
        The absolute value of j.
    """
    return external_call["labs", Int64, Int64](j)


fn llabs(j: Int64) -> Int64:
    """C library <math.h> function `labs`.

    Link:
        https://man7.org/linux/man-pages/man3/abs.3.html

    Prototype:
        long long llabs(long long j)

    Description:
        Computes the absolute value of j.

    Arguments:
        j: The number for which the absolute value is to be computed.

    Return value:
        The absolute value of j.
    """
    return external_call["llabs", Int64, Int64](j)


fn imaxabs(j: Int64) -> Int64:
    """C library <math.h> function `labs`.

    Link:
        https://man7.org/linux/man-pages/man3/abs.3.html

    Prototype:
        intmax_t llabs(intmax_t j)

    Description:
        Computes the absolute value of j.

    Arguments:
        j: The number for which the absolute value is to be computed.

    Return value:
        The absolute value of j.
    """
    return external_call["imaxabs", Int64, Int64](j)


# -------------------------------------------------------
#  计算浮点值的绝对值
# -------------------------------------------------------
fn fabs(x: Float64) -> Float64:
    """C library <math.h> function `fabs`.

    Link:
        https://man7.org/linux/man-pages/man3/fabs.3.html

    Prototype:
        double fabs(double x)

    Description:
        Computes the absolute value of floating-point number.

    Arguments:
        x: The number for which the absolute value is to be computed.

    Return value:
        Return the absolute value of x. if x is a NaN, A NasN is returned.  If x is -0, +0 is returned.If x is negative infinity or positive infinity, positive infinity is returned.

    """
    return external_call["fabs", Float64, Float64](x)


fn fabsf(x: Float32) -> Float32:
    """C library <math.h> function `fabsf`.

    Link:
        https://man7.org/linux/man-pages/man3/fabs.3.html

    Prototype:
        float fabs(float x)

    Description:
        Computes the absolute value of floating-point number.

    Arguments:
        x: The number for which the absolute value is to be computed.

    Return value:
        Return the absolute value of x. if x is a NaN, A NasN is returned.  If x is -0, +0 is returned.If x is negative infinity or positive infinity, positive infinity is returned.

    """
    return external_call["fabsf", Float32, Float32](x)


fn fabsl(x: Float64) -> Float64:
    """C library <math.h> function `fabsl`.

    Link:
        https://man7.org/linux/man-pages/man3/fabs.3.html

    Prototype:
        float fabs(float x)

    Description:
        Computes the absolute value of floating-point number.

    Arguments:
        x: The number for which the absolute value is to be computed.

    Return value:
        Return the absolute value of x. if x is a NaN, A NasN is returned.  If x is -0, +0 is returned.If x is negative infinity or positive infinity, positive infinity is returned.

    """
    return external_call["fabsl", Float64, Float64](x)


# ------------------------------------------------------------------------------------
# 计算整数除法的商和余数
# ------------------------------------------------------------------------------------
@register_passable('trivial')
struct div_t:
  var quot: Int32
  var rem: Int32


@register_passable('trivial')
struct ldiv_t:
  var quot: Int64
  var rem: Int64


@register_passable('trivial')
struct lldiv_t:
  var quot: Int64
  var rem: Int64


@register_passable('trivial')
struct imaxdiv_t:
  var quot: Int64
  var rem: Int64


fn ldiv(numer: Int64, denom: Int64) -> ldiv_t:
    """C library <math.h> function `ldiv`.

    Link:
        https://man7.org/linux/man-pages/man3/ldiv.3.html

    Prototype:
        ldiv_t div(long x, long y)

    Description:
        Computes the quotient and remainder of  the division of the numerator numer by the denominator denom. 

    Arguments:
        numer: the numerator
        denom: the denominator

    Return value:
        The quotient and remainder of  the division of the numerator numer by the denominator denom.
    """
    return external_call["ldiv", ldiv_t, Int64, Int64](numer, denom)


fn lldiv(numer: Int64, denom: Int64) -> lldiv_t:
    """C library <math.h> function `lldiv`.

    Link:
        https://man7.org/linux/man-pages/man3/ldiv.3.html

    Prototype:
        ldiv_t div(long x, long y)

    Description:
        Computes the quotient and remainder of  the division of the numerator numer by the denominator denom. 

    Arguments:
        numer: the numerator
        denom: the denominator

    Return value:
        The quotient and remainder of  the division of the numerator numer by the denominator denom.
    """
    return external_call["lldiv", lldiv_t, Int64, Int64](numer, denom)


fn imaxdiv(numer: Int64, denom: Int64) -> imaxdiv_t:
    """C library <math.h> function `imaxdiv`.

    Link:
        https://man7.org/linux/man-pages/man3/ldiv.3.html

    Prototype:
        ldiv_t div(long x, long y)

    Description:
        Computes the quotient and remainder of  the division of the numerator numer by the denominator denom. 

    Arguments:
        numer: the numerator
        denom: the denominator

    Return value:
        The quotient and remainder of  the division of the numerator numer by the denominator denom.
    """
    return external_call["imaxdiv", imaxdiv_t, Int64, Int64](numer, denom)


#------------------------------------------
# 浮点除法运算的余数
#------------------------------------------
fn fmodf(x: Float32, y: Float32) -> Float32:
    """C library <math.h> function `fmodf`.

    Link:
        https://man7.org/linux/man-pages/man3/fmod.3.html

    Prototype:
        float fmodf(float x, float y)

    Description:
        The functionality described on this reference page is aligned with the ISO C standard. Any conflict between the requirements described here and the ISO C standard is unintentional. This volume of POSIX.1‐2017 defers to the ISO C standard.

    Arguments:
        x
        y

    Return value:
        These functions shall return the value x-i*y, for some integer i
        such that, if y is non-zero, the result has the same sign as x
        and magnitude less than the magnitude of y.
    """
    return external_call["fmodf", Float32, Float32, Float32](x, y)


fn fmod(x: Float64, y: Float64) -> Float64:
    """C library <math.h> function `fmod`.

    Link:
        https://man7.org/linux/man-pages/man3/fmod.3.html

    Prototype:
        float fmod(double x, double y)

    Description:
        The functionality described on this reference page is aligned with the ISO C standard. Any conflict between the requirements described here and the ISO C standard is unintentional. This volume of POSIX.1‐2017 defers to the ISO C standard.

    Arguments:
        x
        y

    Return value:
        These functions shall return the value x-i*y, for some integer i
        such that, if y is non-zero, the result has the same sign as x
        and magnitude less than the magnitude of y.
    """
    return external_call["fmod", Float64, Float64, Float64](x, y)


fn fmodl(x: Float64, y: Float64) -> Float64:
    """C library <math.h> function `fmodl`.

    Link:
        https://man7.org/linux/man-pages/man3/fmodl.3.html

    Prototype:
        long double fmod(long double x, long double y)

    Description:
        The functionality described on this reference page is aligned with the ISO C standard. Any conflict between the requirements described here and the ISO C standard is unintentional. This volume of POSIX.1‐2017 defers to the ISO C standard.

    Arguments:
        x
        y

    Return value:
        These functions shall return the value x-i*y, for some integer i
        such that, if y is non-zero, the result has the same sign as x
        and magnitude less than the magnitude of y.
    """
    return external_call["fmodl", Float64, Float64, Float64](x, y)


# -------------------------------------------------------------------
# 除法运算的有符号余数
# -------------------------------------------------------------------
# 后续补充docstrings。
fn remainderf(x: Float32, y: Float32) -> Float32:
    return external_call["remainderf", Float32, Float32, Float32](x,y)


fn remainder(x: Float64, y: Float64) -> Float64:
    return external_call["remainder", Float64, Float64, Float64](x,y)


fn remainderl(x: Float64, y: Float64) -> Float64:
    return external_call["remainderl", Float64, Float64, Float64](x,y)


# -------------------------------------------------------------------
# 有符号余数以及除法运算的最后三位
# -------------------------------------------------------------------
fn remquof(x: Float32, y: Float32, quo: Int32) -> Float32:
    # 有问题后续补充
    return external_call["remquof", Float32, Float32, Float32, Int32](x,y, quo)


fn remquo(x: Float64, y: Float64, quo: Int32) -> Float64:
    return external_call["remquo", Float64, Float64, Float64, Int32](x,y, quo)


fn remquol(x: Float64, y: Float64, quo: Int32) -> Float64:
    return external_call["remquol", Float64, Float64, Float64, Int32](x,y, quo)


# -------------------------------------------------------------------------
# 融合乘加运算
# -------------------------------------------------------------------------
fn fmaf(x: Float32, y: Float32, z: Float32) -> Float32:
    return external_call["fmaf", Float32, Float32, Float32, Float32](x, y, z)


fn fma(x: Float64, y: Float64, z: Float64) -> Float64:
    return external_call["fma", Float64, Float64, Float64, Float64](x, y, z)


fn fmal(x: Float64, y: Float64, z: Float64) -> Float64:
    return external_call["fmal", Float64, Float64, Float64, Float64](x, y, z)


# ---------------------------------------------------------------------------
# 两个浮点值中较大的一个
# ---------------------------------------------------------------------------
fn fmaxf(x: Float32, y: Float32) -> Float32:
    return external_call["fmaxf", Float32, Float32, Float32](x, y)


fn fmax(x: Float64, y: Float64) -> Float64:
    return external_call["fmax", Float64, Float64, Float64](x, y)


fn fmaxl(x: Float64, y: Float64) -> Float64:
    return external_call["fmal", Float64, Float64, Float64](x, y)


# -----------------------------------------------------------------------------
# 两个浮点值中较小的一个
# -----------------------------------------------------------------------------
fn fminf(x: Float32, y: Float32) -> Float32:
    return external_call["fminf", Float32, Float32, Float32](x, y)


fn fmin(x: Float64, y: Float64) -> Float64:
    return external_call["fmin", Float64, Float64, Float64](x, y)


fn fminl(x: Float64, y: Float64) -> Float64:
    return external_call["fminl", Float64, Float64, Float64](x, y)


# ----------------------------------------------------------------------
# 两个浮点值的正差
# ----------------------------------------------------------------------
fn fdimf(x: Float32, y: Float32) -> Float32:
    return external_call["fdimf", Float32, Float32, Float32](x, y)


fn fdimf(x: Float64, y: Float64) -> Float64:
    return external_call["fdim", Float64, Float64, Float64](x, y)


fn fdiml(x: Float64, y: Float64) -> Float64:
    return external_call["fdiml", Float64, Float64, Float64](x, y)


# --------------------------------------------------------------------
# 返回NaN （非数字）
# --------------------------------------------------------------------

fn nanf(arg: UInt8) -> Float32:
    return external_call["nanf", Float32, UInt8](arg)

fn nan(arg: UInt8) -> Float64:
    return external_call["nan", Float64, UInt8](arg)


fn nanl(arg: UInt8) -> Float64:
    return external_call["nanl", Float64, UInt8](arg)

# -------------------------------------------------
#  指数函数
# -----------------------------------------------------
fn exp(x: Float64) -> Float64:
    """C library <math.h> function `exp`.

    Link:
        https://man7.org/linux/man-pages/man3/exp.3.html

    Prototype:
        double exp(double x)

    Description:
        Computes the exponential function of x: (eˣ). Range errors may occur with large values of x.

    Arguments:
        x: The number for which to calculate the exponential function.

    Return value:
        The exponential value of x.
    """
    return external_call["exp", Float64, Float64](x)


fn expf(x: Float32) -> Float32:
    """C library <math.h> function `expf`.

    Link:
        https://man7.org/linux/man-pages/man3/exp.3.html

    Prototype:
        float expf(float x)

    Description:
        Computes the exponential function of x: (eˣ). Range errors may occur with large values of x.

    Arguments:
        x: The number for which to calculate the exponential function.

    Return value:
        The exponential value of x.
    """
    return external_call["expf", Float32, Float32](x)


fn expm1(x: Float64) -> Float64:
    """C library <math.h> function `expm1`.

    Link:
        https://man7.org/linux/man-pages/man3/expm1.3.html

    Prototype:
        double expm1(double x)

    Description:
        Computes the exponential function of x and subtracts 1: (eˣ - 1). Range errors may occur with large values of x. The value expm1(x) may be more accurate than exp(x) - 1.0 for small values of x.

    Arguments:
        x: The number for which to calculate the exponential function and subtract 1.

    Return value:
        The exponential value of x with 1 subtracted.
    """
    return external_call["expm1", Float64, Float64](x)


fn expm1f(x: Float32) -> Float32:
    """C library <math.h> function `expm1f`.

    Link:
        https://man7.org/linux/man-pages/man3/expm1.3.html

    Prototype:
        float expm1f(float x)

    Description:
        Computes the exponential function of x and subtracts 1: (eˣ - 1). Range errors may occur with large values of x. The value expm1(x) may be more accurate than exp(x) - 1.0 for small values of x.

    Arguments:
        x: The number for which to calculate the exponential function and subtract 1.

    Return value:
        The exponential value of x with 1 subtracted.
    """
    return external_call["expm1f", Float32, Float32](x)


fn log2(x: Float64) -> Float64:
    """C library <math.h> function `log2`.

    Link:
        https://man7.org/linux/man-pages/man3/log2.3.html

    Prototype:
        double log2(double x)

    Description:
        Computes the binary logarithm of x: log₂ x. Domain errors occur for negative x. Range errors occur for x equal to zero.

    Arguments:
        x: The number for which to compute the binary logarithm.

    Return value:
        The binary logarithm of x. For finite values of x less than zero, this function returns nan. Range errors occur for x equal to zero.
    """
    return external_call["log2", Float64, Float64](x)


fn log2f(x: Float32) -> Float32:
    """C library <math.h> function `log2f`.

    Link:
        https://man7.org/linux/man-pages/man3/log2.3.html

    Prototype:
        float log2f(float x)

    Description:
        Computes the binary logarithm of x: log₂ x. Domain errors occur for negative x. Range errors occur for x equal to zero.

    Arguments:
        x: The number for which to compute the binary logarithm.

    Return value:
        The binary logarithm of x. For finite values of x less than zero, this function returns nan. Range errors occur for x equal to zero.
    """
    return external_call["log2f", Float32, Float32](x)


fn log(x: Float64) -> Float64:
    """C library <math.h> function `log`.

    Link:
        https://man7.org/linux/man-pages/man3/log.3.html

    Prototype:
        double log(double x)

    Description:
        Computes the natural logarithm of x: logₑ x. Domain errors occur for negative x. Range errors occur for x equal to zero.

    Arguments:
        x: The number for which to compute the natural logarithm.

    Return value:
        The natural logarithm of x. For finite values of x less than zero, this function returns nan. Range errors occur for x equal to zero.
    """
    return external_call["log", Float64, Float64](x)


fn logf(x: Float32) -> Float32:
    """C library <math.h> function `logf`.

    Link:
        https://man7.org/linux/man-pages/man3/log.3.html

    Prototype:
        float logf(float x)

    Description:
        Computes the natural logarithm of x: logₑ x. Domain errors occur for negative x. Range errors occur for x equal to zero.

    Arguments:
        x: The number for which to compute the natural logarithm.

    Return value:
        The natural logarithm of x. For finite values of x less than zero, this function returns nan. Range errors occur for x equal to zero.
    """
    return external_call["logf", Float32, Float32](x)


fn log10(x: Float64) -> Float64:
    """C library <math.h> function `log10`.

    Link:
        https://man7.org/linux/man-pages/man3/log10.3.html

    Prototype:
        double log10(double x)

    Description:
        Computes the logarithm of x to the base 10: log₁₀ x. Domain errors occur for negative x. Range errors occur for x equal to zero.

    Arguments:
        x: The number for which to compute the logarithm.

    Return value:
        The logarithm of x to the base 10. For finite values of x less than zero, this function returns nan.
    """
    return external_call["log10", Float64, Float64](x)


fn log10f(x: Float32) -> Float32:
    """C library <math.h> function `log10f`.

    Link:
        https://man7.org/linux/man-pages/man3/log10.3.html

    Prototype:
        float log10f(float x)

    Description:
        Computes the logarithm of x to the base 10: log₁₀ x. Domain errors occur for negative x. Range errors occur for x equal to zero.

    Arguments:
        x: The number for which to compute the logarithm.

    Return value:
        The logarithm of x to the base 10. For finite values of x less than zero, this function returns nan.
    """
    return external_call["log10f", Float32, Float32](x)


fn log1p(x: Float64) -> Float64:
    """C library <math.h> function `log1p`.

    Link:
        https://man7.org/linux/man-pages/man3/log1p.3.html

    Prototype:
        double log1p(double x)

    Description:
        Computes the natural logarithm of 1 + x.

    Arguments:
        x: The number for which to compute the logarithm.

    Return value:
        The natural logarithm of 1 + x. For finite values less than -1, this function returns nan.
    """
    return external_call["log1p", Float64, Float64](x)


fn log1pf(x: Float32) -> Float32:
    """C library <math.h> function `log1pf`.

    Link:
        https://man7.org/linux/man-pages/man3/log1p.3.html

    Prototype:
        float log1pf(float x)

    Description:
        Computes the value of log(1 + x), where x > -1.0.

    Arguments:
        x: The number to which one is added before computing the natural logarithm.

    Return value:
        log(1 + x). For finite values of x less than -1, this function returns nan.

    """
    return external_call["log1pf", Float32, Float32](x)


fn ilogb(x: Float64) -> Int32:
    """C library <math.h> function `ilogb`.

    Link:
        https://man7.org/linux/man-pages/man3/ilogb.3.html

    Prototype:
        int ilogb(double x)

    Description:
        Computes the integer part: logᵣ |x| as a signed integer for non-zero finite x, where r is the base of the floating-point arithmetic system.

    Arguments:
        x: The number for which to compute the integer part of the logarithm.

    Return value:
        The exponent part of x, in integer format.
    """
    return external_call["ilogb", Int32, Float64](x)


fn ilogbf(x: Float32) -> Int32:
    """C library <math.h> function `ilogbf`.

    Link:
        https://man7.org/linux/man-pages/man3/ilogb.3.html

    Prototype:
        int ilogbf(float x)

    Description:
        Computes the integer part: logᵣ |x| as a signed integer for non-zero finite x, where r is the base of the floating-point arithmetic system.

    Arguments:
        x: The number for which to compute the integer part of the logarithm.

    Return value:
        The exponent part of x, in integer format.
    """
    return external_call["ilogbf", Int32, Float32](x)


fn logb(x: Float64) -> Float64:
    """C library <math.h> function `logb`.

    Link:
        https://man7.org/linux/man-pages/man3/logb.3.html

    Prototype:
        double logb(double x)

    Description:
        Computes: logᵣ |x| and represents the result as a floating-point number for non-zero finite x, where r is the base of the floating-point arithmetic system of the device.

    Arguments:
        x: The number for which to compute the exponent, independent of the number system.

    Return value:
        The exponent value of x without bias, represented as a floating-point value.
    """
    return external_call["logb", Float64, Float64](x)


fn logbf(x: Float32) -> Float32:
    """C library <math.h> function `logbf`.

    Link:
        https://man7.org/linux/man-pages/man3/logb.3.html

    Prototype:
        float logbf(float x)

    Description:
        Computes: logᵣ |x| and represents the result as a floating-point number for non-zero finite x, where r is the base of the floating-point arithmetic system of the device.

    Arguments:
        x: The number for which to compute the exponent, independent of the number system.

    Return value:
        The exponent value of x without bias, represented as a floating-point value.
    """
    return external_call["logbf", Float32, Float32](x)


# -----------------------------------------------------
# Power functions 
# -----------------------------------------------------
fn sqrt(x: Float64) -> Float64:
    """C library <math.h> function `sqrt`.

    Link:
        https://man7.org/linux/man-pages/man3/sqrt.3.html

    Prototype:
        double sqrt(double x)

    Description:
        Computes the square root of x. Domain errors occur for negative x.

    Arguments:
        x: The number for which to compute the square root.

    Return value:
        The square root of x. For finite values of x less than zero, this function returns nan.
    """
    return external_call["sqrt", Float64, Float64](x)


fn sqrtf(x: Float32) -> Float32:
    """C library <math.h> function `sqrtf`.

    Link:
        https://man7.org/linux/man-pages/man3/sqrt.3.html

    Prototype:
        float sqrtf(float x)

    Description:
        Computes the square root of x. Domain errors occur for negative x.

    Arguments:
        x: The number for which to compute the square root.

    Return value:
        The square root of x. For finite values of x less than zero, this function returns nan.
    """
    return external_call["sqrtf", Float32, Float32](x)


fn cbrt(x: Float64) -> Float64:
    """C library <math.h> function `cbrt`.

    Link:
        https://man7.org/linux/man-pages/man3/cbrt.3.html

    Prototype:
        double cbrt(double x)

    Description:
        Extracts the cubic root of the number x.

    Arguments:
        x: The number for which to extract the cubic root.

    Return value:
        The cubic root of x.
    """
    return external_call["cbrt", Float64, Float64](x)


fn cbrtf(x: Float32) -> Float32:
    """C library <math.h> function `cbrtf`.

    Link:
        https://man7.org/linux/man-pages/man3/cbrt.3.html

    Prototype:
        float cbrtf(float x)

    Description:
        Extracts the cubic root of the number x.

    Arguments:
        x: The number for which to extract the cubic root.

    Return value:
        The cubic root of x.
    """
    return external_call["cbrtf", Float32, Float32](x)


fn hypot(x: Float64, y: Float64) -> Float64:
    """C library <math.h> function `hypot`.

    Link:
        https://man7.org/linux/man-pages/man3/hypot.3.html

    Prototype:
        double hypot(double x, double y)

    Description:
        Returns the length of the hypotenuse for a right triangle with sides equal to x and y, which are opposite the right angle. The calculations are equivalent to: sqrt(x * x + y * y).

    Arguments:
        x: The length of the side opposite the right angle of the triangle.
        y: The length of the side opposite the right angle of the triangle.

    Return value:
        On successful execution, hypot returns the length of the hypotenuse. In case of overflow, hypot returns inf.
    """
    return external_call["hypot", Float64, Float64, Float64](x, y)


fn hypotf(x: Float32, y: Float32) -> Float32:
    """C library <math.h> function `hypotf`.

    Link:
        https://man7.org/linux/man-pages/man3/hypot.3.html

    Prototype:
        float hypotf(float x, float y)

    Description:
        Returns the length of the hypotenuse for a right triangle with sides equal to x and y, which are opposite the right angle. The calculations are equivalent to: sqrt(x * x + y * y).

    Arguments:
        x: The length of the side opposite the right angle of the triangle.
        y: The length of the side opposite the right angle of the triangle.

    Return value:
        On successful execution, hypotf returns the length of the hypotenuse. In case of overflow, hypotf returns inf.
    """
    return external_call["hypotf", Float32, Float32, Float32](x, y)


fn pow(x: Float64, y: Float64) -> Float64:
    """C library <math.h> function `pow`.

    Link:
        https://man7.org/linux/man-pages/man3/pow.3.html

    Prototype:
        double pow(double x, double y)

    Description:
        Raises x to the power of y.

    Arguments:
        x: The number to be raised to a power.
        y: The exponent.

    Return value:
        The value of x^y. For finite values of x less than 0 and finite non-integer values of y, this function returns nan.
    """
    return external_call["pow", Float64, Float64, Float64](x, y)


fn powf(x: Float32, y: Float32) -> Float32:
    """C library <math.h> function `powf`.

    Link:
        https://man7.org/linux/man-pages/man3/pow.3.html

    Prototype:
        float powf(float x, float y)

    Description:
        Raises x to the power of y.

    Arguments:
        x: The number to be raised to a power.
        y: The exponent.

    Return value:
        The value of x^y. For finite values of x less than 0 and finite non-integer values of y, this function returns nan.
    """
    return external_call["powf", Float32, Float32, Float32](x, y)


# ------------------------------------------------------------------
# Trigonometric functions
# ------------------------------------------------------------------
fn asin(x: Float64) -> Float64:
    """C library <math.h> function `asin`.

    Link:
        https://man7.org/linux/man-pages/man3/asin.3.html

    Prototype:
        double asin(double x)

    Description:
        Computes the arcsine of x (given in radians).

    Arguments:
        x: The sine value for which to find the angle.

    Return value:
        The arcsine in the range (-π/2, π/2). For finite values outside the range [-1, 1], the function returns nan.
    """
    return external_call["asin", Float64, Float64](x)


fn asinf(x: Float32) -> Float32:
    """C library <math.h> function `asinf`.

    Link:
        https://man7.org/linux/man-pages/man3/asin.3.html

    Prototype:
        float asinf(float x)

    Description:
        Computes the arcsine of x (given in radians).

    Arguments:
        x: The sine value for which to find the angle.

    Return value:
        The arcsine in the range (-π/2, π/2). For finite values outside the range [-1, 1], the function returns nan.
    """
    return external_call["asinf", Float32, Float32](x)


fn acos(x: Float64) -> Float64:
    """C library <math.h> function `acos`.

    Link:
        https://man7.org/linux/man-pages/man3/acos.3.html

    Prototype:
        double acos(double x)

    Description:
        Computes the arccosine of x (given in radians).

    Arguments:
        x: The cosine value for which to find the angle.

    Return value:
        The arccosine in the range (0, π). For finite values outside the range [-1, 1], the function returns nan.
    """
    return external_call["acos", Float64, Float64](x)


fn acosf(x: Float32) -> Float32:
    """C library <math.h> function `acosf`.

    Link:
        https://man7.org/linux/man-pages/man3/acos.3.html

    Prototype:
        float acosf(float x)

    Description:
        Computes the arccosine of x (given in radians).

    Arguments:
        x: The cosine value for which to find the angle.

    Return value:
        The arccosine in the range (0, π). For finite values outside the range [-1, 1], the function returns nan.
    """
    return external_call["acosf", Float32, Float32](x)


fn atan(x: Float64) -> Float64:
    """C library <math.h> function `atan`.

    Link:
        https://man7.org/linux/man-pages/man3/atan.3.html

    Prototype:
        double atan(double x)

    Description:
        Computes the arctangent of x (given in radians).

    Arguments:
        x: The angle in radians.

    Return value:
        The arctangent in the range (-π/2, π/2).
    """
    return external_call["atan", Float64, Float64](x)


fn atanf(x: Float32) -> Float32:
    """C library <math.h> function `atanf`.

    Link:
        https://man7.org/linux/man-pages/man3/atan.3.html

    Prototype:
        float atanf(float x)

    Description:
        Computes the arctangent of x (given in radians).

    Arguments:
        x: The angle in radians.

    Return value:
        The arctangent in the range (-π/2, π/2).
    """
    return external_call["atanf", Float32, Float32](x)


fn atan2(x: Float64) -> Float64:
    """C library <math.h> function `atan2`.

    Link:
        https://man7.org/linux/man-pages/man3/atan2.3.html

    Prototype:
        double atan(double x)

    Description:
        Computes the arctangent of x (given in radians).

    Arguments:
        x: The angle in radians.

    Return value:
        The arctangent in the range (-π/2, π/2).
    """
    return external_call["atan2", Float64, Float64](x)


fn atan2f(x: Float32) -> Float32:
    """C library <math.h> function `atan2f`.

    Link:
        https://man7.org/linux/man-pages/man3/atan.3.html

    Prototype:
        float atanf(float x)

    Description:
        Computes the arctangent of x (given in radians).

    Arguments:
        x: The angle in radians.

    Return value:
        The arctangent in the range (-π/2, π/2).
    """
    return external_call["atan2f", Float32, Float32](x)


fn sin(x: Float64) -> Float64:
    """C library <math.h> function `sin`.

    Link:
        https://man7.org/linux/man-pages/man3/sin.3.html

    Prototype:
        double sin(double x)

    Description:
        Computes the sine of x (given in radians). There may be slight inaccuracies when called with large argument values.

    Arguments:
        x: The angle in radians for which to compute the sine.

    Return value:
        The sine value.
    """
    return external_call["sin", Float64, Float64](x)


fn sinf(x: Float32) -> Float32:
    """C library <math.h> function `sinf`.

    Link:
        https://man7.org/linux/man-pages/man3/sin.3.html

    Prototype:
        float sinf(float x)

    Description:
        Computes the sine of x (given in radians). There may be slight inaccuracies when called with large argument values.

    Arguments:
        x: The angle in radians for which to compute the sine.

    Return value:
        The sine value.
    """
    return external_call["sinf", Float32, Float32](x)


fn cos(x: Float64) -> Float64:
    """C library <math.h> function `cos`.

    Link:
        https://man7.org/linux/man-pages/man3/cos.3.html

    Prototype:
        double cos(double x)

    Description:
        Computes the cosine of x (given in radians).

    Arguments:
        x: The angle in radians for which to compute the cosine.

    Return value:
        The cosine value.
    """
    return external_call["cos", Float64, Float64](x)


fn cosf(x: Float32) -> Float32:
    """C library <math.h> function `cosf`.

    Link:
        https://man7.org/linux/man-pages/man3/cos.3.html

    Prototype:
        float cosf(float x)

    Description:
        Computes the cosine of x (given in radians).

    Arguments:
        x: The angle in radians for which to compute the cosine.

    Return value:
        The cosine value.
    """
    return external_call["cosf", Float32, Float32](x)


fn tan(x: Float64) -> Float64:
    """C library <math.h> function `tan`.

    Link:
        https://man7.org/linux/man-pages/man3/tan.3.html

    Prototype:
        double tan(double x)

    Description:
        Computes the tangent of x (given in radians). There may be slight inaccuracies when called with large argument values.

    Arguments:
        x: The angle in radians for which to compute the tangent.

    Return value:
        The tangent value.
    """
    return external_call["tan", Float64, Float64](x)


fn tanf(x: Float32) -> Float32:
    """C library <math.h> function `tanf`.

    Link:
        https://man7.org/linux/man-pages/man3/tan.3.html

    Prototype:
        float tanf(float x)

    Description:
        Computes the tangent of x (given in radians). There may be slight inaccuracies when called with large argument values.

    Arguments:
        x: The angle in radians for which to compute the tangent.

    Return value:
        The tangent value.
    """
    return external_call["tanf", Float32, Float32](x)


#--------------------------------------------------
# Hyperbolic functions
# ---------------------------------------------


fn sinh(x: Float64) -> Float64:
    """C library <math.h> function `sinh`.

    Link:
        https://man7.org/linux/man-pages/man3/sinh.3.html

    Prototype:
        double sinh(double x)

    Description:
        Computes the hyperbolic sine of x (given in radians). Range errors may occur with very large x values.

    Arguments:
        x: The angle in radians for which to compute the hyperbolic sine.

    Return value:
        The hyperbolic sine value.
    """
    return external_call["sinh", Float64, Float64](x)


fn sinhf(x: Float32) -> Float32:
    """C library <math.h> function `sinhf`.

    Link:
        https://man7.org/linux/man-pages/man3/sinh.3.html

    Prototype:
        float sinhf(float x)

    Description:
        Computes the hyperbolic sine of x (given in radians). Range errors may occur with very large x values.

    Arguments:
        x: The angle in radians for which to compute the hyperbolic sine.

    Return value:
        The hyperbolic sine value.
    """
    return external_call["sinhf", Float32, Float32](x)


fn cosh(x: Float64) -> Float64:
    """C library <math.h> function `cosh`.

    Link:
        https://man7.org/linux/man-pages/man3/cosh.3.html

    Prototype:
        double cosh(double x)

    Description:
        Computes the hyperbolic cosine of x (given in radians). Range errors may occur with very large x values.

    Arguments:
        x: The angle in radians for which to compute the hyperbolic cosine.

    Return value:
        The hyperbolic cosine value.
    """
    return external_call["cosh", Float64, Float64](x)


fn coshf(x: Float32) -> Float32:
    """C library <math.h> function `coshf`.

    Link:
        https://man7.org/linux/man-pages/man3/cosh.3.html

    Prototype:
        float coshf(float x)

    Description:
        Computes the hyperbolic cosine of x (given in radians). Range errors may occur with very large x values.

    Arguments:
        x: The angle in radians for which to compute the hyperbolic cosine.

    Return value:
        The hyperbolic cosine value.
    """
    return external_call["coshf", Float32, Float32](x)


fn tanh(x: Float64) -> Float64:
    """C library <math.h> function `tanh`.

    Link:
        https://man7.org/linux/man-pages/man3/tanh.3.html

    Prototype:
        double tanh(double x)

    Description:
        Computes the hyperbolic tangent of x (given in radians). Full or partial loss of precision may occur with large x values.

    Arguments:
        x: The angle in radians for which to compute the hyperbolic tangent.

    Return value:
        The hyperbolic tangent value.
    """
    return external_call["tanh", Float64, Float64](x)


fn tanhf(x: Float32) -> Float32:
    """C library <math.h> function `tanhf`.

    Link:
        https://man7.org/linux/man-pages/man3/tanh.3.html

    Prototype:
        float tanhf(float x)

    Description:
        Computes the hyperbolic tangent of x (given in radians). Full or partial loss of precision may occur with large x values.

    Arguments:
        x: The angle in radians for which to compute the hyperbolic tangent.

    Return value:
        The hyperbolic tangent value.
    """
    return external_call["tanhf", Float32, Float32](x)


fn asinh(x: Float64) -> Float64:
    """C library <math.h> function `asinh`.

    Link:
        https://man7.org/linux/man-pages/man3/asinh.3.html

    Prototype:
        double asinh(double x)

    Description:
        Computes the inverse hyperbolic sine of x (given in radians).

    Arguments:
        x: The value for which to compute the inverse hyperbolic sine.

    Return value:
        The inverse hyperbolic sine of x (given in radians).
    """
    return external_call["asinh", Float64, Float64](x)


fn asinhf(x: Float32) -> Float32:
    """C library <math.h> function `asinhf`.

    Link:
        https://man7.org/linux/man-pages/man3/asinh.3.html

    Prototype:
        float asinhf(float x)

    Description:
        Computes the inverse hyperbolic sine of x (given in radians).

    Arguments:
        x: The value for which to compute the inverse hyperbolic sine.

    Return value:
        The inverse hyperbolic sine of x (given in radians).
    """
    return external_call["asinhf", Float32, Float32](x)


fn acosh(x: Float64) -> Float64:
    """C library <math.h> function `acosh`.

    Link:
        https://man7.org/linux/man-pages/man3/acosh.3.html

    Prototype:
        double acosh(double x)

    Description:
        Computes the inverse hyperbolic cosine of x (given in radians).

    Arguments:
        x: The value for which to compute the inverse hyperbolic cosine.

    Return value:
        The inverse hyperbolic cosine of x (given in radians). For finite values of x < 1, these functions return nan.
    """
    return external_call["acosh", Float64, Float64](x)


fn acoshf(x: Float32) -> Float32:
    """C library <math.h> function `acoshf`.

    Link:
        https://man7.org/linux/man-pages/man3/acosh.3.html

    Prototype:
        float acoshf(float x)

    Description:
        Computes the inverse hyperbolic cosine of x (given in radians).

    Arguments:
        x: The value for which to compute the inverse hyperbolic cosine.

    Return value:
        The inverse hyperbolic cosine of x (given in radians). For finite values of x < 1, these functions return nan.
    """
    return external_call["acoshf", Float32, Float32](x)


fn atanh(x: Float64) -> Float64:
    """C library <math.h> function `atanh`.

    Link:
        https://man7.org/linux/man-pages/man3/atanh.3.html

    Prototype:
        double atanh(double x)

    Description:
        Computes the inverse hyperbolic tangent of x (given in radians).

    Arguments:
        x: The value for which to compute the inverse hyperbolic tangent.

    Return value:
        The inverse hyperbolic tangent of x (given in radians).
    """
    return external_call["atanh", Float64, Float64](x)


fn atanhf(x: Float32) -> Float32:
    """C library <math.h> function `atanhf`.

    Link:
        https://man7.org/linux/man-pages/man3/atanh.3.html

    Prototype:
        float atanhf(float x)

    Description:
        Computes the inverse hyperbolic tangent of x (given in radians).

    Arguments:
        x: The value for which to compute the inverse hyperbolic tangent.

    Return value:
        The inverse hyperbolic tangent of x (given in radians).
    """
    return external_call["atanhf", Float32, Float32](x)


# ------------------------------------------------------------
# Error and gamma functions
# ------------------------------------------------------------
fn erff(arg: Float32) -> Float32:
    """C library <math.h> function `erff`.

    Link:
        https://man7.org/linux/man-pages/man3/erff.3.html

    Prototype:
        float erff(float arg)

    Description:
        Computes the error of arg.

    Arguments:
        arg

    Return value:
        The error of x .

    """
    return external_call["erff", Float32, Float32](arg)


fn erf(arg: Float64) -> Float64:
    """C library <math.h> function `erf`.

    Link:
        https://man7.org/linux/man-pages/man3/erf.3.html

    Prototype:
        double erf(double arg)

    Description:
        Computes the error of arg.

    Arguments:
        arg

    Return value:
        The error of x .

    """
    return external_call["erff", Float64, Float64](arg)


fn lgamma(x: Float64) -> Float64:
    """C library <math.h> function `lgamma`.

    Link:
        https://man7.org/linux/man-pages/man3/lgamma.3.html

    Prototype:
        double lgamma(double x)

    Description:
        Returns the natural logarithm of the absolute value of the gamma function for the specified value.

    Arguments:
        x: An arbitrary number.

    Return value:
        On success, returns the natural logarithm of the absolute value of the gamma function of x.
    """
    return external_call["lgamma", Float64, Float64](x)


fn lgammaf(x: Float32) -> Float32:
    """C library <math.h> function `lgammaf`.

    Link:
        https://man7.org/linux/man-pages/man3/lgamma.3.html

    Prototype:
        float lgammaf(float x)

    Description:
        Returns the natural logarithm of the absolute value of the gamma function for the specified value.

    Arguments:
        x: An arbitrary number.

    Return value:
        On success, returns the natural logarithm of the absolute value of the gamma function of x.
    """
    return external_call["lgammaf", Float32, Float32](x)


fn lgamma_r(x: Float64, signptr: UnsafePointer[Int32]) -> Float64:
    """C library <math.h> function `lgamma_r`.

    Link:
        https://man7.org/linux/man-pages/man3/lgamma.3.html

    Prototype:
        double lgamma_r(double x, int *signptr)

    Description:
        Returns the natural logarithm of the absolute value of the gamma function for the specified value.

    Arguments:
        x: An arbitrary number.
        signptr: A pointer to memory where the function can store the sign of the gamma function for the specified value.

    Return value:
        On success, returns the natural logarithm of the absolute value of the gamma function of x.
    """
    return external_call[
        "lgamma_r", Float64, Float64, UnsafePointer[Int32]
    ](x, signptr)


fn lgammaf_r(x: Float32, signptr: UnsafePointer[Int32]) -> Float32:
    """C library <math.h> function `lgammaf_r`.

    Link:
        https://man7.org/linux/man-pages/man3/lgamma.3.html

    Prototype:
        float lgammaf_r(float x, int *signptr)

    Description:
        Returns the natural logarithm of the absolute value of the gamma function for the specified value.

    Arguments:
        x: An arbitrary number.
        signptr: A pointer to memory where the function can store the sign of the gamma function for the specified value.

    Return value:
        On success, returns the natural logarithm of the absolute value of the gamma function of x.
    """
    return external_call[
        "lgammaf_r", Float32, Float32, UnsafePointer[Int32]
    ](x, signptr)


fn tgamma(x: Float64) -> Float64:
    """C library <math.h> function `tgamma`.

    Link:
        https://man7.org/linux/man-pages/man3/tgamma.3.html

    Prototype:
        double tgamma(double x)

    Description:
        Returns the gamma function of the specified value.

    Arguments:
        x: The value for which to find the gamma.

    Return value:
        On success, returns the gamma of x.
    """
    return external_call["tgamma", Float64, Float64](x)


fn tgammaf(x: Float32) -> Float32:
    """C library <math.h> function `tgammaf`.

    Link:
        https://man7.org/linux/man-pages/man3/tgamma.3.html

    Prototype:
        float tgammaf(float x)

    Description:
        Returns the gamma function of the specified value.

    Arguments:
        x: The value for which to find the gamma.

    Return value:
        On success, returns the gamma of x.
    """
    return external_call["tgammaf", Float32, Float32](x)


fn gamma(x: Float64) -> Float64:
    """C library <math.h> function `tgamma`.

    Link:
        https://man7.org/linux/man-pages/man3/gamma.3.html

    Prototype:
        double tgamma(double x)

    Description:
        Computes the gamma function of x.

    Arguments:
        x: The value for which to compute the gamma function.

    Return value:
        The gamma value. For finite values less than or equal to zero, this function returns nan.
    """
    return external_call["tgamma", Float64, Float64](x)


fn gammaf(x: Float32) -> Float32:
    """C library <math.h> function `tgammaf`.

    Link:
        https://man7.org/linux/man-pages/man3/gamma.3.html

    Prototype:
        float tgammaf(float x)

    Description:
        Computes the gamma function of x.

    Arguments:
        x: The value for which to compute the gamma function.

    Return value:
        The gamma value. For finite values less than or equal to zero, this function returns nan.
    """
    return external_call["tgammaf", Float32, Float32](x)


# ----------------------------------------------------
# Nearest Integer floating-point operations
# ----------------------------------------------------
fn ceil(x: Float64) -> Float64:
    """C library <math.h> function `ceil`.

    Link:
        https://man7.org/linux/man-pages/man3/ceil.3.html

    Prototype:
        double ceil(double x)

    Description:
        Rounds the value x up to the nearest integer (towards positive infinity).

    Arguments:
        x: The number to be rounded.

    Return value:
        The smallest integer ≥ x.
    """
    return external_call["ceil", Float64, Float64](x)


fn ceilf(x: Float32) -> Float32:
    """C library <math.h> function `ceilf`.

    Link:
        https://man7.org/linux/man-pages/man3/ceil.3.html

    Prototype:
        float ceilf(float x)

    Description:
        Rounds the value x up to the nearest integer (towards positive infinity).

    Arguments:
        x: The number to be rounded.

    Return value:
        The smallest integer ≥ x.
    """
    return external_call["ceilf", Float32, Float32](x)


fn floor(x: Float64) -> Float64:
    """C library <math.h> function `floor`.

    Link:
        https://man7.org/linux/man-pages/man3/floor.3.html

    Prototype:
        double floor(double x)

    Description:
        Computes the largest integer ≤ x (rounding down).

    Arguments:
        x: The number to be rounded.

    Return value:
        The largest integer ≤ x.
    """
    return external_call["floor", Float64, Float64](x)


fn floorf(x: Float32) -> Float32:
    """C library <math.h> function `floorf`.

    Link:
        https://man7.org/linux/man-pages/man3/floor.3.html

    Prototype:
        float floorf(float x)

    Description:
        Computes the largest integer ≤ x (rounding down).

    Arguments:
        x: The number to be rounded.

    Return value:
        The largest integer ≤ x.
    """
    return external_call["floorf", Float32, Float32](x)


fn round(x: Float64) -> Float64:
    """C library <math.h> function `round`.

    Link:
        https://man7.org/linux/man-pages/man3/round.3.html

    Prototype:
        double round(double x)

    Description:
        Rounds the floating-point value to the nearest integer value.

    Arguments:
        x: The floating-point value to be rounded.

    Return value:
        The floating-point value representing the integer closest to x. Intermediate values are rounded away from zero, regardless of the floating-point rounding mode settings.
    """
    return external_call["round", Float64, Float64](x)


fn roundf(x: Float32) -> Float32:
    """C library <math.h> function `roundf`.

    Link:
        https://man7.org/linux/man-pages/man3/round.3.html

    Prototype:
        float roundf(float x)

    Description:
        Rounds the floating-point value to the nearest integer value.

    Arguments:
        x: The floating-point value to be rounded.

    Return value:
        The floating-point value representing the integer closest to x. Intermediate values are rounded away from zero, regardless of the floating-point rounding mode settings.
    """
    return external_call["roundf", Float32, Float32](x)


fn trunc(x: Float64) -> Float64:
    """C library <math.h> function `trunc`.

    Link:
        https://man7.org/linux/man-pages/man3/trunc.3.html

    Prototype:
        double trunc(double x)

    Description:
        Rounds the nearest integer value not greater in magnitude that x.

    Arguments:
        x: The floating-point value to be trunced.

    Return value:
        If no errors occur, the nearest integer value not greater in magnitude than arg (in other words, arg rounded towards zero), is returned.
    """
    return external_call["trunc", Float64, Float64](x)


fn truncf(x: Float32) -> Float32:
    """C library <math.h> function `truncf`.

    Link:
        https://man7.org/linux/man-pages/man3/truncf.3.html

    Prototype:
        float truncf(float x)

    Description:
        Rounds the nearest integer value not greater in magnitude that x.

    Arguments:
        x: The floating-point value to be trunced.

    Return value:
        If no errors occur, the nearest integer value not greater in magnitude than arg (in other words, arg rounded towards zero), is returned.
    """
    return external_call["truncf", Float32, Float32](x)


fn rint(x: Float64) -> Float64:
    """C library <math.h> function `rint`.

    Link:
        https://man7.org/linux/man-pages/man3/rint.3.html

    Prototype:
        double rint(double x)

    Description:
        Returns the integer closest to x in the direction of the current rounding mode. If the current rounding type is set towards negative infinity, then rint() is identical to floor(). If the current rounding type is set towards positive infinity, then rint() is identical to ceil().

    Arguments:
        x: The number to be rounded.

    Return value:
        An integer (represented as a double-precision Float64) closest to x in the direction of the current rounding mode (IEEE754).
    """
    return external_call["rint", Float64, Float64](x)


fn rintf(x: Float32) -> Float32:
    """C library <math.h> function `rintf`.

    Link:
        https://man7.org/linux/man-pages/man3/rint.3.html

    Prototype:
        float rintf(float x)

    Description:
        Returns the integer closest to x in the direction of the current rounding mode. If the current rounding type is set towards negative infinity, then rintf() is identical to floor(). If the current rounding type is set towards positive infinity, then rintf() is identical to ceil().

    Arguments:
        x: The number to be rounded.

    Return value:
        An integer (represented as a single-precision Float32) closest to x in the direction of the current rounding mode (IEEE754).
    """
    return external_call["rintf", Float32, Float32](x)


fn nearbyint(x: Float64) -> Float64:
    """C library <math.h> function `nearbyint`.

    Link:
        https://man7.org/linux/man-pages/man3/rint.3.html

    Prototype:
        double nearbyint(double x)

    Description:
        Returns the integer closest to x in the direction of the current rounding mode. If the current rounding type is set towards negative infinity, then nearbyint() is identical to floor(). If the current rounding type is set towards positive infinity, then nearbyint() is identical to ceil().

    Arguments:
        x: The number to be rounded.

    Return value:
        An integer (represented as a double-precision Float64) closest to x in the direction of the current rounding mode (IEEE754).
    """
    return external_call["nearbyint", Float64, Float64](x)


fn nearbyintf(x: Float32) -> Float32:
    """C library <math.h> function `nearbyintf`.

    Link:
        https://man7.org/linux/man-pages/man3/rint.3.html

    Prototype:
        float nearbyintf(float x)

    Description:
        Returns the integer closest to x in the direction of the current rounding mode. If the current rounding type is set towards negative infinity, then nearbyintf() is identical to floor(). If the current rounding type is set towards positive infinity, then nearbyintf() is identical to ceil().

    Arguments:
        x: The number to be rounded.

    Return value:
        An integer (represented as a single-precision Float32) closest to x in the direction of the current rounding mode (IEEE754).
    """
    return external_call["nearbyintf", Float32, Float32](x)


# -----------------------------------------------------------------
# Floating-point manipulation functions
# -----------------------------------------------------------------

fn frexp(x: Float64, expptr: UnsafePointer[Int32]) -> Float64:
    """C library <math.h> function `frexp`.

    Link:
        https://man7.org/linux/man-pages/man3/frexp.3.html

    Prototype:
        double frexp(double x, int *expptr)

    Description:
        Decomposes a floating-point number into its mantissa and an integer power of 2. Stores the power of 2 in the int pointed to by expptr.

    Arguments:
        x: The value you want to decompose into a normalized fraction.
        expptr: A pointer to memory where the function can store the power of 2.

    Return value:
        Returns the mantissa with a value in the range [0.5, 1] or 0, such that x equals the mantissa multiplied by 2 raised to the power of expptr. If x is 0, the function returns 0 for both mantissa and exponent.
    """
    return external_call["frexp", Float64, Float64, UnsafePointer[Int32]](
        x, expptr
    )


fn frexpf(x: Float32, expptr: UnsafePointer[Int32]) -> Float32:
    """C library <math.h> function `frexpf`.

    Link:
        https://man7.org/linux/man-pages/man3/frexp.3.html

    Prototype:
        float frexpf(float x, int *expptr)

    Description:
        Decomposes a floating-point number into its mantissa and an integer power of 2. Stores the power of 2 in the int pointed to by expptr.

    Arguments:
        x: The value you want to decompose into a normalized fraction.
        expptr: A pointer to memory where the function can store the power of 2.

    Return value:
        Returns the mantissa with a value in the range [0.5, 1] or 0, such that x equals the mantissa multiplied by 2 raised to the power of expptr. If x is 0, the function returns 0 for both mantissa and exponent.
    """
    return external_call["frexpf", Float32, Float32, UnsafePointer[Int32]](
        x, expptr
    )


fn ldexp(x: Float64, exp: Int32) -> Float64:
    """C library <math.h> function `ldexp`.

    Link:
        https://man7.org/linux/man-pages/man3/ldexp.3.html

    Prototype:
        double ldexp(double x, int exp)

    Description:
        Multiplies a floating-point number by an integer power of two. An overflow error may occur.

    Arguments:
        x: A floating-point number.
        exp: The power of 2 to multiply x by.

    Return value:
        On success, the function returns the value x * 2^exp.
    """
    return external_call["ldexp", Float64, Float64, Int32](x, exp)


fn ldexpf(x: Float32, exp: Int32) -> Float32:
    """C library <math.h> function `ldexpf`.

    Link:
        https://man7.org/linux/man-pages/man3/ldexp.3.html

    Prototype:
        float ldexpf(float x, int exp)

    Description:
        Multiplies a floating-point number by an integer power of two. An overflow error may occur.

    Arguments:
        x: A floating-point number.
        exp: The power of 2 to multiply x by.

    Return value:
        On success, the function returns the value x * 2^exp.
    """
    return external_call["ldexpf", Float32, Float32, Int32](x, exp)


fn modf(x: Float64, intptr: UnsafePointer[Float64]) -> Float64:
    """C library <math.h> function `modf`.

    Link:
        https://man7.org/linux/man-pages/man3/modf.3.html

    Prototype:
        double modf(double x, double *intptr)

    Description:
        Decomposes the given value into its integer and fractional parts, both of which have the same sign as the argument. This function stores the integer part as a Float64 in the memory pointed to by intptr.

    Arguments:
        x: The number to be decomposed.
        intptr: A pointer to memory where the function can store the integer part of the number.

    Return value:
        The fractional part of x with the same sign.
    """
    return external_call["modf", Float64, Float64, UnsafePointer[Float64]](
        x, intptr
    )


fn modff(x: Float32, intptr: UnsafePointer[Float32]) -> Float32:
    """C library <math.h> function `modff`.

    Link:
        https://man7.org/linux/man-pages/man3/modf.3.html

    Prototype:
        float modff(float x, float *intptr)

    Description:
        Decomposes the given value into its integer and fractional parts, both of which have the same sign as the argument. This function stores the integer part as a Float32 in the memory pointed to by intptr.

    Arguments:
        x: The number to be decomposed.
        intptr: A pointer to memory where the function can store the integer part of the number.

    Return value:
        The fractional part of x with the same sign.
    """
    return external_call[
        "modff", Float32, Float32, UnsafePointer[Float32]
    ](x, intptr)


fn scalbln(x: Float64, exp: Int64) -> Float64:
    """C library <math.h> function `scalbln`.

    Link:
        https://man7.org/linux/man-pages/man3/scalbln.3.html

    Prototype:
        double scalbln(double x, long exp)

    Description:
        Computes x × r^exp, where r is the base of the floating-point arithmetic system of the device.

    Arguments:
        x: A floating-point number to be multiplied by the exponent.
        exp: The exponent to be applied to the base of the floating-point arithmetic system of the device.

    Return value:
        The value of x × r^exp upon successful execution.
    """
    return external_call["scalbln", Float64, Float64, Int64](x, exp)


fn scalblnf(x: Float32, exp: Int64) -> Float32:
    """C library <math.h> function `scalblnf`.

    Link:
        https://man7.org/linux/man-pages/man3/scalbln.3.html

    Prototype:
        float scalblnf(float x, long exp)

    Description:
        Computes x × r^exp, where r is the base of the floating-point arithmetic system of the device. The base value is defined by the constant FLT_RADIX specified in the float.h library.

    Arguments:
        x: A floating-point number to be multiplied by the exponent.
        exp: The exponent to be applied to the base of the floating-point arithmetic system of the device.

    Return value:
        The value of x × r^exp upon successful execution.
    """
    return external_call["scalblnf", Float32, Float32, Int64](x, exp)


fn scalbn(x: Float64, exp: Int32) -> Float64:
    """C library <math.h> function `scalbn`.

    Link:
        https://man7.org/linux/man-pages/man3/scalbln.3.html

    Prototype:
        double scalbn(double x, int exp)

    Description:
        Computes x × r^exp, where r is the base of the floating-point arithmetic system of the device.

    Arguments:
        x: A floating-point number to be multiplied by the exponent.
        exp: The exponent to be applied to the base of the floating-point arithmetic system of the device.

    Return value:
        The value of x × r^exp upon successful execution.
    """
    return external_call["scalbn", Float64, Float64, Int32](x, exp)


fn scalbnf(x: Float32, exp: Int32) -> Float32:
    """C library <math.h> function `scalbnf`.

    Link:
        https://man7.org/linux/man-pages/man3/scalbln.3.html

    Prototype:
        float scalbnf(float x, int exp)

    Description:
        Computes x × r^exp, where r is the base of the floating-point arithmetic system of the device.

    Arguments:
        x: A floating-point number to be multiplied by the exponent.
        exp: The exponent to be applied to the base of the floating-point arithmetic system of the device.

    Return value:
        The value of x × r^exp upon successful execution.
    """
    return external_call["scalbnf", Float32, Float32, Int32](x, exp)


fn nextafter(x: Float64, y: Float64) -> Float64:
    """C library <math.h> function `nextafter`.

    Link:
        https://man7.org/linux/man-pages/man3/nextafter.3.html

    Prototype:
        double nextafter(double x, double y)

    Description:
        Computes the next representable floating-point value after x in the direction of y.

    Arguments:
        x: The number after which the next representable number is to be found.
        y: The number indicating the direction of the search.

    Return value:
        The next representable floating-point value after x in the direction of y.
    """
    return external_call["nextafter", Float64, Float64, Float64](x, y)


fn nextafterf(x: Float32, y: Float32) -> Float32:
    """C library <math.h> function `nextafterf`.

    Link:
        https://man7.org/linux/man-pages/man3/nextafter.3.html

    Prototype:
        float nextafterf(float x, float y)

    Description:
        Computes the next representable floating-point value after x in the direction of y with single precision.

    Arguments:
        x: The number after which the next representable number is to be found.
        y: The number indicating the direction of the search.

    Return value:
        The next representable floating-point value after x in the direction of y.
    """
    return external_call["nextafterf", Float32, Float32, Float32](x, y)


fn nexttoward(x: Float64, y: Float64) -> Float64:
    """C library <math.h> function `nexttoward`.

    Link:
        https://man7.org/linux/man-pages/man3/nexttoward.3.html

    Prototype:
        double nexttoward(double x, double y)

    Description:
        Computes the next representable floating-point value from to y.

    Arguments:
        x
        y

    Return value:
        The next representable floating-point value after from x to y.
    """
    return external_call["nexttoward", Float64, Float64, Float64](x, y)


fn nexttowardf(x: Float32, y: Float32) -> Float32:
    """C library <math.h> function `nexttowardf`.

    Link:
        https://man7.org/linux/man-pages/man3/nexttowardf.3.html

    Prototype:
        float nexttowardf(float x, float y)

    Description:
        Computes the next representable floating-point value from to y.

    Arguments:
        x
        y

    Return value:
        The next representable floating-point value after x in the direction of y.
    """
    return external_call["nexttowardf", Float32, Float32, Float32](x, y)


fn copysign(x: Float64, y: Float64) -> Float64:
    """C library <math.h> function `copysign`.

    Link:
        https://man7.org/linux/man-pages/man3/copysign.3.html

    Prototype:
        double copysign(double x, double y)

    Description:
        Returns the value of x with the sign bit of y.

    Arguments:
        x: The number from which to borrow the value.
        y: The number from which to borrow the sign.

    Return value:
        The value of x with the sign bit of y.
    """
    return external_call["copysign", Float64, Float64, Float64](x, y)


fn copysignf(x: Float32, y: Float32) -> Float32:
    """C library <math.h> function `copysignf`.

    Link:
        https://man7.org/linux/man-pages/man3/copysign.3.html

    Prototype:
        float copysignf(float x, float y)

    Description:
        Returns the value of x with the sign bit of y.

    Arguments:
        x: The number from which to borrow the value.
        y: The number from which to borrow the sign.

    Return value:
        The value of x with the sign bit of y.
    """
    return external_call["copysignf", Float32, Float32, Float32](x, y)


# -------------------------------------------------
# classification
# 后续补充
# ---------------------------------------------------

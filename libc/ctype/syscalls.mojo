# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from sys import external_call
from libc.constant import * 


@always_inline("nodebug")
fn islower(c: Int32) -> Int32:
    return external_call["islower", Int32](c)


@always_inline("nodebug")
fn islowe_l(c: Int64) -> Int64:
    return external_call["islower_l", Int64](c)


@always_inline("nodebug")
fn isupper(c: Int32) -> Int32:
    return external_call["isupper", Int32](c)


@always_inline("nodebug")
fn isupper_l(c: Int64) -> Int64:
    return external_call["isupper_l", Int64](c)


@always_inline("nodebug")
fn isalpha(c: Int32) -> Int32:
    return external_call["isalpha", Int32](c)


@always_inline("nodebug")
fn isdigit(c: Int32) -> Int32:
    return external_call["isdigit", Int32](c)


@always_inline("nodebug")
fn isdigit_l(c: Int64) -> Int64:
    return external_call["isdigit_l", Int64](c)


@always_inline("nodebug")
fn isalnum(c: Int32) -> Int32:
    return external_call["isalnum", Int32](c)


@always_inline("nodebug")
fn isalnum_l(c: Int64) -> Int64:
    return external_call["isalnum_l", Int64](c)


@always_inline("nodebug")
fn isxdigit(c: Int32) -> Int32:
    return external_call["isxdigit", Int32](c)


@always_inline("nodebug")
fn isxdigit_l(c: Int64) -> Int64:
    return external_call["isxdigit_l", Int64](c)


@always_inline("nodebug")
fn isspace(c: Int32) -> Int32:
    return external_call["isspace", Int32](c)

@always_inline("nodebug")
fn isblank(c: Int32) -> Int32:
    return external_call["isblank", Int32](c)


@always_inline("nodebug")
fn isblank_l(c: Int64) -> Int64:
    return external_call["isblank", Int64](c)

@always_inline("nodebug")
fn iscntrl(c: Int32) -> Int32:
    return external_call["iscntrl", Int32](c)


@always_inline("nodebug")
fn iscntrl_l(c: Int64) -> Int64:
    return external_call["iscntrl", Int64](c)


@always_inline("nodebug")
fn isgraph(c: Int32) -> Int32:
    return external_call["isgraph", Int32](c)


@always_inline("nodebug")
fn isgraph_l(c: Int64) -> Int64:
    return external_call["isgraph_l", Int64](c)


@always_inline("nodebug")
fn isascii(c: Int32) -> Int32:
    return external_call["isascii", Int32](c)


@always_inline("nodebug")
fn isascii_l(c: Int64) -> Int64:
    return external_call["isascii", Int64](c)


@always_inline("nodebug")
fn isprint(c: Int32) -> Int32:
    return external_call["isprint", Int32](c)


@always_inline("nodebug")
fn isprint_l(c: Int64) -> Int64:
    return external_call["isprint_l", Int64](c)


@always_inline("nodebug")
fn ispunct(c: Int32) -> Int32:
    return external_call["ispunct", Int32](c)


@always_inline("nodebug")
fn ispunct_l(c: Int64) -> Int64:
    return external_call["ispunct_l", Int64](c)



@always_inline("nodebug")
fn tolower(c: Int32) -> Int32:
    return external_call["tolower", Int32](c)


@always_inline("nodebug")
fn tolower_l(c: Int64) -> Int64:
    return external_call["tolower_l", Int64](c)

@always_inline("nodebug")
fn toupper(c: Int32) -> Int32:
    return external_call["toupper", Int32](c)


@always_inline("nodebug")
fn toupper_l(c: Int64) -> Int64:
    return external_call["toupper", Int64](c)

@always_inline("nodebug")
fn toascii(c: Int32) -> Int32:
    return external_call["toascii", Int32](c)
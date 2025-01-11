# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from memory import UnsafePointer
from sys import external_call

alias NUM_LOCALE_CATEGORIES = 6


struct LocaleData:
    pass


@register_passable('trivial')
struct Locale:
    var data: UnsafePointer[LocaleData]

    fn __init__(out self):
        self.data = UnsafePointer[LocaleData].alloc(NUM_LOCALE_CATEGORIES)
    

alias locale_t = Locale


fn duplocale(locobj: locale_t) -> locale_t:
    """C library <locale.h> function `duplocale`.

    Reference:
        https://man7.org/linux/man-pages/man3/duplocale.3.html
    
    Prototype:
        locale_t duplocale(locale_t locobj)
    
    Description:
        Returns a copy of the locale object locobj.
    
    Return value:
        A new locale object that is a copy of locobj. If locobj is NULL, returns NULL.
    """
    
    return external_call["duplocale", locale_t, locale_t](locobj)


fn freelocale(locobj: locale_t) -> Int8:
    """C library <locale.h> function `freelocale`.

    Reference:
        https://man7.org/linux/man-pages/man3/freelocale.3.html
    
    Prototype:
        void freelocale(locale_t locobj)
    
    Description:
        Frees the memory associated with the locale object locobj.
    
    Return value:
        None. 
    """
    return external_call["freelocale", Int8, locale_t](locobj)


fn newlocale(category_mask: Int32, locale: UnsafePointer[Int8], base: locale_t) -> locale_t:
    """C library <locale.h> function `newlocale`.

    Reference:
        https://man7.org/linux/man-pages/man3/newlocale.3.html
    
    Prototype:
        locale_t newlocale(int category_mask, const char *locale, locale_t base)
    
    Description:
        Creates a new locale object from the locale string locale.
    
    Return value:
        On success, the new locale object is returned. On error, NULL is returned.
    """
    return external_call["newlocale", locale_t, Int32, UnsafePointer[Int8], locale_t](category_mask, locale, base)


fn uselocale(locobj: locale_t) -> locale_t:
    """C library <locale.h> function `uselocale`.

    Reference:
        https://man7.org/linux/man-pages/man3/uselocale.3.html
    
    Prototype:
        locale_t uselocale(locale_t locobj)
    
    Description:
        Sets the current locale object to locobj, and returns the previous locale object.
    
    Return value:
        The previous locale object.
    """
    return external_call["uselocale", locale_t, locale_t](locobj)   


fn setlocale(category: Int32, locale: UnsafePointer[Int8]) -> UnsafePointer[Int8]:
    """C library <locale.h> function `setlocale`.

    Reference:
        https://man7.org/linux/man-pages/man3/setlocale.3.html
    
    Prototype:
        char *setlocale(int category, const char *locale)
    
    Description:
        Sets the locale for the specified category to the locale string locale.
    
    Return value:
        On success, the locale string is returned. On error, NULL is returned.
    """
    return external_call["setlocale", UnsafePointer[Int8], Int32, UnsafePointer[Int8]](category, locale)


fn localeconv(locobj: locale_t) -> UnsafePointer[LocaleData]:
    """C library <locale.h> function `localeconv`.

    Reference:
        https://man7.org/linux/man-pages/man3/localeconv.3.html
    
    Prototype:
        struct lconv *localeconv(void)
    
    Description:
        Returns a pointer to a structure containing numeric and monetary information appropriate for the current locale.
    
    Return value:
        On success, a pointer to a structure containing numeric and monetary information appropriate for the current locale. On error, NULL is returned.
    """
    return external_call["localeconv", UnsafePointer[LocaleData]](locobj)
# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
from sys import external_call
from memory import UnsafePointer


fn madvise(addr: UnsafePointer[Int8], length: Int64, advice: Int32) -> Int32:
    """C library <sys/mman.h> function `madvise`.

    Reference:
        https://man7.org/linux/man-pages/man2/madvise.2.html
    
    Args:
        addr: The address to madvise.
        length: The length of the region to madvise.
        advice: The advice to give to the kernel.

    Description:
        madvise() lets the kernel know if the application is interested in the specified region of
        memory.
    
    Returns:
        0 on success, -1 on error.
    """
    return external_call["madvise", Int32, UnsafePointer[Int8], Int64, Int32](addr, length, advice)


fn mincore(addr: UnsafePointer[Int8], length: Int64, vec: UnsafePointer[Int8]) -> Int32:
    """C library <sys/mman.h> function `mincore`.

    Reference:
        https://man7.org/linux/man-pages/man2/mincore.2.html
    
    Args:
        addr: The address to mincore.
        length: The length of the region to mincore.
        vec: The vector to store the result in.

    Description:
        mincore() returns a vector of bytes indicating which pages are resident in physical memory,
        i.e. if the page is present in the page tables of the process.
    
    Returns:
        0 on success, -1 on error.
    """
    return external_call["mincore", Int32, UnsafePointer[Int8], Int64, UnsafePointer[Int8]](addr, length, vec)


fn mlock(addr: UnsafePointer[Int8], length: Int64) -> Int32:
    """C library <sys/mman.h> function `mlock`.

    Reference:
        https://man7.org/linux/man-pages/man2/mlock.2.html
    
    Args:
        addr: The address to mlock.
        length: The length of the region to mlock.

    Description:
        mlock() locks the specified region of memory in physical memory, preventing it from being
        paged to disk.
    
    Returns:
        0 on success, -1 on error.
    """
    return external_call["mlock", Int32, UnsafePointer[Int8], Int64](addr, length)


fn mlock2(addr: UnsafePointer[Int8], length: Int64, flags: Int32) -> Int32:
    """C library <sys/mman.h> function `mlock2`.

    Reference:
        https://man7.org/linux/man-pages/man2/mlock2.2.html
    
    Args:
        addr: The address to mlock2.
        length: The length of the region to mlock2.
        flags: The flags to use for mlock2.

    Description:
        mlock2() is similar to mlock(), but it allows the caller to specify additional flags.
    
    Returns:
        0 on success, -1 on error.
    """
    return external_call["mlock2", Int32, UnsafePointer[Int8], Int64, Int32](addr, length, flags)


fn munlock(addr: UnsafePointer[Int8], length: Int64) -> Int32:
    """C library <sys/mman.h> function `munlock`.

    Reference:
        https://man7.org/linux/man-pages/man2/munlock.2.html
    
    Args:
        addr: The address to munlock.
        length: The length of the region to munlock.

    Description:
        munlock() unlocks the specified region of memory, allowing it to be paged to disk again.
    
    Returns:
        0 on success, -1 on error.
    """
    return external_call["munlock", Int32, UnsafePointer[Int8], Int64](addr, length)


fn mlockall(flags: Int32) -> Int32:
    """C library <sys/mman.h> function `mlockall`.

    Reference:
        https://man7.org/linux/man-pages/man2/mlockall.2.html
    
    Args:
        flags: The flags to use for mlockall.

    Description:
        mlockall() locks all the pages of the process's address space in physical memory, preventing
        them from being paged to disk.
    
    Returns:
        0 on success, -1 on error.
    """
    return external_call["mlockall", Int32, Int32](flags)


fn munlockall() -> Int32:
    """C library <sys/mman.h> function `munlockall`.

    Reference:
        https://man7.org/linux/man-pages/man2/munlockall.2.html

    Description:
        munlockall() unlocks all the pages of the process's address space, allowing them to be
        paged to disk again.
    
    Returns:
        0 on success, -1 on error.
    """
    return external_call["munlockall", Int32]()


fn mmap(addr: UnsafePointer[Int8], length: Int64, prot: Int32, flags: Int32, fd: Int32, offset: Int64) -> UnsafePointer[Int8]:
    """C library <sys/mman.h> function `mmap`.

    Reference:
        https://man7.org/linux/man-pages/man2/mmap.2.html
    
    Args:
        addr: The address to mmap.
        length: The length of the region to mmap.
        prot: The protection to use for the region.
        flags: The flags to use for the mapping.
        fd: The file descriptor to map from.
        offset: The offset to map from.

    Description:
        mmap() maps the specified region of memory in the calling process's address space.
    
    Returns:
        The address of the mapped region, or MAP_FAILED on error.
    """
    return external_call["mmap", UnsafePointer[Int8], UnsafePointer[Int8], Int64, Int32, Int32, Int32, Int64](addr, length, prot, flags, fd, offset)


fn mprotect(addr: UnsafePointer[Int8], length: Int64, prot: Int32) -> Int32:
    """C library <sys/mman.h> function `mprotect`.

    Reference:
        https://man7.org/linux/man-pages/man2/mprotect.2.html
    
    Args:
        addr: The address to mprotect.
        length: The length of the region to mprotect.
        prot: The protection to use for the region.

    Description:
        mprotect() changes the protection of the specified region of memory in the calling process's
        address space.
    
    Returns:
        0 on success, -1 on error.
    """
    return external_call["mprotect", Int32, UnsafePointer[Int8], Int64, Int32](addr, length, prot)


fn msync(addr: UnsafePointer[Int8], length: Int64, flags: Int32) -> Int32:
    """C library <sys/mman.h> function `msync`.

    Reference:
        https://man7.org/linux/man-pages/man2/msync.2.html
    
    Args:
        addr: The address to msync.
        length: The length of the region to msync.
        flags: The flags to use for msync.

    Description:
        msync() flushes changes to the specified region of memory to the underlying storage device.
    
    Returns:
        0 on success, -1 on error.
    """
    return external_call["msync", Int32, UnsafePointer[Int8], Int64, Int32](addr, length, flags)


fn munmap(addr: UnsafePointer[Int8], length: Int64) -> Int32:
    """C library <sys/mman.h> function `munmap`.

    Reference:
        https://man7.org/linux/man-pages/man2/munmap.2.html
    
    Args:
        addr: The address to munmap.
        length: The length of the region to munmap.

    Description:
        munmap() unmaps the specified region of memory from the calling process's address space.
    
    Returns:
        0 on success, -1 on error.
    """
    return external_call["munmap", Int32, UnsafePointer[Int8], Int64](addr, length)


fn shm_open(name: String, oflag: Int32, mode: Int32) -> Int32:
    """C library <sys/mman.h> function `shm_open`.

    Reference:
        https://man7.org/linux/man-pages/man2/shm_open.2.html
    
    Args:
        name: The name of the shared memory object.
        oflag: The flags to use for opening the shared memory object.
        mode: The mode to use for creating the shared memory object.

    Description:
        shm_open() opens a shared memory object.
    
    Returns:
        0 on success, -1 on error.
    """
    return external_call["shm_open", Int32, String, Int32, Int32](name, oflag, mode)


fn shm_unlink(name: String) -> Int32:
    """C library <sys/mman.h> function `shm_unlink`.

    Reference:
        https://man7.org/linux/man-pages/man2/shm_unlink.2.html
    
    Args:
        name: The name of the shared memory object.

    Description:
        shm_unlink() removes a shared memory object.
    
    Returns:
        0 on success, -1 on error.
    """
    return external_call["shm_unlink", Int32, String](name) 


fn remap_file_pages(addr: UnsafePointer[Int8], size: Int64, prot: Int32, pgoff: Int64, flags: Int32) -> Int32:
    """C library <sys/mman.h> function `remap_file_pages`.

    Reference:
        https://man7.org/linux/man-pages/man2/remap_file_pages.2.html
    
    Args:
        addr: The address to remap_file_pages.
        size: The size of the region to remap_file_pages.
        prot: The protection to use for the region.
        pgoff: The offset to remap_file_pages.
        flags: The flags to use for remap_file_pages.

    Description:
        remap_file_pages() changes the mapping of the specified region of a file into the calling
        process's address space.
    
    Returns:
        0 on success, -1 on error.
    """
    return external_call["remap_file_pages", Int32, UnsafePointer[Int8], Int64, Int32, Int64, Int32](addr, size, prot, pgoff, flags)


fn posix_madvise(addr: UnsafePointer[Int8], length: Int64, advice: Int32) -> Int32:
    """C library <sys/mman.h> function `posix_madvise`.

    Reference:
        https://man7.org/linux/man-pages/man2/posix_madvise.2.html
    
    Args:
        addr: The address to posix_madvise.
        length: The length of the region to posix_madvise.
        advice: The advice to use for posix_madvise.

    Description:
        posix_madvise() lets the kernel know if the application is interested in the specified region
        of memory.
    
    Returns:
        0 on success, -1 on error.
    """
    return external_call["posix_madvise", Int32, UnsafePointer[Int8], Int64, Int32](addr, length, advice)
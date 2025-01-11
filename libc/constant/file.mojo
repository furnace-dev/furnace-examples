# -----------------------------------
# author: llango
# email: rontomai@gmail.com
# github: github.com/llango
# ----------------------------------
alias off_t = Int64
alias mode_t = UInt32

alias FM_READ = "r"
alias FM_WRITE = "w"
alias FM_APPEND = "a"
alias FM_BINARY = "b"
alias FM_PLUS = "+"

alias SEEK_SET = 0
alias SEEK_CUR = 1
alias SEEK_END = 2

alias O_RDONLY = 0
alias O_WRONLY = 1
alias O_RDWR = 2
alias O_APPEND = 8
alias O_CREAT = 512
alias O_TRUNC = 1024
alias O_EXCL = 2048
alias O_SYNC = 8192
alias O_NONBLOCK = 16384
alias O_ACCMODE = 3
alias O_CLOEXEC = 524288

# from fcntl.h
alias O_EXEC = -1
alias O_SEARCH = -1
alias O_DIRECTORY = -1
alias O_DSYNC = -1
alias O_NOCTTY = -1
alias O_NOFOLLOW = -1
alias O_RSYNC = -1
alias O_TTY_INIT = -1

alias STDIN_FILENO = 0
alias STDOUT_FILENO = 1
alias STDERR_FILENO = 2

alias F_DUPFD = 0
alias F_GETFD = 1
alias F_SETFD = 2
alias F_GETFL = 3
alias F_SETFL = 4
alias F_GETOWN = 5
alias F_SETOWN = 6
alias F_GETLK = 7
alias F_SETLK = 8
alias F_SETLKW = 9
alias F_RGETLK = 10
alias F_RSETLK = 11
alias F_CNVT = 12
alias F_RSETLKW = 13
alias F_DUPFD_CLOEXEC = 14

# TODO(cristian)
alias FD_CLOEXEC = -1
alias F_RDLCK = -1
alias F_UNLCK = -1
alias F_WRLCK = -1

alias AT_EACCESS = 512
alias AT_FDCWD = -100
alias AT_SYMLINK_NOFOLLOW = 256
alias AT_REMOVEDIR = 512
alias AT_SYMLINK_FOLLOW = 1024
alias AT_NO_AUTOMOUNT = 2048
alias AT_EMPTY_PATH = 4096
alias AT_RECURSIVE = 32768
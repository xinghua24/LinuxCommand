find - search for files in a directory hierarchy

SYNOPSIS
```
find pathname -options [-print -exec -ok ...]
```

# Test
example - search files with name 'python' in /etc
```
# find /etc -name "python"
/etc/python
/etc/apparmor.d/abstractions/python
```

example - search files that starts with name 'python' in /etc
```
# find /etc -name "python*"
/etc/python2.7
/etc/python
/etc/python3
/etc/python3.5
/etc/apparmor.d/abstractions/python
```

example - search all files that has .log extension in current directory. "." means current directory
```
find . -name "*.log"
```

example - search by permission
```
find . -perm 777
```

example - search by type using -type. 'd' for directory. 'f' for regular file.
```
find . -type d  -name "*.log" 

find . -type f  -name "*.log"
```


example - search and sort
```
find . -name "*.log" | sort
```

example - search by size
```
find . -size +90000c -print
```

example - search file access let than a day ago. -atime n returns true if a file was last access n*24 hours ago.
```
find . -type f -atime -1
```

# Action
## -exec command;
Execute command on each matched file; return true if 0 is returned as exit status of command.
All following arguments to find are taken to be arguments to the command until a semicolon(';') is encountered.


```
$ find . -type f -exec ls -l {} \;
-rw-rw-r-- 1 xing xing 415 Dec 30 22:03 ./cp.md
-rw-rw-r-- 1 xing xing 384 Jan  5 01:36 ./whereis.md
-rw-rw-r-- 1 xing xing 678 Jan 12 02:11 ./grep.md
-rw-rw-r-- 1 xing xing 899 Jan  7 20:06 ./locate.md
-rw-rw-r-- 1 xing xing 281 Jan  7 19:10 ./head.md
-rw-rw-r-- 1 xing xing 452 Jan 12 02:04 ./readme.md
-rw-rw-r-- 1 xing xing 396 Dec 30 01:35 ./ls.md
-rw-rw-r-- 1 xing xing 212 Jan  7 19:09 ./tail.md
-rw-rw-r-- 1 xing xing 358 Jan  5 01:14 ./less.md
-rw-rw-r-- 1 xing xing 1016 Jan  2 19:01 ./nl.md
-rw-rw-r-- 1 xing xing 366 Dec 30 01:45 ./rm.md
-rw-rw-r-- 1 xing xing 701 Jan  7 19:32 ./which.md
-rw-rw-r-- 1 xing xing 1141 Jan 13 03:53 ./find.md
-rw-rw-r-- 1 xing xing 24 Dec 30 01:37 ./cd.md
-rw-rw-r-- 1 xing xing 386 Jan  2 19:11 ./more.md
-rw-rw-r-- 1 xing xing 604 Jan  2 19:02 ./cat.md
```
note that you need \ to escapte the laster semicolon(;)

```
find /etc -name "passwd*" -exec grep -n "root" {} \;
```

another option is to use -xargs
```
find -type f | xargs ls -l
```

# -ok command;
Like -exec, but asks the user first. 
```
$ find . -name "*.log" -mtime +1 -ok rm {} \;
< rm ... ./debug (another copy).log > ? y
< rm ... ./debug.log > ? n
```


# -print and -print0 diff
-print: Returns true; prints the full file name on the standard output, followed by a newline. 

-print0: Returns true; prints the full file name on the standard output, followed by a null character (instead of the newline character that -print uses). 

```
$ find . -type f -print
./debug2.log
./debug.log

$ find . -type f -print0
./debug2.log./debug.log
```





find - search for files in a directory hierarchy

SYNOPSIS
```
find pathname -options [-print -exec -ok ...]
```

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
find .  -name "*.log" | sort
```

example - search by size
```
find . -size +90000c -print
```




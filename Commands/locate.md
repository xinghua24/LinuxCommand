locate - find files by pattern.


SYNOPSIS
```
locate [OPTION]... PATTERN...
```

locate  reads  one or more databases prepared by updatedb(8) and writes
file names matching at least one of the PATTERNs  to  standard  output,
one per line.


'locate' and 'updatedb' are the front runners in searching for the existence of any file on a Linux system.

In order to operate efficiently, 'locate' uses a database 'udpatedb' rather than hunting individual directory
 paths. To update udpatedb, execte *udpatedb*. you need admin permission to run *updatedb*.


Option<br>
-i, --ignore-case ==> ignore case
-l, --limit, -n LIMIT ==> exit successfully after finding LIMIT entries.


<br>

example - find all the files has pattern camel/spel
```
$ locate -i camel/spel
```


example - find files under /etc directory that starts with sh
```
$ locate /etc/sh
/etc/shadow
/etc/shadow-
/etc/shells
```






which - locate a command


SYNOPSIS
```
which filename ...
```

which returns the pathnames of the files (or links) which would be executed in the current environment


OPTIONS<br>
-a  ==>   print all matching pathnames of each argument

Example
```
$ which -a adduser
/usr/sbin/adduser
```

note that cd *which cd* return nothing because cd is internal command to bash

## which/whereis differences 
whereis searches for "possibly useful" files, while which only searches for executables.

```
$ which ls
/bin/ls

$ whereis ls
ls: /bin/ls /usr/share/man/man1/ls.1.gz
```

which is very useful, specially in scripts. which is the answer for the following question: Where does this command come from?


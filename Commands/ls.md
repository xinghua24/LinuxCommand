ls - list directory contents


most common option is -a(--all), -l

other options
- -r ==> reversal
- -R recursive ==> list subdirectories
- -l ==> use a long listing format
- -s(--size) ==> print the allocated size of each file, in clocks
- -i, --inode ==> prints inode
- -h, --human-readable ==> with -l and/or -s, print human readable sizes(e.g. 1K 234M 2 G)
to see help page, type 'man ls'. This command is in section 1(ser commands)
can also use *ls --help* to get help

what is inode?
An inode is a data structure on a filesystem on Linux and other Unix-like operating 
systems that stores all the information about a file except its name and its actual data. 


example ls -l 
```
$ ls -l
total 112
drwxrwxr-x 2 xing xing  4096 Jan 14 10:52 Commands
-rw-rw-r-- 1 xing xing 85472 Jan 16 02:26 linux-directory-structure.jpg
-rw-rw-r-- 1 xing xing  3847 Jan 17 01:47 Linux-Directory-Structure.md
drwxrwxr-x 3 xing xing  4096 Jan  2 18:24 MyFolder
-rw-rw-r-- 1 xing xing  7088 Dec  8 04:33 readme.md
-rwxrwxr-x 1 xing xing   104 Nov 22 13:10 test.sh
```

ls -l displays file type, number of hard links point to this file, owner, user group, file size in bytes, last access time, file name or directory name

example ls -lh to show human readable sizes
```
$ ls -lh
total 112K
drwxrwxr-x 2 xing xing 4.0K Jan 14 10:52 Commands
-rw-rw-r-- 1 xing xing  84K Jan 16 02:26 linux-directory-structure.jpg
-rw-rw-r-- 1 xing xing 3.8K Jan 17 01:47 Linux-Directory-Structure.md
drwxrwxr-x 3 xing xing 4.0K Jan  2 18:24 MyFolder
-rw-rw-r-- 1 xing xing 7.0K Dec  8 04:33 readme.md
-rwxrwxr-x 1 xing xing  104 Nov 22 13:10 test.sh
```


example - ls with inode
```
$ ls -i
6689698 Commands
4988988 linux-directory-structure.jpg
6161906 Linux-Directory-Structure.md
7079218 MyFolder
6161896 readme.md
6164188 test.sh
```


Online Man page - [https://linux.die.net/man/1/ls](https://linux.die.net/man/1/ls)


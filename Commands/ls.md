ls - list directory contents


most common option is -a(--all), -l

other options
- -a ==> show hidden file
- -r ==> reversal
- -R ==> recursive, list subdirectories
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

example - sort by date
```
$ ls -lt
total 64
-rw-rw-r-- 1 xing xing 1921 Jan 19 03:51 ls.md
-rw-rw-r-- 1 xing xing 2888 Jan 14 10:52 find.md
-rw-rw-r-- 1 xing xing  678 Jan 12 02:11 grep.md
-rw-rw-r-- 1 xing xing  452 Jan 12 02:04 readme.md
-rw-rw-r-- 1 xing xing  899 Jan  7 20:06 locate.md
-rw-rw-r-- 1 xing xing  701 Jan  7 19:32 which.md
```

example - ls only config file
```
$ ls -l /etc/dhcp/*.conf
-rw-r--r-- 1 root root 1735 Jan 13  2016 /etc/dhcp/dhclient.conf
```

example - list files and directories with full path
```
$ ls -l -d $PWD/*
-rw-rw-r-- 1 xing xing  604 Jan  2 19:02 /home/xing/Documents/STSWorkspaces/LinuxCommand/Commands/cat.md
-rw-rw-r-- 1 xing xing   24 Dec 30 01:37 /home/xing/Documents/STSWorkspaces/LinuxCommand/Commands/cd.md
-rw-rw-r-- 1 xing xing  415 Dec 30 22:03 /home/xing/Documents/STSWorkspaces/LinuxCommand/Commands/cp.md
-rw-rw-r-- 1 xing xing 2888 Jan 14 10:52 /home/xing/Documents/STSWorkspaces/LinuxCommand/Commands/find.md
-rw-rw-r-- 1 xing xing  678 Jan 12 02:11 /home/xing/Documents/STSWorkspaces/LinuxCommand/Commands/grep.md
```


Online Man page - [https://linux.die.net/man/1/ls](https://linux.die.net/man/1/ls)


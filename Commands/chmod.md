chmod - change file mode bits

SYNOPSIS
- chmod [OPTION]... MODE[,MODE]... FILE...
- chmod [OPTION]... OCTAL-MODE FILE...
- chmod [OPTION]... --reference=RFILE FILE...

It can be simplified as
- chmod [OPTION] [who] [+|-|=] [mode] FILE
- chmod [OPTION] [octal-mode] FILE

options
- -c, --changes ==> like verbose but report only when a change is made
- -f, --silent, --quiet ==> suppress most error messages
- -R, --recursive 
- -v, --verbose

<br>
permission
- read(r), numeric equivalent is 4
- write(w), numeric equivalent is 2
- execute(x), numeric equivalent is 1

so rwx is 4 + 2 + 1 = 7 and rw- is 4 + 2 = 6

group
- user(u), the actual owner of the file
- group(g), users in the file's group
- others(o), other users not in the file's group
- all(a), all users

mode bit example
```
-rw-rw-r-- 1 xing xing    0 Jan 19 04:31 script.sh
```
It means owner xing can read/write, group xing can read/write

example - add execution(x) permission to user
```
$ chmod -v u+x script.sh 
mode of 'script.sh' changed from 0664 (rw-rw-r--) to 0764 (rwxrw-r--)

$ ls -l script.sh 
-rwxrw-r-- 1 xing xing 0 Jan 19 04:31 script.sh
```

example - add execution(x) permission to user and group
```
$ chmod -v ug+x script.sh 
mode of 'script.sh' changed from 0764 (rwxrw-r--) to 0774 (rwxrwxr--)

$ ls -l script.sh 
-rwxrwxr-- 1 xing xing 0 Jan 19 04:31 script.sh
```

example - remove execution(x) permission from group
```
$ chmod -v g-x script.sh 
mode of 'script.sh' changed from 0774 (rwxrwxr--) to 0764 (rwxrw-r--)
```

example - add execution(x) permission to all(user, group and others)
```
$ chmod -v a+x script.sh 
mode of 'script.sh' changed from 0764 (rwxrw-r--) to 0775 (rwxrwxr-x)
```

example - change permission using octal bit
```
$ chmod -v 744 script.sh 
mode of 'script.sh' changed from 0775 (rwxrwxr-x) to 0744 (rwxr--r--)
```



Reference
- [https://www.linux.com/learn/getting-know-linux-file-permissions](https://www.linux.com/learn/getting-know-linux-file-permissions)



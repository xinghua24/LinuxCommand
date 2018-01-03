cat - concatenate files and print on the standard output

synopsis
```
cat [OPTION]... [FILE]...
```

## Option
**-n, --number** <br>
number all output lines

use here doc to generate file
```
[root@localhost test]# cat >log.txt <<EOF
> Hello
> World
> Linux
> PWD=$(pwd)
> EOF
[root@localhost test]# ls -l log.txt 
-rw-r--r-- 1 root root 37 10-28 17:07 log.txt
[root@localhost test]# cat log.txt 
Hello
World
Linux
PWD=/opt/soft/test
[root@localhost test]#
```


tac command - concatenate and print files in reverse


Online man page - [https://linux.die.net/man/1/cat](https://linux.die.net/man/1/cat)

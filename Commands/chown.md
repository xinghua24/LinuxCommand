chown - change file owner and group

Synopsis
```
chown [OPTION]... [OWNER][:[GROUP]] FILE...
```

option 
- -v, --verbose output a diagonostic for every file processed
- -R, -recursive


example
```
$ ls -l log.txt 
-rw-r--r-- 1 root root 5726 Jan 21 02:27 log.txt

$ sudo chown -v xing:root log.txt 
changed ownership of 'log.txt' from root:root to xing:root

$ ls -l log.txt 
-rw-r--r-- 1 xing root 5726 Jan 21 02:27 log.txt
```





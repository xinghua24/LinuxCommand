chgrp - change group ownership. the group must exist in /etc/group

**options**<br>
- -R, --recursiveoperate on files and directories recursively
- --reference=RFILE
- -v, --verbose

example - change group of a file
```
$ ls -l log.txt 
-rw-r--r-- 1 root root 5726 Jan 21 02:27 log.txt

$ sudo chgrp -v xing log.txt 
changed group of 'log.txt' from root to xing

$ ls -l log.txt 
-rw-r--r-- 1 root xing 5726 Jan 21 02:27 log.txt
```

example - change group using a reference file
```
sudo chgrp --reference=log.txt log2.txt
```

example - change group in a folder
```
sudo chgrp -R bin folder1
```



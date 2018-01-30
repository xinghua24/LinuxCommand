du - estimate file space usage

option 
-h ==> human readable
-H ==> human readable, measure in 1000
-s ==> only show summary
-a ==> all, show counts for files, not just directories

example
```
$ du -h log.txt 
8.0K	log.txt
```

Normally du will recusively search all folders. to only show depth =1 
```
du -h --max-depth=1
```
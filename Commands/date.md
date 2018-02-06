date - print or set the system date and time

option
-   -d, --date=STRING ===> display time described by STRING, not 'now'

```
$ date -d 'nov 22'
Thu Nov 22 00:00:00 EST 2018

$ date -d next-day
Wed Feb  7 02:14:09 EST 2018
```

formatting example - only show month and day
```
$ date +'%b %d'
Feb 06
```

formatting example - show all
```
$ date +'%Y-%m-%d %k:%M:%S %Z'
2018-02-06  2:18:42 EST

$ date +'%b %d %y %k:%M:%S %Z'
Feb 06 18  2:19:41 EST
```

formatting example - combine with -d option
```
$ date -d next-day +'%b %d %y %k:%M:%S %Z'
Feb 07 18  2:20:30 EST
```




ln - make links between files. link can be soft link or hard link. soft link is like shortcut
in windows. Hard link is like a pointer.

Option
- -s, --symbolic ==> make symbolic links instead of hard links

creating symbolic links log2018SLink for log2018
```
$ln -s log2018 log2018SLink

$ ll log2018*
-rw-rw-r-- 1 xing xing 4 Feb  1 02:44 log2018
lrwxrwxrwx 1 xing xing 7 Feb  1 02:52 log2018SLink -> log2018
```

create hard link log2018HLink for log2018. notice hard link and original file are
the same. The have the same inode.
```
$ ln log2018 log2018HLink

ll -i log2018*
7084280 -rw-rw-r-- 2 xing xing 4 Feb  1 02:44 log2018
7084280 -rw-rw-r-- 2 xing xing 4 Feb  1 02:44 log2018HLink
7084286 lrwxrwxrwx 1 xing xing 7 Feb  1 02:52 log2018SLink -> log2018
```



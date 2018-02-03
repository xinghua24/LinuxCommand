diff - compare files line by line

option
- -y, --side-by-side ===> output in two columns
- -w, --ignore-all-space ===> ignore all space
- -W,--width ===>　output at most NUM (default 130) print columns

diff two files side by side, with width = 100
```
diff file1.txt file2.txt -y -W 100
```
grep, which stands for "global regular expression print," processes text line by line and prints any lines which match a specified pattern.


grep [OPTIONS] PATTERN [FILE...]

Options
- -i ==> case insensitive
- -n ==> print line number 
- -r ==> recursive

[Online reference](https://www.computerhope.com/unix/ugrep.htm)


example - search for "find" in readme.md
```
$ grep -n "find" readme.md 
14:- [locate](locate.md) - find files by pattern in update.db
15:- [find](find.md) - search for files in a directory hierarchy
```


example - search using Regular Expression. "." interpreted as a single-character wildcard. "*" means zeror or more
```
grep -n "search.*file" *
```

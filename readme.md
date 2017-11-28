Resources:
* [http://linuxcommand.org/index.php](http://linuxcommand.org/index.php)

Basics
=====================================================
A shell script typically begins with a shebang:
```bash
#!/bin/bash
```

to execute a bash script file
```bash
bash myScript.sh

chmod 755 myScript.sh
./myScript.sh
```

Read from command line
```bash
#!/bin/bash
read -p "Please enter a value: " val
echo "The value you enter is $val"
```
print format
```bash
#!/bin/bash
printf "%-5s %-10s %-4s\n" No Name Mark
printf "%-5s %-10s %-4.2f\n" 1 Sarath 80.3456
printf "%-5s %-10s %-4.2f\n" 2 James 90.9989
printf "%-5s %-10s %-4.2f\n" 3 Jeff 77.564
```


<br>

**using variables** - variables can be accessed by prefixing variable name with dollar sign($).
you may also use ${var}
```bash
#!/bin/bash
fruit=apple
count=5
echo "We have $count ${fruit}(s)"
```
use ${#var} to get the length of a variable's value.

<br>

Environment Variables are variables used to stored special values. usually defined using Upper case letters.
Common variables are HOME, PWD, USER, UID, SHELL, PATH etc.



Quotes
=====================================================
**Single Quotes vs Double Quotes:**<br>
Single quotes won't interpolate anything. Double quote will(e.g variables, backticks, certain \ escapes, etc...)

**Double Quotes**<br>
The backslash retains its special meaning only when followed by one of the following characters: $, backtick, ", \, or newline.

-e option will enable interpretation of backslash escapes. see *man echo* for details
```bash
#!/bin/bash
foo="FOO"
echo 'single quotes gives you $foo'  # $foo
echo "double quotes give you $foo" # foo

# Use backslash for escape
echo "\$" # $
echo "\`" # `
echo "\"" # "
echo "\\" # \
echo "abc\
de" # abcde

# escape for \t\n
echo "\t\n" # \t\n note  \t and \n have no special meaning inside ""
echo -e "\t\n" # the correct way to escape for \t and \n
```



Control Statement
=====================================================
## If Statement
**-z string** returns True if the string is null (an empty string). see *man test*
```bash
#!/bin/sh
if [ -z $1 ]; then
  echo "usage - test.sh val1"
fi
```
<br>

If...else...
```bash
#!/bin/sh
if ! [ -z $1 ]
then
  echo "value 1 = $1"
else
  echo "usage - test.sh val1"
fi
```
<br>

If...elif...else <br>
**-d FILE** returns true if FILE exists and is a directory.
**-f FILE** returns true if FILE exists and is a regular file. see *man test*
```bash
#!/bin/bash
if [ -d $1 ]; then
  echo "$1 is a directory"
elif [ -f $1 ]; then
  echo "$1 is a file"
else
  echo $1 is not a file, nor a directory
fi
```
<br>

Test equality
```bash
#!/bin/bash
T1="foo"
T2="bar"
if [ "$T1" = "$T2" ]; then
  echo expression evaluated as true
else
  echo expression evaluated as false
fi
```


## Iteration Statement
Use for loop to traverse files in a folder
```bash
#!/bin/bash
myFolder="MyFolder/*.txt"
for file in $myFolder
do
  echo "$file content:"
  cat $file
done
```


Command Substitution
===========================================
Syntax - recommended is $(). Backquote is deprecated.
```bash
$(command)
`command`
```

example
```
echo $(date +%m/%d/%y)

touch file-$(date +%y-%m-%d).txt
```


sed
===================================================
Sed is the ultimate stream editor. It performs editing operations from standard input or a file.
The most well-known use for sed is substituting text.
Tutorial:
* [Sed Basic](https://www.digitalocean.com/community/tutorials/the-basics-of-using-the-sed-stream-editor-to-manipulate-text-in-linux#basic-usage)
* [Sed Intro](http://www.grymoire.com/Unix/Sed.html)

Basic usage
```bash
sed [options] commands [file-to-edit]
echo ""
```

Sed example
```bash
# print the input as result. '' does not contain any operation.
sed '' file

# Substitution. 's' is for substitute command. 'g' for global. without g only the first instance is substituted
# syntax 's|old_word|new_word/' 's/old_word/new_word/'
input=ABC-DEF-GHI
echo $input | sed 's|-|---|g' # ABC---DEF---GHI
echo $input | sed 's/-/---/g' # ABC---DEF---GHI
echo $input | sed 's|-||g' # ABCDEFGHI
echo $input | sed 's/-//g' # ABCDEFGHI

# combine multiple commands with -e
echo $input | sed -e 's|-|---|g' -e 's|DEF|def|g' # ABC---def---GHI

# in place replace with -i
sed -i 's|old_word|new_word|g' inputFile

# matching pattern
sed 's/^PATTERN/REPLACED/' inputFile

# no print
# -n option tells sed to not print unless explicitly request to print
# the long command for -n command is --quiet or --silent
sed -n '' inputFile # no output.
sed -n '1p' inputFile # print 1st line
sed -n '1,4p' inputFile # print 1st to 4th line


# Special characters $.*[\]^
# Reference: https://unix.stackexchange.com/questions/32907/what-characters-do-i-need-to-escape-when-using-sed-in-a-sh-script
input="ABC\$DEF"
echo $input | sed 's|\$|\$\$\$|g'
input="ABC.DEF"
echo $input | sed "s|\.|\.\.\.|g"
input="ABC\\DEF"
echo $input | sed 's|\\|\\\\|g'

```

## AWK
AWK can solve complex text processing tasks with a few lines of code. 
By default AWK execute commands on every line. We can restrict this by providing patterns.

Basic syntax
```bash
# awk [options] file
awk '{print}' marks.txt # to display the content of a file marks.txt
```

marks.txt
```
1) Amit     Physics   80
2) Rahul    Maths     90
3) Shyam    Biology   87
4) Kedar    English   85
5) Hari     History   89
```

run with a command file. command.txt has content {print}
```bash
awk -f command.txt marks.txt
```

To print certain columns. $0 represent the whole line
```bash
# print column 3 and column 4
awk '{print $3 "\t" $4}' marks.txt
```

## Other Commands
basename - return filename or directory portion of pathname
```bash
basename "foo/bar/abc.txt"  # "abc.txt"
```

Reference:
* [AWK Tutorial](https://www.tutorialspoint.com/awk/index.htm)
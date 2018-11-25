**Table Of Content**
<!-- TOC -->

- [Basics](#basics)
- [Quotes](#quotes)
- [Reading User input](#reading-user-input)
- [String](#string)
    - [String concatenation](#string-concatenation)
    - [String Manipulation](#string-manipulation)
    - [String Equal and Contain](#string-equal-and-contain)
    - [Here Docs](#here-docs)
- [Control Statement](#control-statement)
    - [If Statement](#if-statement)
    - [Iteration Statement](#iteration-statement)
        - [break and continue statement](#break-and-continue-statement)
- [Command Substitution](#command-substitution)
- [echo Command](#echo-command)
    - [-e option](#e-option)
    - [echo Newline problem](#echo-newline-problem)
- [Sed](#sed)
- [AWK](#awk)
    - [AWK function](#awk-function)
    - [Conditional](#conditional)
- [Set Command](#set-command)
- [Misc](#misc)
- [Snippes](#snippes)
    - [Write to file](#write-to-file)
    - [Append to file](#append-to-file)
    - [Read a file line by line](#read-a-file-line-by-line)
    - [Read file content](#read-file-content)
    - [Check directory not exist](#check-directory-not-exist)

<!-- /TOC -->

Utility: 
* [Execute Bash Online](https://www.tutorialspoint.com/execute_bash_online.php)

Resources:
* [Linux Command](http://linuxcommand.org/index.php)
* [Book - Bash Guide for Beginners](https://www.tldp.org/LDP/Bash-Beginners-Guide/html/)
* [Advanced Bash-Scripting Guide](http://www.tldp.org/LDP/abs/html/index.html)
* [Bash Reference Manual](https://www.gnu.org/software/bash/manual/html_node/index.html#SEC_Contents)
To Run Bash in Windows OS, install Git. Use Git Bash to run bash code.

# Basics
A shell script typically begins with a shebang:
```bash
#!/bin/sh
```

Bourne shell usually starts with `#!/bin/sh`. It is oldest. Bash shell script starts with `#!/bin/bash`. 
Bash stands for "Bourne Again SHell". It is a replacement/improvement of original Bourne shell(sh).

/bin/sh might be a link to ash, bash, dash, ksh, zsh, etc.

As long as you stick to sh features only, you can (and probably even should) use #!/bin/sh and the script should work fine, no matter which shell it is.

You should use #!/usr/bin/env bash for portability: different *nixes put bash in different places, 
and using /usr/bin/env is a workaround to run the first bash found on the PATH

Using a shebang line to invoke the appropriate interpreter is not just for BASH. 
You can use the shebang for any interpreted language on your system such as Perl, Python, PHP (CLI) and many others.

shebang can also used for other languages
```
#!/usr/bin/env perl
```


* [Bash Shebang](https://stackoverflow.com/questions/10376206/what-is-the-preferred-bash-shebang)
* [Quora diff between Shell and Bash](https://www.quora.com/What-is-the-difference-between-Shell-scripting-and-Bash-Shell-scripting)

to execute a bash script file
```sh
bash myScript.sh

chmod 755 myScript.sh
./myScript.sh
```

Read from command line
```sh
#!/bin/bash
read -p "Please enter a value: " val
echo "The value you enter is $val"
```
print format
```sh
#!/bin/bash
printf "%-5s %-10s %-4s\n" No Name Mark
printf "%-5s %-10s %-4.2f\n" 1 Sarath 80.3456
printf "%-5s %-10s %-4.2f\n" 2 James 90.9989
printf "%-5s %-10s %-4.2f\n" 3 Jeff 77.564
```


<br>

**using variables** - variables can be accessed by prefixing variable name with dollar sign($).
you may also use ${var}
```sh
#!/bin/bash
fruit=apple
count=5
echo "We have $count ${fruit}(s)"
```
use ${#var} to get the length of a variable's value.

<br>

Environment Variables are variables used to stored special values. usually defined using Upper case letters.
Common variables are HOME, PWD, USER, UID, SHELL, PATH etc.



# Quotes

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


# Reading User input
reading from input
```sh
# withInput.sh file
read -p "username: " username
read -sp "password: " password
echo $username
echo $password
```

To provide inputs from stdin, you can pipe to a bash file if there is only one input. For multiline input, use
here-docs.
```sh
echo 'This string will be piped to stdin.' | /my/bash/script

/my/bash/script <<STDIN 
value1
value2
STDIN
```


# String
## String concatenation
```bash
str1="Hello"
str2="World"
echo "$str1$str2"
```

you can you +=, but it is less portable. it require bash > 3.1

Reference: 
* [Stackoverflow](https://stackoverflow.com/questions/14325722/concatenating-variables-in-bash)

## String Manipulation
String Length
```bash
stringZ=abcABC123ABCabc
echo ${#stringZ}   # 15
echo `expr length $stringZ`  # 15
```

Substring, format is ${string:position} or ${string:position:length}
```bash
stringZ=abcABC123ABCabc
echo ${stringZ:5}    # C123ABCabc
echo ${stringZ:2:3}    # cAB
```

Substring Replacement for 1st match: ${string/substring/replacement} <br>
Substring Replacement for all match: ${string//substring/replacement}
```bash
stringZ=abcABC123ABCabc
echo ${stringZ/abc/xyz} # Replaces first match of 'abc' with 'xyz'.
echo ${stringZ//abc/xyz}  # Replaces all matches of 'abc' with 'xyz'.
```


Reference:
* [For more, see Manipulating Strings Guide](https://www.tldp.org/LDP/abs/html/string-manipulation.html)


## String Equal and Contain
check if two strings are the equal
```bash
str="abc"
if [[ "abc" == "$str" ]]; then
    echo "same!"
fi
```

check a substring can be found
```bash
searchStr="ef"
if [[ "abcdefg" =~ "$searchStr" ]]; then
    echo "found!"
fi
```

## Here Docs
A here document is a block of text or code which is redirected to an interactive program or a command.
```sh
#!/bin/bash
Command <<MyUniqueLimitString
some text
some more text 
MyUniqueLimitString
```

Reference 
* [Here Docs](https://ss64.com/bash/syntax-here.html)
* [Bash Tutorial - User Input](https://ryanstutorials.net/bash-scripting-tutorial/bash-input.php#summary)
* [Send String to stdin](https://stackoverflow.com/questions/6541109/send-string-to-stdin)

# Control Statement

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
T1="bar"
if [ $T1 = "bar" ]; then
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

To read each line using while
```bash
while read line; do
    echo $line
done < input.txt
```

### break and continue statement
break demo
```bash
while read line; do
    if [[ "$line" =~ "########" ]]; then
        break
    fi
    echo "$line"
done < $input
```

continue demo
```bash
input="/etc/hosts"
while read line; do
    if [[ "$line" =~ ""########"" ]]; then
        continue
    fi
    echo "$line"
done < $input
```

# Command Substitution
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

# echo Command
## -e option
-e enable interpretation of backslash escapes
  If -e is in effect, the following sequences are recognized:
* \\\\     backslash
* \a     alert (BEL)
* \b     backspace
* \c     produce no further output
* \e     escape
* \f     form feed
* \n     new line
* \r     carriage return
* \t     horizontal tab
* \v     vertical tab

## echo Newline problem
IFS = Internal Field Separators. during the blank interpretation phase, spaces, tabs and newlines are interpreted as separators between words

see details in [stackoverflow - File content into unix variable with newlines](https://stackoverflow.com/questions/2789319/file-content-into-unix-variable-with-newlines)
```sh
content=$(cat test.txt)
echo $content
```

to fix, add double quotes
```sh
content=$(cat test.txt)
echo "$content"
```

# Sed
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

# in place replace with -i, very useful to substitute string in file
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

# AWK
AWK can solve complex text processing tasks with a few lines of code. 
By default AWK execute commands on every line. We can restrict this by providing patterns.

Tutorial: [Ruanyifeng awk 入门教程](http://www.ruanyifeng.com/blog/2018/11/awk.html)


Basic syntax
```bash
# awk [options] file
awk '{print}' input.txt # to display the content of a file input.txt
```

awk use space and tabs to separate each line into columns.

```bash
echo -e 'hello foo bar' > demo.txt
awk '{ print $0 }' demo.txt # hello foo bar
awk '{ print $1 }' demo.txt # hello
awk '{ print $2 }' demo.txt # foo
awk '{ print $3 }' demo.txt # bar
```


To print using a different separator, use `-F` flag. Here the separator is :. $0 represent the whole line. $1, $2, $3... represent the columes.
```bash
$ echo -e 'a:b:c\nd:e:f' > demo.txt
$ awk -F ':' '{ print $0}' demo.txt # prints the input, a:b:c and d:e:f
$ awk -F ':' '{ print $1}' demo.txt # prints 1st column, a and d
$ awk -F ':' '{ print $2}' demo.txt # prints 2nd column, b and e
```

## AWK function
awk provides build in functions

common functions
* tolower()
* length()
* substr()
* sin()
* cos()
* sqrt()
* rand()

```bash
echo -e 'hello foo\nhi bar' > demo.txt
awk '{ print toupper($1) }' demo.txt # HELLO
```

see [build-in functions reference](https://www.gnu.org/software/gawk/manual/html_node/Built_002din.html#Built_002din)

## Conditional

syntax
```bash
awk 'condition action' filename
```

```bash
$ echo -e 'hello:foo\nhi:bar' > demo.txt
$ awk -F ':' '$1 == "hi" {print $0}' demo.txt # print only if 1st column equals "h1"
```


# Set Command
Set command is very useful for debugging and maintainance of script.

set allows you to change the values of shell options and set the positional parameters, or to display the names and values of shell variables.

- **nounset**  Same as -u. Treat unset variables and parameters other than the special parameters ‘@’ or ‘*’ as an error when performing parameter expansion.
- **errexit** Same as -e. exit immediately if command fail(not return 0)
- **pipefail** return 0 only when all commands in the pipeline exit successfully

```sh
set -o errexit
set -o nounset
set -o pipefail
```

Reference
- [Set Reference](https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html)
- [ruanyifeng.com Set Command](http://www.ruanyifeng.com/blog/2017/11/bash-set.html)

# Misc
**dot(.) or source command**<br>
Dot means source the input file. 
[meaning of dot command](https://unix.stackexchange.com/questions/114300/whats-the-meaning-of-a-dot-before-a-command-in-shell)

basename - return filename or directory portion of pathname
```bash
basename "foo/bar/abc.txt"  # "abc.txt"
```


To check return value from a command, 0 means success
```bash
echo $?
```

Reference:
* [AWK Tutorial](https://www.tutorialspoint.com/awk/index.htm)


# Snippes
## Write to file
```sh
echo "hello world" > file
```

## Append to file
```sh
echo "hello world" >> file
```


## Read a file line by line
```sh
input="/home/xing/Desktop/file.txt"
while read line; do
    echo $line
done < $input
```


## Read file content
```bash
content=$(cat test.txt)
```
or
```bash
content=$( < "/home/xing/Desktop/file.txt" )
echo $content
```



## Check directory not exist
if directory not exist, create it
```bash
if [ ! -d "dirname" ]; then
    mkdir dirname
fi
```

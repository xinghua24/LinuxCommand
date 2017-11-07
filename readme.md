Resources:
* [http://linuxcommand.org/index.php](http://linuxcommand.org/index.php)

# Basics
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

# Quotes
**Single Quotes vs Double Quotes:**<br>
Single quotes won't interpolate anything. Double quote will(e.g variables, backticks, certain \ escapes, etc...)

**Double Quotes**<br>
The backslash retains its special meaning only when followed by one of the following characters: $, backtick, ", \, or newline.
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
<br>

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
T1="foo"
T2="bar"
if [ "$T1" = "$T2" ]; then
  echo expression evaluated as true
else
  echo expression evaluated as false
fi
```

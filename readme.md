Resources:
* [http://linuxcommand.org/index.php](http://linuxcommand.org/index.php)

# Basics
A shell script typically begins with a shebang:
```bash
#!/bin/bash
```

to execute
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

# Control Statement
## If Statement
**-z string** returns True if the string is null (an empty string). see *man test*
```bash
#!/bin/sh
if [ -z $1 ]
else
  echo "usage - test.sh val1"
fi
```

```bash
#!/bin/sh
if ! [ -z $1 ]
then
  echo "value 1 = $1"
else
  echo "usage - test.sh val1"
fi
```
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

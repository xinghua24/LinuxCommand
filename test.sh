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

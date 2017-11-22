#!/bin/bash
myFolder="MyFolder/*.txt"
for file in $myFolder
do
  echo "$file content:"
  cat $file
done

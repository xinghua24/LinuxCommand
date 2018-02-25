# zip
to zip folders, need to add -r option

```sh
zip archive.zip foo bar
unzip archive.zip

# to zip a folder and a file
```
$ zip -r myzip.zip folder1 foo
```

view files using zipinfo. add -1 to show filenames only
```
$ zipinfo  myzip.zip 
Archive:  myzip.zip
Zip file size: 2768 bytes, number of entries: 4
drwxrwxr-x  3.0 unx        0 bx stor 17-Dec-30 21:49 folder1/
-rw-rw-r--  3.0 unx       14 tx stor 17-Nov-22 12:58 folder1/file2.txt
-rw-rw-r--  3.0 unx       14 tx stor 17-Nov-22 12:58 folder1/file1.txt
-rw-rw-r--  3.0 unx     5726 tx defN 18-Jan-20 00:19 foo
4 files, 5754 bytes uncompressed, 2144 bytes compressed:  62.7%



$ zipinfo -1 myzip.zip 
folder1/
folder1/file2.txt
folder1/file1.txt
foo
```



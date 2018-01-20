tar — The GNU version of the tar archiving utility. Tar only does not do compression

**Function Letters**<br>
- -c, --create ==> create a new archive
- -f, --file ARCHIVE ==> use archive file or device ARCHIVE
- -t, --list ==> list the contents of an archive
- -x, --extract, --get ==> extract files from an archive

**Other options**<br>
- -v, --verbose
- -j, --bzip2
- -z, --gzip
- --gunzip, --ungzip
- -Z, --compress
- --uncompress

**EXAMPLES**<br>
Create archive.tar from files foo and bar.
```
tar -cvf archive.tar foo bar
```

List all files in archive.tar verbosely.
```
tar -tvf archive.tar
```

Extract all files from archive.tar.
```
tar -xvf archive.tar
```

create archive.tar.gz, archive.tar.bz2 from files foo and bar.
```
tar -zcvf archive.tar.gz foo bar
tar -xvf archive.tar.gz foo bar
```

create archive.tar.gz, archive.tar.bz2 from files foo and bar.
```
tar -jcvf archive.tar.bz2 foo bar
tar -xvf archive.tar.bz2 foo bar
```

only uncompress foo file
```
tar -xvf archive.tar.gz foo
```

**Other formats**<br>
zip
```
zip archive.zip foo bar
unzip archive.zip
```





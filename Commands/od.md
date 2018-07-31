od - dump files in octal and other formats

Options 
* -t select the output format. Common format is -c and -x1 

To display using hex format 1 byte units. Useful for text file, ascii or UTF-8.
```
od -t x1 file
```

To display using hex format 2 byte units
```
od -t x2 file
```

To display character and hex together 
```
```od -t x1 -t c file
```

also see xxd command for hex dump
```
xxd file 
```

Reference
* [od command](https://www.thegeekstuff.com/2012/08/od-command/)
Usage: nl [OPTION]... [FILE]...

Write each FILE to standard output, with line numbers added.

With no FILE, or when FILE is -, read standard input.

## Option
**-b, --body-numbering=STYLE** <br>
use STYLE for numbering body lines <br>
- -b a --> number all lines <br>
- -b t --> number only nonempty lines <br>


**-n, --number-format=FORMAT** <br>
insert line numbers according to FORMAT <br>
- -n ln  -->   left justified, no leading zeros <br>
- -n rn  -->  right justified, no leading zeros <br>
- -n rz  -->   right justified, leading zeros <br>

**-w, --number-width=NUMBER**<br>
use NUMBER columns for line numbers <br>

**-p, --no-renumber**<br>
do not reset line numbers at logical pages <br>



```
$ nl file
     1	ABCD
       
     2	DEF
       
     3	GH
```

```
$ nl -b a file
     1	
     2	ABCD
     3	
     4	DEF
     5	
     6	GH

```

```
$ nl -b a -n rz file
000001	
000002	ABCD
000003	
000004	DEF
000005	
000006	GH
```

```
$ nl -b a -n rz -w 3  file
001	
002	ABCD
003	
004	DEF
005	
006	GH
```
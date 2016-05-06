# fileMulti2TableMod2

Lets say you have multiple files with the same first column and you want to merge them. Use this awk script **fileMulti2TableMod1**. All files will be compared to the rows from 1st column of the 1st file. If one of the files has a missing value(s) even though they contain the correct element in first column, rows with missing values are not excluded but missing values are set to NA. Rows that appear **once** in one but not the other files are shown with all other values set to NA. Rows that appear **twice or more** are excluded, therefore the script is yet to be improved. See example. 

# Usage
<pre>
awk -f fileMulti2TableMod2.awk 1.test 2.test 3.test 4.test 5.test 6.test
</pre>

# Example

<pre>
DN52ei1f:~ milospjanic$ cat 1.test 
mail	5
now	7
tomorrow	7
string	5
do	6
comeon	45
work	455
mondo	3
bike	56
DN52ei1f:~ milospjanic$ cat 2.test 
mail	4
now	4
test	56
tomorrow	4
string	4
do	4
dodo	0101
DN52ei1f:~ milospjanic$ cat 3.test 
mail	6
now	6
tomorrow	7
string	5
do	67
ubas	5889
dodo	456789
dove	67
blis	4499
fry	456	
DN52ei1f:~ milospjanic$ cat 4.test 
mail	89
blab	5
now	75
tomorrow	75
string	
do	555
DN52ei1f:~ milospjanic$ cat 5.test 
do	456
now	567
string
DN52ei1f:~ milospjanic$ cat 6.test 
do	456
now	
string

DN52ei1f:~ milospjanic$ awk -f fileMulti2TableMod2.awk 1.test 2.test 3.test 4.test 5.test 6.test 
blab  NA NA NA 5 NA NA
mondo 3 NA NA NA NA NA
comeon 45 NA NA NA NA NA
do 6 4 67 555 456 456
now 7 4 6 75 567  NA
blis  NA NA 4499 NA NA NA
fry  NA NA 456 NA NA NA
dove  NA NA 67 NA NA NA
bike 56 NA NA NA NA NA
work 455 NA NA NA NA NA
string 5 4 5  NA  NA  NA
ubas  NA NA 5889 NA NA NA
test  NA 56 NA NA NA NA

# Read first file and put first column into hash table h1 and second column into hash h2 with keys from first column 

NR==FNR { h1[$1] = $1; h2[$1] = $2; c1=1;next;}

# Run counter c1 that corresponds to new each subsequent file

NR!=FNR && FNR==1 { c1++;}

# Read $1 from second, third file etc, compare first column with hash h1, if positive add to hash column 2

NF{ if($1 in h1) h2[$1] = h2[$1] OFS $2; }

#If positive and column 2 is empty, add NA to hash h2

NF{ if($1 in h1 && $2=="") h2[$1] = h2[$1] OFS "NA"}

#If negative i.e. $1 not in hash h1 and h2, and column 2 is not empty, add NA to hash till the file number c1

NF{ if(($1 in h1)==0 && ($1 in h2)==0 && $2!="") {for(c=1;c<c1;c++) h2[$1] = h2[$1] OFS "NA"};}

#If negative and column 2 is not empty, add $2 to hash

NF{ if(($1 in h1)==0 &&  $2!="") h2[$1] = h2[$1] OFS $2;}

#If negative and column 2 is not empty, add NAs to the hash till the size of ARGC

NF{ if(($1 in h1)==0 && ($1 in h2)!=0 && $2!="" ) {for(c=1;c<ARGC-c1;c++) h2[$1] = h2[$1] OFS "NA"};}

#Run a for loop and go through the hash
#If size of the hash is ARGC-1 print complete hash
#If size of the hash is 1, add NAs to variable, print hash + variable
# If size is greater that ARGC-1 do nothing - these are the entries that repeat more that 2 times and will not be printed

END {  
for(k in h2)
if (split(h2[k], a) ==ARGC-1) print k OFS h2[k]
else if (split(h2[k], a) == 1) {p="";for(c=1;c<ARGC-1;c++) p=p OFS "NA"; print k OFS h2[k] p}
else if (split(h2[k], a) > ARGC-1)
}


NR==FNR { h1[$1] = $1; h2[$1] = $2; c1=1;next;}

NR!=FNR && FNR==1 { c1++;}

NF{ if($1 in h1) h2[$1] = h2[$1] OFS $2; }
NF{ if($1 in h1 && $2=="") h2[$1] = h2[$1] OFS "NA"}

NF{ if(($1 in h1)==0 && ($1 in h2)==0 && $2!="") {for(c=1;c<c1;c++) h2[$1] = h2[$1] OFS "NA"};}
NF{ if(($1 in h1)==0 &&  $2!="") h2[$1] = h2[$1] OFS $2;}

NF{ if(($1 in h1)==0 && ($1 in h2)!=0 && $2!="" ) {for(c=1;c<ARGC-c1;c++) h2[$1] = h2[$1] OFS "NA"};}


END {  
for(k in h2)
if (split(h2[k], a) ==ARGC-1) print k OFS h2[k]
else if (split(h2[k], a) == 1) {p="";for(c=1;c<ARGC-1;c++) p=p OFS "NA"; print k OFS h2[k] p}
else if (split(h2[k], a) > ARGC-1)
}

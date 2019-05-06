import module namespace tc = "test_cases" at "tc3.xq";


declare function tc:q1($file)
{
<bib>
 {
  for $b in $file/bib/book
  where $b/publisher = "Addison-Wesley" and $b/@year > 1991
  return
    <book year="{ $b/@year }">
     { $b/title }
    </book>
 }
</bib> 
};

declare function tc:i1($bib)
{
   every $b in $bib/bib/book satisfies $b/@year >1991 (:and $b/publisher = "Addison-Wesley":)
};

declare function tc:o1($bib)
{
  every $b in $bib/books satisfies $b/@year<1991
};

declare function tc:io1($bibi,$bibo)
{

every $bi in $bibi/bib/book satisfies some $bo in $bibo/book satisfies $bo/title=$bi/title 

};


tc:tester(doc("/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/schemai_q1.xsd"),"tc:q1","tc:i1","tc:o1","tc:io1",1)

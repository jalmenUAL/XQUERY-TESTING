import module namespace tc = "test_cases" at "tc3.xq";

declare function tc:q7($file)
{
<bib>
  {
    for $b in $file//book
    where $b/publisher = "Addison-Wesley" and $b/@year > 1991
    order by $b/title
    return
        <book>
            { $b/@year }
            { $b/title }
        </book>
  }
</bib> 
};

declare function tc:i7($file)
{
  true()
};

declare function tc:o7($bib)
{
  let $count := count($bib/book)
  return
  every $i in 1 to $count - 1 satisfies $bib/book[$i]/title<=$bib/book[$i+1]/title
};

 

declare function tc:io7($file,$bib)
{
  true()
};

tc:tester(doc("/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/schemai_q7.xsd"),"tc:q7","tc:i7","tc:o7","tc:io7",5)
 
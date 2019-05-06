import module namespace tc = "test_cases" at "tc3.xq";

declare function tc:q6($file)
{
<bib>
  {
    for $b in $file//book
    where count($b/author) > 0
    return
     
        <book>
            { $b/title }
            {
                for $a in $b/author[position()<=2]  
                return $a
            }
            {
                if (count($b/author) > 2)
                 then <et-al/>
                 else ()
            }
        </book>
    
  }
</bib>
};

declare function tc:i6($file)
{
every $book in $file/bib/book satisfies count($book/author)>=3
};

declare function tc:o6($bib)
{
every $book in $bib/book satisfies count($book/author)=2
};

declare function tc:io6($file,$bib)
{
every $book in $bib/book satisfies count($book/et-al)=1
};


tc:tester(doc("/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/schemai_q6.xsd"),"tc:q6","tc:i6","tc:o6","tc:io6",3)
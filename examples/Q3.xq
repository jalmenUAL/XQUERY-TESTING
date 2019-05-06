import module namespace tc = "test_cases" at "tc3.xq";

declare function tc:q3($file)
{
<results>
{
    for $b in $file/bib/book
    return
        <result>
            { $b/title }
            { $b/author  }
        </result>
}
</results> 
};

declare function tc:i3($file)
{
  every $book in $file/bib/book satisfies not($book/author)
};

declare function tc:o3($results)
{
  every $result in $results/result satisfies $result/title and $result/author
};

declare function tc:io3($file,$results)
{
  true()
};

tc:tester(doc("/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/schemai_q3.xsd"),"tc:q3","tc:i3","tc:o3","tc:io3",4)

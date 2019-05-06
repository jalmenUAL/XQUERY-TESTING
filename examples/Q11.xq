import module namespace tc = "test_cases" at "tc3.xq";

declare function tc:q11($args)
{
<bib>
{
        for $b in $args/args/fst//book[author]
        return
            <book>
                { $b/title }
                { $b/author }
            </book>
}
{
        for $b in $args/args/snd//book[editor]
        return
          <reference>
            { $b/title }
            {$b/editor/affiliation}
          </reference>
}
</bib>
};

declare function tc:i11($args)
{
  true()
};

declare function tc:o11($results)
{
 every $book in $results/book satisfies $book/author
};

declare function tc:io11($args,$results)
{
  true()
};

tc:tester(doc("/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/schemai_q11.xsd"),"tc:q11","tc:i11","tc:o11","tc:io11",5)
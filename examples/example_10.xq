import module namespace tc = "test_cases" at "tc3.xq";
import module namespace val = "validator"at "validator.xq";



declare function tc:q($u)
{
<bib>
{
    for $book1 in $u/args/fst//book,
        $book2 in $u/args/snd//book
    let $aut1 := for $a in $book1/author 
                 order by $a/last, $a/first
                 return $a
    let $aut2 := for $a in $book2/author 
                 order by $a/last, $a/first
                 return $a
    where $book1 << $book2
    and not($book1/title = $book2/title) and $book1/title=$u/args/thd
    and deep-equal($aut1, $aut2) 
    return
        <book-pair>
            { $book1/title }
            { $book2/title }
        </book-pair>
}
</bib> 
};



 
  
 
  
val:val("/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/schema_example_10.xsd","/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/example_10.xq")


 
 
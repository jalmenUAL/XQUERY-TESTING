import module namespace tc = "test_cases" at "tc3.xq";
import module namespace val = "validator"at "validator.xq";



declare function tc:q($bookstore)
{
for $t in (
for $book in $bookstore/bib/book 
where $book/@year > 2000  
return 
for $x in $book/author return for $u in $x return $u
)
return <names> {$t/title/text()} </names>
};

val:val_query("/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/schema_books.xsd","/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/example_2.xq")
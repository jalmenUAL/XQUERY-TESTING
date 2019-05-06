import module namespace tc = "test_cases" at "tc3.xq";
import module namespace val = "validator"at "validator.xq";


declare function tc:q($bookstore)
{
for $t in ( 
for $bib in $bookstore/bib
return <a><b>{$bib/book/title}<c>{$bib/book}</c></b></a>
)
return $t/b/c/book
};

val:val_query("/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/schema_books.xsd","/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/intro_1.xq")

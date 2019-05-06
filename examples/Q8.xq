import module namespace tc = "test_cases" at "tc3.xq";


declare function tc:q8($file)
{
for $b in $file//book
let $e := $b/*[contains(string(.), "Suciu") 
               and ends-with(local-name(.), "or")]
where exists($e)
return
    <book>
        { $b/title }
        { $e }
    </book> 
};

declare function tc:i8($file)
{
  true()
};

declare function tc:o8($books)
{
every $book in $books satisfies 
        every $item in $book/* satisfies contains(string($item),"Suciu") or name($item)="title"
};

 

declare function tc:io8($file,$books)
{
  true()
};

tc:tester(doc("/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/schemai_q8.xsd"),"tc:q8","tc:i8","tc:o8","tc:io8",5)
 
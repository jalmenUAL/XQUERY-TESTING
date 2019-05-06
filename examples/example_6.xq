import module namespace tc = "test_cases" at "tc3.xq";
import module namespace val = "validator"at "validator.xq";



declare function tc:books_query($file){
for $book in $file/bib/book return
if ($book/title="UML" and $book/price<100) then 
<book_UML>
    {$book/@year}{$book/author}{$book/price}
      </book_UML>
else if ($book/title="XML" and $book/@year>2000 and $book/price<100) then
      <book_XML>
      {$book/@year}{$book/author}{$book/price}
      </book_XML> else ()
};


declare function tc:books_price_100($book){
  $book/price<100};
  
declare function tc:allbooksofBuneman($book){
  every $b in $book satisfies $b/author="Buneman"};
  
declare function tc:price_and_year($book){ 
  every $b in $book satisfies
  if (name($b)="book_UML") then $b/price<100
  else $b/@year>2000 and $b/price<100};
  
declare function tc:truei($bib){
true()
};
declare function tc:trueio($bib,$book){
true()
};

(:tc:tester(doc("/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/schema_books.xsd"),"tc:books_query","tc:truei","tc:books_price_100","tc:trueio",1):)
(:tc:tester(doc("/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/schema_books.xsd"),"tc:books_query","tc:truei","tc:allbooksofBuneman","tc:trueio",1):)
tc:tester(doc("/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/schema_books.xsd"),"tc:books_query","tc:truei","tc:price_and_year","tc:trueio",1)

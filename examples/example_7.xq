import module namespace tc = "test_cases" at "tc3.xq";
import module namespace val = "validator"at "validator.xq";



declare function tc:third_book($bib){
  let $third := $bib/bib/book[3]
  where $third/title="UML"
  return <third>{$third/title}{$third/author[3]}</third>};


 
  
declare function tc:UML($book){
  $book/title="UML"};
  
declare function tc:truei($bib){
true()
};
declare function tc:trueio($bib,$book){
true()
};

(: SET MINOCCURS IN BOOK TO 3:)

tc:tester(doc("/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/schema_books.xsd"),"tc:third_book","tc:truei","tc:UML","tc:trueio",0)
 
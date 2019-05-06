import module namespace tc = "test_cases" at "tc3.xq";
import module namespace val = "validator"at "validator.xq";



declare function tc:yearofUMLbooks($file){
for $x in $file//book
where $x/title="UML" and $x/@year>2000
return $x/@year};

declare function tc:after2000($year){
  $year>2000};
  
declare function tc:before2000($year){
  $year<2000};
  
declare function tc:truei($bib){
true()
};
declare function tc:trueio($bib,$book){
true()
};

tc:tester(doc("/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/schema_books.xsd"),"tc:yearofUMLbooks","tc:truei","tc:after2000","tc:trueio",1)
(:tc:tester(doc("/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/schema_books.xsd"),"tc:yearofUMLbooks","tc:truei","tc:before2000","tc:trueio",1)
:)
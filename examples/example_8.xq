import module namespace tc = "test_cases" at "tc3.xq";
import module namespace val = "validator"at "validator.xq";



declare function tc:q($bib){
 <bib>
  {
    for $b in $bib//book
    where $b[author="Buneman"] 
    return
        <book>
            { $b/title }
            { for $a in $b/author[position()<=2]  
                return $a}
            {if (count($b/author) > 2)
                 then <et-al/>
                 else ()}
        </book>
    }
</bib>};



declare function tc:t($bib)
{
  true()
};
  
declare function tc:o($bib){
  every $b in $bib//book
 satisfies $b/author="Buneman"};
  
declare function tc:i($bib){
every $b in $bib//book
 satisfies count($b/author)<=2
};

declare function tc:i2($bib){
every $b in $bib//book
 satisfies count($b/author)>2
};

declare function tc:io($bib,$book){
true()
};

declare function tc:io2($bibi,$bibo){
every $b in $bibo//book
 satisfies (if (count($b/et-al)=1) then 
 some $c in $bibi//book satisfies ($c/title=$b/title
 and count($c/author)>2) else true())
};

declare function tc:io3($bibi,$bibo){
every $b in $bibi//book
 satisfies some $c in $bibo//book satisfies $b/title=$c/title
};


(:tc:tester(doc("/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/schema_books_example_8.xsd"),"tc:q","tc:i","tc:o","tc:io",1):)
(:tc:tester(doc("/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/schema_books_example_8.xsd"),"tc:q","tc:i2","tc:o","tc:io",2):)
tc:tester(doc("/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/schema_books_example_8.xsd"),"tc:q","tc:i2","tc:t","tc:io2",2)
(:tc:tester(doc("/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/schema_books_example_8.xsd"),"tc:q","tc:i2","tc:t","tc:io3",2):)
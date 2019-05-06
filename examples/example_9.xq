import module namespace tc = "test_cases" at "tc3.xq";
import module namespace val = "validator"at "validator.xq";



declare function tc:q($bib){
 <bib>
  {
    for $b in $bib//books
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


 
  
 
  
declare function tc:i($bib){
every $b in $bib//book
 satisfies count($b/author) >= 2
};

declare function tc:i2($bib){
every $b in $bib//book
 satisfies $b/author="Buneman"
};

declare function tc:o($bib){
true()
};

declare function tc:io($bib,$book){
true()
};


 
tc:tester(doc("/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/schema_books_example_9.xsd"),"tc:q","tc:i","tc:o","tc:io",1)
(:tc:tester(doc("/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/schema_books_example_9.xsd"),"tc:q","tc:i2","tc:o","tc:io",1):)
import module namespace tc = "test_cases" at "tc3.xq";

declare function tc:q9($file)
{
<results>
  {
    for $t in $file//(chapter | section)/title
    where contains($t/text(), "XML")
    return $t
  }
</results>
};

declare function tc:i9($file)
{
  true()
};

declare function tc:o9($results)
{
every $result in $results/title satisfies contains($result/text(),'XML') 
};

declare function tc:io9($file,$results)
{
every $title in $results/title satisfies some $f in $file//(chapter | section)/title satisfies not($title/text()=$f/text())
};


tc:tester(doc("/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/schemai_q9.xsd"),"tc:q9","tc:i9","tc:o9","tc:io9",5)
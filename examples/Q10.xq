import module namespace tc = "test_cases" at "tc3.xq";
import module namespace val = "validator"at "validator.xq";
 



declare function tc:q10($file)
{
<results>
  {
    let $doc := $file
    for $t in distinct-values($doc//book/title)
    let $p := $doc//book[title = $t]/price
    return
      <minprice title="{ $t }">
        <price>{ min($p) }</price>
      </minprice>
  }
</results> 
};

declare function tc:i10($file)
{
  true()
};

declare function tc:o10($results)
{
count($results/minprice)=count(distinct-values($results/minprice/@title)) 
};


 



declare function tc:io10($file,$results)
{
 $results/minprice/price = min(let $books := $file//book
 where $books/title = $results/minprice/@title
 return $books/price)
};
 

tc:tester(doc("/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/schemai_q10.xsd"),"tc:q10","tc:i10","tc:o10","tc:io10",4)

 
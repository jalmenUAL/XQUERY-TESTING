import module namespace tc = "test_cases" at "tc3.xq";


declare function tc:q5($args)
{
<books-with-prices> 
{ 
	 for $b in $args/args/snd//book, 
	 	 $a in $args/args/fst//entry 
	 where $b/title = $a/title 
	 return 
	 	 <book-with-prices> 
	 	 	 { $b/title } 
	 	 	 <price-bstore2>{ $a/price/text() }</price-bstore2> 
	 	 	 <price-bstore1>{ $b/price/text() }</price-bstore1> 
	 	 </book-with-prices> 
	 } 
</books-with-prices> 
};

declare function tc:i5($file)
{
true()
};

declare function tc:o5($bib)
{
every $book in $bib/book-with-prices satisfies count($book/price-bstore2)=1
};

declare function tc:io5($file,$bib)
{
every $title in $bib/book-with-prices/title satisfies some $title2 in $file/args/snd/bib/book/title satisfies $title=$title2 
};


tc:tester(doc("/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/schemai_q5.xsd"),"tc:q5","tc:i5","tc:o5","tc:io5",5)
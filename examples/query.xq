module namespace q = "query";

declare function q:query($bookstore)
{

(:
for $t in ( 
for $bib in $bookstore/bib
return <a><b>{$bib/book/title}<c>{$bib/book}</c></b></a>
)
return $t/b/c/bib
:)

for $t in (for $book in $bookstore/bib/book where $book/@year > 2000 return for $x in $book/author return for $u in $x return $u)return <names> {$t/title/text()} </names>

(:
let $i := $bookstore return
$bookstore[$i/bib]
:)


(:
$bookstore/bib/(book,mierda)
:)

(:
for $x in $bookstore/bib to $bookstore/bib return $x
:)

(:
for $t in ( for $book in $bookstore/bib/book where $book/@date > 2000 return $book/author ) return <names> {$t/text()} </names>
:)

(:
$bookstore/descendant::polla
:)

(:
$bookstore/descendant-or-self::node()/child::bib/descendant-or-self::node()/child::book/ancestor::bib/descendant::title/ancestor::book/self::book/descendant-or-self::book/ancestor::bib
:)

(:
$bookstore/bib/book/../mierda
:)

(:
$bookstore/bib/polla/*
:)

(:
$bookstore/child::bib/child::book/ancestor::*/child::book/child::title/parent::book/child::title
:)

(:
$bookstore/bib/book/mierda/../(author,title)
:)


(:
$bookstore/child::reviews/child::chapter/child::section/child::section/child::section/child::section
:)

(:
$bookstore/descendant::ciclo
:)


(:
for $t in
(
for $x in $bookstore
return
<a><b>{$x/bib,$x/bib}</b></a>)
return $t/b/bib
:)


(:
for $x in $bookstore
return
<a><b>{$x/bib/book/author,$x/bib/book/author}</b></a>/b/mierda
:)

(:
for $x in $bookstore
return
(for $y in $x/bib return $y)/(book or book)/(author or mierda) 
:)

(:
$bookstore/book
:)

(:
if (not(($bookstore/bib or $bookstore/bib))) then $bookstore/bib else $bookstore/bib/book/title/text()
:)

(:
$bookstore/descendant-or-self::bib//polla
:)

(:
$bookstore/child::bib/descendant::book/descendant-or-self::book/ancestor::bib
:)

(:
$bookstore/bib/book/../(book or book) 
:)

(:
$bookstore/bib[for $x in . where $x/book return ./book]/book
:)


(:
$bookstore/bib>1 or $bookstore/bib<2
:)

(:
($bookstore/bib/book/author or $bookstore/bib/book/title)
:)


(:
$bookstore/bib/(book or book)/author
:)


(:
$bookstore/bib/book
:)

(:
for $x in $bookstore
return
(for $y in $x/bib return $y)/book/author
:)

(:
(if ($bookstore) then $bookstore/bib/book else $bookstore/bib)/(author or title)
:)

(:
(if ($bookstore) then $bookstore/bib else $bookstore/bib)/book/(author or title)
:)

(:
$bookstore/bib/book
:)


(:
if ($bookstore) then $bookstore/bib/book else $bookstore/bib/book
:)

(:
$bookstore>$bookstore/bib/book
:)

(:
for $z in $bookstore/bib/book
where
some $y in $bookstore/bib/book satisfies
some $x in $y/title satisfies $z>5
return $z/book
:)

(:
$bookstore/bib[book[author>0 or title<1]]
:)

(:
$bookstore/bib[book[title] or book[author]]/book/author
:)

(:
$bookstore/bib/book/title or $bookstore/bib/book/author
:)

(: :)
(:
for $chapter in $bookstore/reviews/chapter
return 
($chapter//paper, 
$chapter/../chapter)
:)
(::)

(:
$bookstore/bib/.
:)

(:
$bookstore/reviews/chapter/../chapter/section/../section/../../chapter
:)

(:
$bookstore//chapter/miscojones
:)

(:
for $book in $bookstore
let $other := $book
return for $z in $other/bib/book return $z
:)

(:
for $book in $bookstore/bib/book
where $book/@year>1000 or $book/title<2000
order by $book
return if ($book/author) then $book else $book/book/author
:)

(:
for $book in $bookstore/bib/book
return if($book) then $book/author else $book/title 
:)

(:
for $x in $bookstore/bib/book 
for $year in $x
return
for $x in $x/author return $x
:)

(:
$bookstore/bib/book//author/../../book/../../bib
:)

(:
$bookstore/book//editorial/pollas
:)

(:
for $t in (
for $book in $bookstore/bib/book 
where $book/@year > 2000  
return 
for $x in $book/author return for $u in $x return $u/first
)
return <names> {$t/text()} </names>
:)

(:
$bookstore/self::bib
:)
 
(:
for $t in ( 
for $bib in $bookstore/bib
return <a><b><c>{$bib}</c></b></a>
)
return $t/b/c/bib/parent::c/parent::b/parent::a
:)

(:
for $t in ( 
for $bib in $bookstore/bib
return <a><b><c>{$bib/book}<d>{$bib/book}</d></c></b></a>
)
return $t/b/c/d/book
:)

(:
for $t in ( 
for $bib in $bookstore/bib
return <a><b><c>if ($bib/book) then <d>{$bib}</d> else $bib </c></b></a>
)
return $t/b/c/d/bib
:)

(:
for $t in ( 
for $bib in $bookstore/bib
return <a><b><c>({$bib/book},<d>{$bib}</d>)</c></b></a>
)
return $t/b/c/d/bib
:)

(:
for $bib in $bookstore
return <a><b><c>{$bib,$bib/bib/book}</c></b></a>/b/c/bib
:)



(:
<a><b><c>{$bookstore/bib}</c></b></a>/b/c/bib
:)

(:
<a>{$bookstore/bib}</a>/bib/../../a/polla
:)

(:
$bookstore/bib/./book
:)

(:
$bookstore/bib/../bib[book]/../bib/book
:)


(:
$bookstore/bib/book/parent::*
:)


(:
$bookstore/bib[/bib]/book[/bib]
:)


(:
 every $b in $bookstore/preceding-sibling::bib satisfies $b/@year > 1991 
:)


(:
for $x in $bookstore/bib/mierda to $bookstore/bib return $x
:)

(: 
 every $bi in $bookstore/bib/book satisfies some $bo in $bi satisfies $bo/title=$bi/title 
:)

};
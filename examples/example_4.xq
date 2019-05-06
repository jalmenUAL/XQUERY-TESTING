import module namespace tc = "test_cases" at "tc3.xq";
import module namespace val = "validator"at "validator.xq";



declare function tc:q($bookstore)
{
$bookstore/reviews/chapter//paper
};

val:val_query("/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/schema_reviews.xsd","/Users/jesusmanuelalmendrosjimenez/Dropbox/ProyectoJesusAlmendros/STVR2015/testing-antonio/example_4.xq")
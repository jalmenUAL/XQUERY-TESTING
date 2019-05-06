import module namespace val = "validator" at "validator.xq";
import module namespace xsv = "xs_validator" at "schema_validator.xq";



let $x :=
val:val_query("/Users/jesusmanuelalmendrosjimenez/Dropbox/research/test_cases/TESTING XQUERY/testing-4.0/schemai_q12.xsd","/Users/jesusmanuelalmendrosjimenez/Dropbox/research/test_cases/TESTING XQUERY/testing-4.0/query.xq")
(:
let $y :=
xsv:paths_query("/Users/jesusmanuelalmendrosjimenez/Dropbox/research/test_cases/TESTING XQUERY/testing-4.0/query.xq"):)
return $x

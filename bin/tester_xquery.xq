module namespace xt = "xquery_testing";
import module namespace tc = "test_cases" at "/Users/jesusmanuelalmendrosjimenez/Dropbox/research/test_cases/TESTING ATL/TESTING/test_cases.xq";


(: TESTER: MAIN FUNCTION :)

declare function xt:tester($schema as node()*,$query as xs:string,$pinput as xs:string,$poutput as xs:string,$pin-out as xs:string,$i as xs:integer,$namespaces)
{
  xt:tester_loop(tc:unfold($schema),$query,$pinput,$poutput,$pin-out,0,$i,0,0,$namespaces)
};

(: TESTER_LOOP :)

declare function xt:tester_loop($schema as node()*,$query as xs:string,$pinput as xs:string,$poutput as xs:string,$pin-out as xs:string,$k as xs:integer, $i as xs:integer,$tests as xs:integer,$empties as xs:integer,$namespaces)
{
if ($k>$i) then
  if ($tests=$empties) then xt:show_unable()
  else xt:show_passed($tests,$empties)
else 
xt:tester_schema($schema,$schema,$query,$pinput,$poutput,$pin-out,$k,$i,$tests,$empties,$namespaces)
}; 

(: TESTER_SCHEMA :)

declare function xt:tester_schema($schemas as node()*,$all as node()*,$query as xs:string,$pinput as xs:string, $poutput as xs:string,$pin-out as xs:string,$k as xs:integer,$i as xs:integer,$tests as xs:integer,$empties as xs:integer,$namespaces)
{
  if (empty($schemas)) then let $new := xt:new_schemas($all)
                        return
                        xt:tester_loop($new,$query,$pinput,$poutput,$pin-out,$k + 1,$i,$tests,$empties,$namespaces)
                       else 
                       let $sc := head($schemas)
                       let $structure := tc:skeleton($sc/xs:schema/xs:element,true(),$namespaces)
                       let $examples := 
                       tc:populate($structure,tc:getTypes($structure),
                       tc:getVal($structure,$sc/xs:schema,tc:getTypesName($structure)))
                       
                       let $fpinput:=function-lookup(xs:QName($pinput),1)
                       let $fpin-out := function-lookup(xs:QName($pin-out),2)
                       let $fpoutput:=function-lookup(xs:QName($poutput),1)
                       let $fquery := function-lookup(xs:QName($query),1)
                       let $total := count($examples) return
                       if (not($total=0)) then
                       
                       (: INPUT PROPERTY :)
                  
                       let $input := (for $valid in $examples 
                       where $fpinput(<root>{$valid}</root>) return
                       <root>{$valid}</root>)
                  
                       (: OUTPUT PROPERTY :)
                  
                       let $output := (for $valid in $input
                       let $result := $fquery($valid)
                       where  not($fpoutput($result)) return 
                       if (empty($result)) then <empty/> else $valid)
                       
                       let $outputnoempty := $output[not(name(.)="empty")]
                       
                       
                       (: INPUT-OUTPUT PROPERTY :)
                       
                       let $in-out := (for $valid in $input
                       let $result := $fquery($valid)
                       where not($fpin-out($valid,$result)) return 
                       if (empty($result)) then <empty/> else $valid)
                       
                       let $in-outnoempty := $in-out[not(name(.)="empty")]
                       
                       let $falseoutput := count($outputnoempty)+count($in-outnoempty)
                       
                       (: EMPTY RESULTS SATISFYING OUTPUT PROPERTIES:)
                       
                       let $newempties :=  count($output[name(.)="empty"])+$empties
                       let $newtests := $tests + count($input)
                       
                       return 
                       if ($falseoutput=0) then
                       xt:tester_schema(tail($schemas),$all,$query,$pinput,$poutput,$pin-out,$k,$i,
                       $newtests,$newempties,$namespaces)
                      
                       else 
                       if (count($outputnoempty)>0) then
                       xt:show_falsifiable_output($newtests,$outputnoempty)
                       else  
                       xt:show_falsifiable_input_output($newtests,$in-outnoempty)
                       else if ($tests=$empties) then xt:show_unable()
                                     else xt:show_passed($tests,$empties)
             
};


declare function xt:show_fail_pre()
{
<Text>
Input property cannot be satisfied.
</Text>/text()
};


(: SHOW_PASSED :)

declare function xt:show_passed($tests,$empties)
{
<Text>
Ok: passed {$tests} tests.
Trivial: {$empties} tests.
</Text>/text() 
};

(: SHOW_UNABLE :)

declare function xt:show_unable()
{
<Text>
Unable to test the property.
</Text>/text() 
};

(: SHOW_FALSIFIABLE :)

declare function xt:show_falsifiable_output($tests,$counter)
{
<Text>
Output Property Falsifiable after {$tests} tests.
Counterexamples:
{for $c in $counter/* return $c}
</Text>/(text() | *) 
};

declare function xt:show_falsifiable_input_output($tests,$counter)
{
<Text>
Input-Output Property Falsifiable after {$tests} tests.
Counterexamples:
{for $c in $counter/* return $c}
</Text>/(text() | *) 
};

(: SHOW_FAIL_PROPERTY:)

declare function xt:show_fail_property($property)
{
<Text>
The property: {$property} does not exists.
</Text> 
};

(: NEW_SCHEMAS :)

declare function xt:new_schemas($schema)
{
let $count := count($schema)
let $new := (for $k in 1 to $count return tc:increase($schema[$k]))
return $new              
};





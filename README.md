# XQUERY-TESTING
PROPERTY BASED TESTING OF XQUERY QUERIES

The tool enables to automatically test XQuery programs. The tool is able to systematically generate XML instances (i.e., test cases) from a given XML schema, and to filter XML instances with input properties specified by the programmer. Additionally, the tool automatically checks output (respectively, input-output) properties in each output instance (respectively, each pair of input-output instances). The tool is able to report whether the XQuery program passes the test, that is, if all the test cases satisfy the (input-)output property, as well as the number of test cases used for testing. In addition, if the XQuery program fails the test, the tool shows counterexamples found in the test cases. Properties are specified with XQuery Boolean functions, and the testing tool has been implemented in XQuery. Additionally, the tool is able to detect wrong paths in XQuery expressions. The path validation tool takes as input an XML Schema and it reports those paths on the XQuery program that do not match the XML Schema. The path validation tool is a complement to the testing tool rejecting XQuery programs that do not conform to the XML Schema. The path validation tool has been also implemented in XQuery. 

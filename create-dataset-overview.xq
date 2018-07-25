declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "csv";
declare option output:csv "header=yes, separator=comma";

let $csv:=

<csv>{
for $item at $count in //item
let $included:=data($item/@included)
let $urn:=for $uri in $item/metadata[@element="identifier"]
where contains($uri, "URN")
return concat("http://urn.fi/",$uri)

return 
<entry>
<position>{$count}</position>
<urn>{data($urn)}</urn>
<included>{$included}</included>
</entry>
}</csv>

return $csv
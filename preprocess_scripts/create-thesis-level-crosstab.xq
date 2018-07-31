declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "csv";
declare option output:csv "header=yes, separator=comma";

let $csv:=

<csv>{

for $item in //item[@included eq 'yes']
let $level:=
string-join(for $level in $item/metadata[@qualifier eq 'ontasot'][. contains text {'yamk','amk'} any word]
return $level)

group by $level

return
<entry>
<level>{$level}</level>
<count>{count($item)}</count>
</entry>
}</csv>

return $csv
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "csv";
declare option output:csv "header=yes, separator=comma";

let $csv:=

<csv>{

for $item in //item[@included eq 'yes']
let $level:=
string-join(for $level in $item/metadata[@qualifier eq 'ontasot'][. contains text {'yamk','amk'} any word]
return $level)

let $institution:= data($item/metadata[@element eq "organization"][1])

group by $level,$institution
order by $institution,$level
return
<entry>
<level>{$level}</level>
<institution>{$institution}</institution>
<count>{count($item)}</count>
</entry>
}</csv>

return $csv
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "csv";
declare option output:csv "header=yes, separator=semicolon";
let $csv:=

<csv>{
for $record in db:open("critical-realist")/text


let $contents:=
  replace(string-join((for $line in $record/line
  where string-length($line)>5
  return $line),' '),'�','')


return

<entry>
<epistemology>critical-realism</epistemology>
<document>{$contents}</document>
</entry>

}</csv>

return $csv
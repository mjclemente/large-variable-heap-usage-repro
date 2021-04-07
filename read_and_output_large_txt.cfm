<cfscript>
  // filePath = expandPath('./pg200.txt');
  filePath = expandPath('./history.json');
  content = fileRead( filePath );
</cfscript>
<p>Ok, the variable has been set - now you can <a href="/memory.cfm">view the memory usage</a>.</p>

_____

<cfscript>
  writeOutput(content);
</cfscript>

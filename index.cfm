<cfscript>
  files = directoryList( expandPath( './' ), true, "array", "*.cfm" );
  directory = getDirectoryFromPath( CGI.PATH_TRANSLATED );
  files.sort( "text", "asc" );
  files = files.filter( (p) => p.replace( directory, '' ) != 'index.cfm' );
  links = files.map(
    function( item, index ) {
      link = {};

      path = item.replace( directory, '' );

      if ( !path.find( '\' ) ) {
        return {
          'path': path,
          'root': '',
          'script': path
        }
      } else {
        return {
          'path': path.replace( '\', '/', 'all' ),
          'root': path.listFirst( '/' ),
          'script': path.listRest( '/' )
        }
      }
    }
  );
</cfscript>
<p>First visit the <a href="/memory.cfm">memory.cfm</a> page. You should see the heap around 54mb on a fresh server start. Then go back to this page.</p>
<cfoutput>
    <table border="1" cellpadding="10">
      <tbody>
        <cfloop array="#links#" index="link">
        <tr>
          <td>
            <a href="#link.path#">
              #link.root.len() ? '<strong>#link.root#/</strong>' : ''##link.script#
            </a>
          </td>
        </tr>
        </cfloop>
      </tbody>
    </table>
</cfoutput>
<p>Next, visit either the <a href="/read_large_txt.cfm">read_large_txt.cfm</a> or <a href="/read_and_output_large_txt.cfm">read__and_output_large_txt.cfm</a> pages.</p>
<p>Once they've run, return to <a href="/memory.cfm">check the memory usage</a>.</p>
<hr>
<p>The large file being read is about 38.9 MB.</p>
<p>When you read the large file, the heap increases to approximately 370mb.</p>
<p>If you read and output the variable, the heap reaches approximately 600mb.</p>
<cfabort>

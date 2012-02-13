<?
if (!isset($_SESSION['cc_user_id'])) {
	echo "<div class=\"error\">Please <a href=\"?s=home\">Login</a> or <a href=\"?s=register\">Register</a> before viewing map.</div>\n";
} else { ?>
<? if (isset($_SESSION['cc_isadmin']) && ($_SESSION['cc_isadmin']) && $_GET['s'] == 'map') {
$sql = "SELECT * FROM `map_tiles` ORDER BY `id`";
$result = runQuery($sql);
echo "<div style=\"float: right;\">\n";
while ($row = mysql_fetch_assoc($result)) {
	echo $row['id'] . " <img src=\"images/enviro/" . $row['id'] . ".gif\"> " . $row['name'] . " (" . $row['solid'] . "&" . $row['teleport_id'] . ")<br />\n";
}
echo "</div>\n";
}
?>
<div id="navigation">
These are the movement keys, or use W,A,S,D. (doesn't work in firefox).<br />
<table cellpadding="0" cellspacing="0" id="movement">
<tr><td></td><td><a href="javascript:getMap('move=u');"><img src="images/gui/arrow_up.gif"></a></td><td></td></tr>
<tr><td><a href="javascript:getMap('move=l');"><img src="images/gui/arrow_left.gif"></a></td><td></td>
<td><a href="javascript:getMap('move=r');"><img src="images/gui/arrow_right.gif"></a></td></tr>
<tr><td></td><td><a href="javascript:getMap('move=d');"><img src="images/gui/arrow_down.gif"></a></td><td></td></tr>
</table>

<? if ($_SESSION['cc_isadmin']) { ?>
These are the terraform keys. Enter in a tile id from the right.
<script language="javascript">
function terraform(form) {
var stringy = "tu=" + form.tu.value + "&tl=" + form.tl.value + "&tr=" + form.tr.value + "&td=" + form.td.value + "&terraform=1";
getMap(stringy);
}
</script>
<table cellpadding="0" cellspacing="0" id="terraform">
<form action="" method="get" name="terra">
<input type="hidden" name="s" value="map" />
<tr><td></td><td><input name="tu" /></td><td></td></tr>
<tr><td><input name="tl" /></td><td><input type="button" name="button" value="Click" onClick="terraform(this.form)"></td><td><input name="tr" /></td></tr>
<tr><td></td><td><input name="td" /></td><td></td></tr>
</form>
</table>
<? } ?>
<br />
</div>


<script language="JavaScript" type="text/javascript" src="ajax_map.js"></script>
<div id="map">If you can read this there may be a problem...</div>
<div>Due to a bug in firefox with string concatination, this page takes a ton of time to render.
I hate to admit it but you are better off running IE to view this page. Be cool like me and install the
<a href="https://addons.mozilla.org/firefox/1419/">IE Tab</a> Plugin which allows you to run the IE engine
from within a firefox tab.</div>

<? } ?>
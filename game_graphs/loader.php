<style>
* {
	font-size: 10px;
	font-family: verdana;
}
table {
	background-color: black;
}
td {
	background-color: white;
}
.a4 { background-color: #ff8888; }
.a5 { background-color: #8888ff; }
.a6 { background-color: #88ff88; }
.a7 { background-color: #ffaa88; }
.a8 { background-color: #88aaff; }

</style>
<?
$x = $_GET['x'];
$y = $_GET['y'];
$z = $_GET['z'];

?>
<form method="get">
X (Race Value): <input name="x" value="<?=$x?>"><br />
Y (Class Value): <input name="y" value="<?=$y?>"><br />
Z (Other Values): <input name="z" value="<?=$z?>"><br />
<input type="submit" value="go"> Attribute = XL<sup>2</sup>+YL+Z
</form>
<center>
<img src="image.php?x=<?=$x?>&y=<?=$y?>&z=<?=$z?>"><br />
<br />
<table cellpadding="2" cellspacing="1">
<?
heading(10);
for ($i = 1; $i <= 100; $i+=10) {
	echo "<tr>";
	for ($j = 0; $j < 10; $j++) {
		one_set($i+$j,$x,$y,$z);
	}
	echo "</tr>\n";
}

?>
</table>
<br />
<table cellpadding="2" cellspacing="1">

<? rowstats(); ?>

</table>
</center>
<?
function one_set($i,$x,$y,$z) {
	echo "<td>$i</td><td>" . ceil($x*$i*$i + $y*$i + $z) . "</td>";
}
function heading($i) {
	echo "<tr>";
	for($j = 0; $j < $i; $j++)
		echo "<td>Level</td><td>Att</td>";
	echo "</tr>\n";
}
function rowstats() {
#hp, mp, str, def, agi, matt, mdef
#for dwarf
$att_x = array(1.2, .01, .007, .006, .007, .005, .005);
$att_y = array(6, 3, .7, .6, .3, .1, .2);
$att_z = array(100, 10, 10, 8, 6, 1, 1);

for ($i=0; $i<=200; $i++) {
	if (($i % 20) == 0)
		one_row_heading();
	echo "<tr>";
	echo "<td class=\"a1\">$i</td>";
	for($j=0; $j<=6; $j++) {
		one_cell_att($i, $att_x[$j], $att_y[$j], $att_z[$j], $j);
	}
	echo "</tr>\n";

}


}
function one_cell_att($i, $x, $y, $z, $color) {
	echo "<td class=\"a" . ($color + 2) . "\">" . ceil($x*$i*$i + $y*$i + $z) . "</td>";
}
function one_row_heading() {
?>
<tr><td><b>Level</td><td><b>HP</td><td class="a3"><b>MP</td><td class="a4"><b>STR</td><td class="a5"><b>DEF</td><td class="a6"><b>AGI</td><td class="a7"><b>M.Att</td><td class="a8"><b>M.Def</td></tr>
<? }
?>
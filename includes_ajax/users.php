<?
$sql = "SELECT `id`, `name` FROM `classes`";
$result = runQuery($sql);
while ($row = mysql_fetch_assoc($result)) {
	$class_array[$row['id']] = $row['name'];
}

$sql = "SELECT `id`, `name` FROM `races`";
$result = runQuery($sql);
while ($row = mysql_fetch_assoc($result)) {
	$race_array[$row['id']] = $row['name'];
}

$sql = "SELECT `display_name`, `class_id`, `race_id`, `exp`, `isadmin`, `avatar_id`, `kills`, `description`, `joined` FROM `characters` ORDER BY `id`";
$result = runQuery($sql);
?><table cellpadding="0" cellspacing="1" id="users"><?
echo "<tr class=\"even\"><td>Name</td><td>Race</td><td>Class</td><td>Lv</td><td>DM</td><td width=\"16\"></td><td>Kills</td><td>Joined</td></tr>\n";
while ($row = mysql_fetch_assoc($result)) {
	if ($i++ % 2) { $data = "even"; } else { $data = "odd"; };
	
	echo "<tr class=\"$data\"><td>" . $row['display_name'] . "</td>\n";
	echo "<td>" . $race_array[$row['race_id']] . "</td>\n";
	echo "<td>" . $class_array[$row['class_id']] . "</td>\n";
	echo "<td>" . floor($row['exp'] / 1000) . "</td>\n";
	echo "<td>";
	if ($row['isadmin'])
		echo "+";
	else
		echo "-";
	echo "</td>\n";
	echo "<td><img src=\"images/avatars/" . $row['avatar_id'] . ".gif\"></td>\n";
	echo "<td>" . $row['kills'] . "</td>\n";
	echo "<td>" . date("M j, Y", strtotime($row['joined'])) . "</td>\n";
	echo "</tr>\n";
		if (!empty($row['description']))
	echo "<tr class=\"$data\"><td colspan=\"8\">" . $row['description'] . "</td></tr>\n";
}
echo "</table>\n";


?>
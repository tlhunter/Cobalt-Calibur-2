<?
if (isset($_SESSION['cc_user_id'])) {
refresh_attributes($_SESSION['cc_user_id']);

$sql = "SELECT * FROM `characters` WHERE `id` = " . $_SESSION['cc_user_id'] . " LIMIT 1";
$result = runQuery($sql);
$row = mysql_fetch_assoc($result);

function get_name_from_id($id, $string) {
	$sql = "SELECT `name` FROM `$string` WHERE `id` = $id";
	$result = runQuery($sql);
	$row = mysql_fetch_assoc($result);
	if (!empty($row['name']))
		return $row['name'];
	else
		return "Empty";
}
?>
<table>
<tr><td>username:</td><td><?=$row['username']?></td></tr>
<tr><td>displayname:</td><td><img src="images/avatars/<?=$row['avatar_id']?>.gif"> <?=$row['display_name']?></td></tr>
<tr><td>class:</td><td><? echo get_name_from_id($row['class_id'], "classes"); ?></td></tr>
<tr><td>race:</td><td><? echo get_name_from_id($row['race_id'], "races"); ?></td></tr>
<tr><td>level:</td><td><? echo floor($row['exp'] /1000); ?></td></tr>
<tr><td>exp/next:</td><td><? echo $row['exp'] . "/" . (1000 - ($row['exp'] - (floor($row['exp']/1000)*1000))) ?></td></tr>
<tr><td>health:</td><td><? echo $row['current_hp'] . "/" . $row['hp']; ?></td></tr>
<tr><td>magic:</td><td><? echo $row['current_mp'] . "/" . $row['mp']; ?></td></tr>
<tr><td>money:</td><td><?=$row['money']?>g</td></tr>
<tr><td>kills:</td><td><?=$row['kills']?></td></tr>
<tr><td>guild info:</td><td><? echo get_name_from_id($row['guild_id'], "guilds");?></td></tr>
<tr><td>weapon info:</td><td><? echo get_name_from_id($row['weapon_id'], "weapons"); ?></td></tr>
<tr><td>shield info:</td><td><? echo get_name_from_id($row['shield_id'], "shields"); ?></td></tr>
<tr><td>accessory info:</td><td><? echo get_name_from_id($row['accessory_id'], "accessories"); ?></td></tr>
<tr><td>strength:</td><td><?=$row['str']?></td></tr>
<tr><td>vitality:</td><td><?=$row['vit']?></td></tr>
<tr><td>agility:</td><td><?=$row['agi']?></td></tr>
<tr><td>wisdom:</td><td><?=$row['wis']?></td></tr>
<tr><td>intelligence:</td><td><?=$row['int']?></td></tr>

</table>
<? } ?>
<? session_start();

include('./includes_ajax/functions.ssi.php');
include('./includes_ajax/mysql.ssi.php');

if (isset($_GET['reset'])) {
	reset1and2();
}
if (isset($_GET['move'])) {
$user_id = $_SESSION['cc_user_id'];
	#get every tile id
	$sql = "SELECT * FROM `maps` WHERE `id` = (SELECT `map_id` FROM `map_locations` WHERE `player_id` = '" . $_SESSION['cc_user_id'] . "' LIMIT 1) LIMIT 1";
	$result = runQuery($sql);
	$map = mysql_fetch_assoc($result);
	$map_places = explode(",",$map['data']);
	
	$sql = "SELECT `x_pos`, `y_pos` FROM `map_locations` WHERE `player_id` = '" . $_SESSION['cc_user_id'] . "' LIMIT 1";
	$result = runQuery($sql);
	$row = mysql_fetch_assoc($result);
	$xmod = 0; $ymod = 0;
	if ($_GET['move'] == 'u')
		$ymod = -1;
	else if ($_GET['move'] == 'd')
		$ymod = 1;
	else if ($_GET['move'] == 'l')
		$xmod = -1;
	else if ($_GET['move'] == 'r')
		$xmod = 1;

	$new_x_pos = $row['x_pos'] + $xmod;
	$new_y_pos = $row['y_pos'] + $ymod;
	$new_xy_pos = $new_y_pos * $map['width'] + $new_x_pos;

	
	$sql = "SELECT `solid`, `teleport_id` FROM `map_tiles` WHERE `id` = '" . $map_places[$new_xy_pos] . "' LIMIT 1";
	$result = runQuery($sql);
	$special = mysql_fetch_assoc($result);
	if ($special['teleport_id']) {
		$sql = "SELECT * FROM `teleports` WHERE `id` = '" . $special['teleport_id'] . "'";
		$result = runQuery($sql);
		$row = mysql_fetch_assoc($result);
		$sql = "UPDATE `map_locations` SET
		`x_pos` = '" . $row['x_pos'] . "',
		`y_pos` = '" . $row['y_pos'] . "',
		`map_id` = '" . $row['map_id'] . "'
		WHERE `player_id` = '" . $_SESSION['cc_user_id'] . "'";
		runQuery($sql);
	
	
	} else if (!$special['solid']) {
		$x = "+0";
		$y = "+0";
		if ($_GET['move'] == 'u')
			$y = "-1";
		else if ($_GET['move'] == 'd')
			$y = "+1";
		else if ($_GET['move'] == 'l')
			$x = "-1";
		else if ($_GET['move'] == 'r')
			$x = "+1";
		
		$sql = "UPDATE `map_locations` SET
			`x_pos`=`x_pos`$x,
			`y_pos`=`y_pos`$y
			WHERE `player_id` = '" . $_SESSION['cc_user_id'] . "'";
		
		runQuery($sql);
	}

} else if (isset($_GET['terraform']) && ($_GET['terraform']) && $_SESSION['cc_isadmin']) {
	$sql = "SELECT * FROM `map_locations` WHERE `player_id` = '" . $_SESSION['cc_user_id'] . "' LIMIT 1";
	$result = runQuery($sql);
	$current_map_locations = mysql_fetch_assoc($result);
	
	$sql = "SELECT `id`, `data`, `width`, `height` FROM `maps` WHERE `id` = '" . $current_map_locations['map_id'] . "' LIMIT 1";
	$result = runQuery($sql);
	$current_map = mysql_fetch_assoc($result);
	
	$map_pieces = explode(",", $current_map['data']);
	
	if (!empty($_GET['tl'])) {
		$new_xy_pos = $current_map_locations['y_pos'] * $current_map['width'] + $current_map_locations['x_pos'] -1;
		$map_pieces[$new_xy_pos] = nukeNum($_GET['tl']);
	}
	if (!empty($_GET['tr'])) {
		$new_xy_pos = $current_map_locations['y_pos'] * $current_map['width'] + $current_map_locations['x_pos'] +1;
		$map_pieces[$new_xy_pos] = nukeNum($_GET['tr']);
	}
	if (!empty($_GET['tu'])) {
		$new_xy_pos = ($current_map_locations['y_pos']-1) * $current_map['width'] + $current_map_locations['x_pos'];
		$map_pieces[$new_xy_pos] = nukeNum($_GET['tu']);
	}
	if (!empty($_GET['td'])) {
		$new_xy_pos = ($current_map_locations['y_pos']+1) * $current_map['width'] + $current_map_locations['x_pos'];
		$map_pieces[$new_xy_pos] = nukeNum($_GET['td']);
	}
		$newdata = implode(",", $map_pieces);
	
	$sql = "UPDATE `maps` SET `data` = '$newdata' WHERE `id` = " . $current_map['id'] . " LIMIT 1";
	runQuery($sql);
	#echo $sql;

}
if (isset($_GET['grab'])) {
	if (isset($_GET['debug']))
		$debug = true;
	$sql = "SELECT `x_pos`, `y_pos`, `map_id` FROM `map_locations` WHERE `player_id` = '" . $_SESSION['cc_user_id'] . "' LIMIT 1";
	if ($debug) { echo "<pre>sql1\n$sql\n</pre>"; }###
	$result = runQuery($sql);
	$row = mysql_fetch_assoc($result);
	if ($debug) {echo "<pre>sql1\n"; print_r($row); echo "\n</pre>"; }###
	$sql = "SELECT `entity_id` FROM `map_locations` WHERE `x_pos` = '" . $row['x_pos'] . "' AND `y_pos` = '" . $row['y_pos'] . "' AND `map_id` = '" . $row['map_id'] . "' AND `player_id` = 0 LIMIT 1";
	$result = runQuery($sql);
	if (mysql_num_rows($result)) {
		if ($debug) {echo "<pre>sql1\n$sql\n</pre>";} ###
		$row2 = mysql_fetch_assoc($result);
		if ($debug) {echo "<pre>row2\n"; print_r($row2); echo "\n</pre>";} ###
		$sql = "INSERT INTO `entity_inventory` SET `user_id` = '" . $_SESSION['cc_user_id'] . "', `entity_id` = '" . $row2['entity_id'] . "', `quantity` = '1'";
		runQuery($sql);
		if ($debug) {echo "<pre>sql3\n$sql\n</pre>"; }###
		$sql = "DELETE FROM `map_locations` WHERE `x_pos` = '" . $row['x_pos'] . "' AND `y_pos` = '" . $row['y_pos'] . "' AND `map_id` = '" . $row['map_id'] . "' AND `player_id` = '0' AND `entity_id` = '" . $row2['entity_id'] . "' LIMIT 1";
		if ($debug) {echo "<pre>sql4\n$sql\n</pre>";} ###
		runQuery($sql);
	}
}

draw_map2($_SESSION['cc_user_id']);
	

	?>
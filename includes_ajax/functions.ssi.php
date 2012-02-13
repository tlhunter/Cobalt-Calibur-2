<?


function nukeAlphaNum($value) {
	return preg_replace("[^a-zA-Z0-9_]", "", $value);
}

function nukeAlpha($value) {
	return preg_replace("[^a-zA-Z]", "", $value);
}

function nukeWords($value) {
	return preg_replace("[^a-zA-Z ]", "", $value);
}

function nukeNum($value) {
	return preg_replace("[^0-9]", "", $value);
}

function nukeValidEmail($value) {
	if (pregi("^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$", $value))
		return true;
	else
		return false;
}

function logout() {
	unset($_SESSION['cc_username']);
	unset($_SESSION['cc_user_id']);
	unset($_SESSION['cc_isadmin']);
}


function draw_map2($user_id) {
	#This loads the map data, map width, and map height from the map that user_id is in
	$sql = "SELECT * FROM `maps` WHERE `id` = (SELECT `map_id` FROM `map_locations` WHERE `player_id` = $user_id LIMIT 1) LIMIT 1";
	$result = runQuery($sql);
	$map = mysql_fetch_assoc($result);
	$map_places = explode(",",$map['data']);
	
	#echo's the width and height of the map for our ajaxy parser.
	echo $map['width'] . "|" . $map['height'] . "|";
	

	
	#loads the player positions from the map.
	$sql = "SELECT x_pos, y_pos, player_id, entity_id FROM `map_locations` WHERE `map_id` = (SELECT `map_id` FROM `map_locations` WHERE `player_id` = $user_id LIMIT 1)";
	$result = runQuery($sql);
	$places = array();
	$i = 0;
	while ($row = mysql_fetch_assoc($result)) {
		$places[$i]['id'] = $row['player_id'];
		$places[$i]['entity_id'] = $row['entity_id'];
		$places[$i]['x'] = $row['x_pos'];
		$places[$i]['y'] = $row['y_pos'];
		$i++;
	}
	#returns comma seperated values of the map tiles
	for($i=0; $i<$map['height']; $i++) {
		for ($j=0; $j<$map['width']; $j++) {
			$person = 0;
			$entity = 0;
			for ($k = 0; $k<(count($places)); $k++) {
				if (($places[$k]['x'] == $j) && ($places[$k]['y'] == $i)) {
					if ($places[$k]['id'] >= 1) {
						$sql = "SELECT `avatar_id` FROM `characters` WHERE `id` = '" . $places[$k]['id'] . "' LIMIT 1";
						$result = runQuery($sql);
						$row = mysql_fetch_assoc($result);
						$person++;
					} else if ($places[$k]['entity_id'] >= 1) {
						$sql = "SELECT `type`, `thing_id` FROM `entities` WHERE `id` = '" . $places[$k]['entity_id'] . "' LIMIT 1";
						$result = runQuery($sql);
						$row2 = mysql_fetch_assoc($result);
						$entity++;
					}
				}
			}
			if ($person == 1) {
				echo ($row['avatar_id'] + 1000) . ",";
			} else if ($entity == 1) {
				#types 1=item(2000), 2=weapon(3000), 3=shields(4000), 4=accessories(5000)
				echo (1000+1000*$row2['type']+$row2['thing_id']) . ",";
			} else if ($person > 1) {
				echo "1000,";
			} else if ($entity > 4) {
				echo "2000.5,";
			} else if ($entity > 1) {
				echo "2000,";
			} else {
					$value = (($i)*$map['width']+($j));
					echo $map_places[$value] . ",";
				}
		}
	}
	echo "|" . $map['name'];
}

function create_race_selection($default) {
	$sql = "SELECT `id`, `name`, `description` FROM `races`";
	$result = runQuery($sql);
    echo "<table cellpadding=\"0\" cellspacing=\"0\" id=\"race\">\n";
	echo "<tr><td colspan=\"2\"><h3>Select your Race:</h3></td></tr>\n";
    while ($row = mysql_fetch_assoc($result)) {
		echo "<tr><td width=\"70\"><input type=\"radio\" ";
		if ($row['id'] == $default)
			echo "checked=\"yes\" ";
		echo "name=\"race\" value=\"" . $row['id'] . "\">" . $row['name'] . "</td><td>";
		echo $row['description'];
		echo "</td></tr>\n";   
    }
    echo "</table>\n";
}

function create_class_selection($default) {
	$sql = "SELECT `id`, `name`, `description` FROM `classes`";
	$result = runQuery($sql);
    echo "<table cellpadding=\"0\" cellspacing=\"0\" id=\"class\">\n";
	echo "<tr><td colspan=\"2\"><h3>Select your Class:</h3></td></tr>\n";
    while ($row = mysql_fetch_assoc($result)) {
		echo "<tr><td width=\"70\"><input type=\"radio\" ";
		if ($row['id'] == $default)
			echo "checked=\"yes\" ";
		echo "name=\"class\" value=\"" . $row['id'] . "\">" . $row['name'] . "</td><td>";
		echo $row['description'];
		echo "</td></tr>\n";   
    }
    echo "</table>\n";
}

function create_avatar_selection($default) {
	$sql = "SELECT * FROM `avatars`";
	$result = runQuery($sql);
    echo "<table cellpadding=\"0\" cellspacing=\"0\" id=\"avatar\">\n";
	echo "<tr><td colspan=\"3\"><h3>Select your Avatar:</h3></td></tr>\n";
    while ($row = mysql_fetch_assoc($result)) {
		echo "<tr><td width=\"110\"><input type=\"radio\" ";
		if ($row['id'] == $default)
			echo "checked=\"yes\" ";
		echo "name=\"avatar\" value=\"" . $row['id'] . "\">" . $row['title'] . "</td>\n";
		echo "<td><img src=\"images/avatars/" . $row['id'] . ".gif\"></td>\n<td>";
		echo $row['description'];
		echo "</td></tr>\n";   
    }
    echo "</table>\n";
}

function refresh_attributes($user_id) {
	if ($user_id == 0)
		$user_id = $_SESSION['cc_user_id'];
	
	if (!$user_id) {
		echo "No User defined!\n";
		return 0;
	}


	$attributes = array('hp', 'mp', 'str', 'vit', 'agi', 'wis', 'int');
	
	
	$sql = "SELECT `exp`, `race_id`, `class_id`, `weapon_id`, `shield_id`, `accessory_id`";
	
	for ($i = 0; $i < sizeof($attributes); $i++)
		$sql .= ", `" . $attributes[$i] . "_mod_z`";
		
	$sql .= " FROM `characters` WHERE `id` = $user_id LIMIT 1";

	#echo $sql;
	$result = runQuery($sql);
	$row['z1'] = mysql_fetch_assoc($result);
	
	if (sizeof($row['z1']) < 2) {
		echo "User does not exist!";
		return 0;
	}
	$row['z1']['level'] = floor($row['z1']['exp'] / 1000);

	#echo "<pre>z1\n";
	#print_r($row['z1']);
	#echo "</pre>";
	
	
	
	
	
	$sql = "SELECT ";
	for ($i = 0; $i < sizeof($attributes); $i++) {
		if ($i) $sql .= ", ";
		$sql .= "`" . $attributes[$i] . "_mod_y`";
	}
	$sql .= " FROM `classes` WHERE `id` = " . $row['z1']['class_id'] . " LIMIT 1";
	#echo $sql;
	$result = runQuery($sql);
	$row['y'] = mysql_fetch_assoc($result);
	#echo "<pre>y\n";
	#print_r($row['y']);
	#echo "</pre>";
	
	
	
	
	$sql = "SELECT ";
	for ($i = 0; $i < sizeof($attributes); $i++) {
		if ($i) $sql .= ", ";
		$sql .= "`" . $attributes[$i] . "_mod_x`";
	}
	$sql .= " FROM `races` WHERE `id` = " . $row['z1']['race_id'] . " LIMIT 1";
	#echo $sql;
	$result = runQuery($sql);
	$row['x'] = mysql_fetch_assoc($result);
	#echo "<pre>x\n";
	#print_r($row['x']);
	#echo "</pre>";
	
	
	$sql = "SELECT ";
	for ($i = 0; $i < sizeof($attributes); $i++) {
		if ($i) $sql .= ", ";
		$sql .= "`" . $attributes[$i] . "_mod_z`";
	}
	$sql .= " FROM `shields` WHERE `id` = " . $row['z1']['shield_id'] . " LIMIT 1";
	#echo $sql;
	$result = runQuery($sql);
	$row['z2'] = mysql_fetch_assoc($result);
	#echo "<pre>z2\n";
	#print_r($row['z2']);
	#echo "</pre>";
	
	
	
	
	$sql = "SELECT ";
	for ($i = 0; $i < sizeof($attributes); $i++) {
		if ($i) $sql .= ", ";
		$sql .= "`" . $attributes[$i] . "_mod_z`";
	}
	$sql .= " FROM `weapons` WHERE `id` = " . $row['z1']['weapon_id'] . " LIMIT 1";
	#echo $sql;
	$result = runQuery($sql);
	$row['z3'] = mysql_fetch_assoc($result);
	#echo "<pre>z3\n";
	#print_r($row['z3']);
	#echo "</pre>";
	
	
	
	$sql = "SELECT ";
	for ($i = 0; $i < sizeof($attributes); $i++) {
		if ($i) $sql .= ", ";
		$sql .= "`" . $attributes[$i] . "_mod_z`";
	}
	$sql .= " FROM `accessories` WHERE `id` = " . $row['z1']['accessory_id'] . " LIMIT 1";
	#echo $sql;
	$result = runQuery($sql);
	$row['z4'] = mysql_fetch_assoc($result);
	#echo "<pre>z4\n";
	#print_r($row['z4']);
	#echo "</pre>";
	
	for ($i = 0; $i < sizeof($attributes); $i++) {
		$stringX = $attributes[$i] . "_mod_x";
		$stringY = $attributes[$i] . "_mod_y";
		$stringZ = $attributes[$i] . "_mod_z";
		$final[$attributes[$i]] = floor($row['z1']['level'] * $row['z1']['level'] * $row['x'][$stringX] + $row['z1']['level'] * $row['y'][$stringY] + $row['z1'][$stringZ] + $row['z2'][$stringZ] + $row['z3'][$stringZ] + $row['z4'][$stringZ]);
	}
	#echo "<pre>final\n";
	#print_r($final);
	#echo "</pre>";
	
	
	$sql = "UPDATE `characters` SET ";
	for ($i = 0; $i < sizeof($attributes); $i++) {
		if ($i) $sql .= ", ";
		$sql .= "`" . $attributes[$i] . "` = " . $final[$attributes[$i]];
	}
	$sql .= " WHERE `id` = " . $user_id . " LIMIT 1";
	
	#echo $sql;
	runQuery($sql);
}
?>

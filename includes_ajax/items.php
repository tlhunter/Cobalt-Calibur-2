<?
if (!isset($_SESSION['cc_user_id']) || empty($_SESSION['cc_user_id']))
	die("<div class=\"error\">Login First</div>\n");
$sql = "SELECT * FROM `entity_inventory` WHERE `user_id` = " . $_SESSION['cc_user_id'];
$result = runQuery($sql);
$i=0;
while ($row = mysql_fetch_assoc($result)) {
	$items[$i++] = $row['entity_id'];
	$items_count[$i] = $row['quantity'];
}
#print_r($items);

if ($i) {
	$sql = "SELECT `type`, `thing_id` FROM `entities` WHERE ";
	for ($i = 0; $i < sizeof($items); $i++) {
		$sql .= "`id` = '" . $items[$i] . "'";
		if ($i != (sizeof($items)-1)) $sql .= " OR ";
	}
	$sql .= "";
	$result = runQuery($sql);
	$t1=0; $t2=0; $t3=0; $t4=0; $k=0;
	while ($rows = mysql_fetch_assoc($result)) {
		print_entity($rows['type'], $rows['thing_id'], $items_count[$k++]);
		/*
		if ($rows['type'] == 1)
			$inventory[$rows['type']][$t1++] = $rows['thing_id'];
		else if ($rows['type'] == 2)
			$inventory[$rows['type']][$t2++] = $rows['thing_id'];
		else if ($rows['type'] == 3)
			$inventory[$rows['type']][$t3++] = $rows['thing_id'];
		else if ($rows['type'] == 4)
			$inventory[$rows['type']][$t4++] = $rows['thing_id'];
		else
			echo "Entity Type Error!\n";
		*/
	}
	#echo "<pre>"; print_r($inventory); echo "</pre>";
}

function print_entity($type, $id, $amount) {
	if ($type == 1)
		$x = 'items';
	else if ($type == 2)
		$x = 'weapons';
	else if ($type == 3)
		$x = 'shields';
	else if ($type == 4)
		$x = 'accessories';
	else
		return 0;
	$sql = "SELECT `name`, `id` FROM `$x` WHERE `id` = '$id' LIMIT 1";
	$result = runQuery($sql);
	$row = mysql_fetch_assoc($result);
	echo "<img src=\"images/$x/$id.gif\">" . $row['name'] . "(" . $amount . ")<br />\n";
}
?>
<?php
 if (isset($_GET['x'])) {
	if (strlen(nukeAlphaNum($_POST['username'])) < 1)
		echo "<div class=\"error\">Please enter a username. <a href=\"?s=register\">Try Again</a>.</div>\n";
	else if ($_POST['password'] != $_POST['password2'])
		echo "<div class=\"error\">The two passwords entered do not match. <a href=\"?s=register\">Try Again</a>.</div>\n";
	else if ($_POST['class'] < 1)
		echo "<div class=\"error\">You did not enter a valid class. <a href=\"?s=register\">Try Again</a>.</div>\n";
	else if ($_POST['race'] < 1)
		echo "<div class=\"error\">You did not enter a valid race. <a href=\"?s=register\">Try Again</a>.</div>\n";
	else if ($_POST['avatar'] < 2)
		echo "<div class=\"error\">You did not enter a valid avatar. <a href=\"?s=register\">Try Again</a>.</div>\n";
	else if (strlen($_POST['password']) < 6)
		echo "<div class=\"error\">Password must be at least 6 characters. <a href=\"?s=register\">Try Again</a>.</div>\n";
	else {
			
		$sql = "INSERT INTO `characters` SET 
			`username` = '" . nukeAlphaNum($_POST['username']) . "',
			`password` = '" . sha1($_POST['password']) . "',
			`display_name` = '" . htmlentities($_POST['displayname']) . "',
			`race_id` = '" . nukeNum($_POST['race']) . "',
			`class_id` = '" . nukeNum($_POST['class']) . "',
			`avatar_id` = '" . nukeNum($_POST['avatar']) . "',
			`exp` = 8600, `money` = 1000, `last_login` = NOW(),
			`description` = '" . htmlentities($_POST['bio']) . "'";
		$result = runQuery($sql);
		if ($result) {
			echo "<p>Account <b>" . nukeAlphaNum($_POST['username']) . "</b> created. Feel free to <a href=\"?s=home\">Log In</a>.</p>";
			$row = mysql_fetch_assoc(runQuery("SELECT LAST_INSERT_ID() as 'count'"));
			#echo $row['count'];
			$sql = "INSERT INTO `map_locations` SET
			`player_id` = " . $row['count'] . ",
			`x_pos` = 6,
			`y_pos` = 3,
			`map_id` = 2";
			runQuery($sql);
			refresh_attributes($row['count']);
		} else {
			echo "<div class=\"error\">Error creating account. Either username is taken or I made a typo. <a href=\"?s=register\">Try again</a>.</div>";
		}
	}
} else {
	?>

<b>Register a new user</b><br />

<div id="register">
<form action="?s=register<? if (isset($_GET['bypass'])) echo "&bypass"; ?>&x" method="post">
<div class="r"><span class="r1">User (Login) Name:</span><span class="r2"><input type="text" name="username" class="text"></span></div>
<div class="r"><span class="r1">Display Name:</span><span class="r2"><input type="text" name="displayname" class="text"></span></div>
<div class="r"><span class="r1">Password:</span><span class="r2"><input type="password" name="password" class="text"></span></div>
<div class="r"><span class="r1">Verify Pass:</span><span class="r2"><input type="password" name="password2" class="text"></span></div>

<?
create_race_selection(1);
create_class_selection(1);
create_avatar_selection(11);
?>
<h3>Quick description of your character (optional)</h3>
<textarea name="bio" cols="40" rows="10"></textarea>

<div class="r"><span class="r1"><input type="submit" name="Submit" value="Submit" class="button"></span></div>
</form>
</div>

	<?
}
?>
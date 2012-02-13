<?php
if (isset($_POST['username'])) {
	$username = nukeAlphaNum($_POST['username']);
	$password = sha1($_POST['password']);
	$sql="SELECT * FROM `characters` WHERE  `username` = '$username' AND `password` = '$password'";
	$result = runQuery($sql);
	if (mysql_num_rows($result) == 1) {
		$userInfo = mysql_fetch_array($result);
		$_SESSION['cc_username'] = $userInfo['username'];
		$_SESSION['cc_user_id'] = nukeNum($userInfo['id']);
		$_SESSION['cc_isadmin'] = nukeNum($userInfo['isadmin']);
		echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0; URL=?s=map\" />";
	} else {
		echo "<div class=\"error\">Login failed for user: $username.</div>";
	}
}
?>
You now have to make an account to play. This takes 3 seconds to do and doesn't requre any personal info. Feel free to make a billion accounts and break this site as much as possible. If anything breaks I can fix it, just email me at <u>Nucleocide AT gmail DOT com</u>.<br /><br />
Unfortunately, due to a bug in firefox's javascript string concatination, the map part of this game works best in IE. This isn't always the case as some slow machines run CC fine whereas my faster machines do not. You can download <a href="https://addons.mozilla.org/firefox/1419/">IE Tab</a> which is a plugin to run IE in your firefox window. (movement keys do not currently work in firefox.<br /><br />
If any of you would like to design levels, would like to design tiles/characters, or know of a good & free place to get 16x16 tiles, give me a shout (-:.
<h3>Login</h3>
<form method="post">
Username: <input name="username" /><br />
Password: <input type="password" name="password" /><br />
<input name="submit" value="submit" type="submit" /><br />
</form>
<br />
(Site is quite unstylized and ugly. The ugliness is not a bug.)<br /><br />
(Points to anyone who finds any XSS or SQL injection vulnerabilities.)
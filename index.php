<? session_start();

include('./includes_ajax/functions.ssi.php');
include('./includes_ajax/mysql.ssi.php');


$nuke['s'] = isset($_GET['s']) ? nukeAlphaNum($_GET['s']) : "home";

$inclusion = './includes_ajax/' . $nuke['s'] . '.php';

if (file_exists($inclusion))						#section_name.php takes priority.
	$nuke['section_type'] = 'file';
else
	$nuke['section_type'] = 'error';				#if neither exists somebody made a typo
	
if ($nuke['s'] == 'logout')
	logout();
	
	
?>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
<title>Cobalt Calibur 2.0 : <? echo ucwords($nuke['s']); ?></title>
</head>
<body>
<div id="container">
<div id="header"><h1>Cobalt Calibur 2.0</h1><div><?
if (isset($_SESSION['cc_username']))
	echo "Logged in as " . $_SESSION['cc_username'] . ". <a href=\"?s=logout\">Logout</a>. ";
else
	echo "Welcome, guest. ";

?></div></div>
<div id="nav">
<a href="?s=home"><span>Login</span></a>
<a href="?s=register"><span>Create Account</span></a>
<a href="?s=map"><span>Map</span></a>
<a href="?s=items"><span>Items</span></a>
<a href="?s=magic"><span>Magic</span></a>
<a href="?s=equip"><span>Equipment</span></a>
<a href="?s=stats"><span>Stats</span></a>
<a href="?s=settings"><span>Settings</span></a>
<a href="?s=chat"><span>Chat</span></a>
<a href="?s=users"><span>Users</span></a>
<a href="http://www.nucleocide.net"><span>Nucleocide.net</span></a>
</div>
<div id="content">
<?
	if ($nuke['section_type'] == 'error')
		echo '<div class="error">The section <b>' . $nuke['s'] . "</b> does not exist.</div>\n";
	else if ($nuke['section_type'] == 'file')
		include_once($inclusion);
?>
</div>




</div>
</body>
</html>
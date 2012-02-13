<?php
function runQuery($query) {
$mySqlServer = 'localhost';
$mySqlUser = 'cobalt';
$mySqlPass = 'yaWfJXayCSUATPjA';
$mySqlDB = 'cobaltcalibur';
	$connect = mysql_connect($mySqlServer, $mySqlUser, $mySqlPass);
        if (!$connect) {die("<div class=\"error\">" . mysql_error() . "</div>");}
	mysql_select_db($mySqlDB, $connect);
        $result = mysql_query($query, $connect);
	return $result;
}
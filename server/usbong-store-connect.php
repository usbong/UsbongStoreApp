<?php
//define('BASEPATH', base_url());
define('BASEPATH', "https://store.usbong.ph");
//typically, webroot would be in /var/www/html/
include('/put_this_somewhere_outside_of_web_root/app+server/database.php');

// server info
$server = $db['hostname']; //'mysql10.000webhost.com';
$user = $db['username'];
$pass = $db['password'];
$db = $db['database'];

// connect to the database
$mysqli = new mysqli($server, $user, $pass, $db);

// show errors (remove this line if on a live site)
mysqli_report(MYSQLI_REPORT_ERROR);
?>
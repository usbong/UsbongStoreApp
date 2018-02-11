<?php
//define('BASEPATH', base_url());
define('BASEPATH', "https://store.usbong.ph");
include('/var/www/html/application/config/database.php');
//include('application/config/config.php');

//include(APPPATH.'config/database'.EXT);

/*
$CI =& get_instance();
$ci->config->load('database');

//$this->load->database();

// server info
$server = $CI->db->hostname; //'mysql10.000webhost.com';
$user = $CI->db->username;
$pass = $CI->db->password;
$db = $CI->db->database;
*/

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
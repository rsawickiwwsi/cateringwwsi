<?php
$currency = 'PLN; '; 

$db_username = 'root';
$db_password = '';
$db_name = 'test';
$db_host = 'localhost';

$shipping_cost      = 2; 
$taxes              = array( 
                            'Proponowany napiwek' => 5
                            );						
//connect to MySql						
$mysqli = new mysqli($db_host, $db_username, $db_password,$db_name);						
if ($mysqli->connect_error) {
    die('Error : ('. $mysqli->connect_errno .') '. $mysqli->connect_error);
}
?>
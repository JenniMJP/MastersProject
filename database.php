<?php

session_start();

$DB_host = "localhost" ;
$DB_user = "icadm";
$DB_pass = "o4!sCCi,Q88g";
$DB_name = "innercompass";

try
{
     $DB_con = new PDO("mysql:host={$DB_host};dbname={$DB_name}",$DB_user,$DB_pass, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
     $DB_con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch(PDOException $e)
{
     echo $e->getMessage();
}

include_once 'class.user.php';
$user = new USER($DB_con);
?>

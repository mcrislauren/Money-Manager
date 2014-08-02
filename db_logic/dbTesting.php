<?php
require('dbData.php');
$mysqli = new mysqli(HOST, USERNAME, PASSWORD, DATABASE);
if ($mysqli->connect_errno)
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
if($result = $mysqli->query("Select * from Users"))
{
    printf("Num of rows = %d\n", $result->num_rows);
    $result->close();
}
$mysqli->close();
?>

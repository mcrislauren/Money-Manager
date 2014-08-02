<?php
require(__DIR__.'/db_controllers/Users.php');

$users_c = new Users_controller();
$users = $users_c->getAllUsers();

echo "<table border=\"1\">";

for ( $i = 0; $i < sizeof($users); $i++)
{
    $user = $users[$i];
    echo "<tr>";
    echo "<td>$user->ID</td>";
    echo "<td>$user->first_name</td>";
    echo "<td>$user->last_name</td>";
    echo "<td>$user->email</td>";
    echo "<td>$user->password</td>";
    echo "<td>$user->added_time</td>";
    echo "<td>$user->modified_time</td>";
    echo "<td>$user->deleted_time</td>";
    echo "</tr>";
}

echo "</table>";
?>

<?php
require(__DIR__.'/../db_containers.php');
require(__DIR__.'/../dbData.php');

class Users_controller
{
    public function getAllUsers()
    {
        $users = array();
        $mysqli = new mysqli(HOST, USERNAME, PASSWORD, DATABASE);
        if ($mysqli->connect_errno)
            echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
        if($result = $mysqli->query("Select * from Users"))
        {
            while ($row = $result->fetch_assoc())
            {
                $user = new User();
                $user->ID = $row["ID"];
                $user->first_name = $row["First_Name"];
                $user->last_name = $row["Last_Name"];
                $user->email = $row["Email"];
                $user->password = $row["Password"];
                $user->added_time = $row["Added_time"];
                $user->modified_time = $row["Modified_time"];
                $user->deleted_time = $row["Deleted_time"];

                array_push($users, $user);
            }
            $result->close();
        }
        $mysqli->close();

        return $users;
    }

    public function getUser($userID)
    {
        return $user;
    }

    public function addUser($user)
    {
        return FALSE;
    }

    public function editUser($user)
    {
        return FALSE;
    }

    public function deleteUser($user)
    {
        // not actual delete, just maked as deleted in the DB
        return FALSE;
    }
}

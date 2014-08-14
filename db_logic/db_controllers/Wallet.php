 <?php
require(__DIR__.'/../db_containers.php');
require(__DIR__.'/../dbData.php');

class Wallet_controller
{
    public function getAllWallets()
    {
        $users = array();
        $mysqli = new mysqli(HOST, USERNAME, PASSWORD, DATABASE);
        if ($mysqli->connect_errno)
            echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
        if($result = $mysqli->query("Select * from Wallets"))
        {
            while ($row = $result->fetch_assoc())
            {
                $user = new User();
                $user->ID = $row["ID"];
                $user->name = $row["Name"];
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

    public function getWalletID($user)
    {
        return $user;
    }

    public function addWallet($user)
    {
        return FALSE;
    }

    public function editWallet($user)
    {
        return FALSE;
    }

    public function deleteWallet($user)
    {
        // not actual delete, just maked as deleted in the DB
        return FALSE;
    }
}

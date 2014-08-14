 <?php
require(__DIR__.'/../db_containers.php');
require(__DIR__.'/../dbData.php');

class Transactions_controller
{
    public function getAllTransactions()
    {
        $users = array();
        $mysqli = new mysqli(HOST, USERNAME, PASSWORD, DATABASE);
        if ($mysqli->connect_errno)
            echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
        if($result = $mysqli->query("Select * from Transactions"))
        {
            while ($row = $result->fetch_assoc())
            {
                $user = new User();
                $user->ID = $row["ID"];
                $user->Time_T = $row["Time"];
                $user->Date_T = $row["Date"];
                $user->User_ID = $row["User_ID"];
                $user->Wallet_ID = $row["Wallet_ID"];
                $user->Ammount = $row["Ammount"];
                $user->Status = $row["Status"];
                $user->Discription = $row["Discription"];

                array_push($users, $user);
            }
            $result->close();
        }
        $mysqli->close();

        return $users;
    }

    public function getTransaction($userID)
    {
        return $user;
    }

    public function addTransaction($user)
    {
        return FALSE;
    }

    public function editTransaction($user)
    {
        return FALSE;
    }

    public function deleteTransaction($user)
    {
        // not actual delete, just maked as deleted in the DB
        return FALSE;
    }
}

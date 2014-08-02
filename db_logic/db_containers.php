<?php
class User {
    public $ID;
    public $first_name;
    public $last_name;
    public $email;
    public $password;
    public $added_time;
    public $modified_time;
    public $deleted_time;

    public $wallets = array();
    public $transactions = array();
}
class Wallet {
    public $ID;
    public $name;
    public $description;
    public $added_time;
    public $modified_time;
    public $deleted_time;

    public $users = array();
    public $transactions = array();
}
class Transaction {
    public $ID;
    public $time;
    public $date;
    public $amount;
    public $status;
    public $description;

    public $attachments = array();
    public $user;
    public $wallet;
}
class Attachment {
    public $ID;

    public $transaction;
}
class Category {
    public $ID;
    public $name;
    public $description;

    public $transactions = array();
}
class Subcategory {
    public $ID;
    public $name;
    public $description;

    public $category;
}
?>

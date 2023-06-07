<?php
class User {
    function __construct(private $n_bill,public $date_bill, private $seller,  private $id_client, private $name_client, private $email_client, private $address, private $phone_number){}
    
}
?>
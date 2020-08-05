<?php
require  ROOT . 'libs/rb.php' ;

$db = R::setup('mysql:host=' . DB_HOST . ';dbname='. DB_NAME , DB_USER, DB_PASSWORD );
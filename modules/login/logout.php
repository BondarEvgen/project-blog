<?php

// echo '<h1>lalal</h1>';



unset( $_SESSION[ 'logged_user' ] );

unset( $_SESSION[ 'login' ] );

unset( $_SESSION[ 'role' ] );

// echo '<pre>';
// print_r($_SESSION);
// echo '<pre>';

session_destroy();

setcookie( session_name(), '', time() - 60, '/' );

header('Location: ' . HOST );



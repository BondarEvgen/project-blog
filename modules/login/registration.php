<?php

$pageTitle = "Registration page";
$pageClass = "authorization-page";

if (isset( $_POST[ 'registration' ] ) ) {
  if( trim ( $_POST[ 'email' ]) == '' ) {
    $_SESSION[ 'errors' ][] = [ 'title' => 'Enter Email please', 'disc' => 'This is required fild' ];
  }
  else if ( !filter_var( $_POST[ 'email' ], FILTER_VALIDATE_EMAIL )) {
    $_SESSION[ 'errors' ][] =  [ 'title' => 'Email is incorect' ];
    
  }

  if( trim ( $_POST[ 'password' ]) == '' ) {
    $_SESSION[ 'errors' ][] = [ 'title' => 'Enter Password please' ]; 
  } 
  if ( strlen( trim( $_POST[ 'password' ] ) ) < 4 ) {
    $_SESSION[ 'errors' ][] = [ 'title' => 'Password length mast not be less than 4 simbols' ];
  }

  
  if ( R::count( 'users', 'email = ?', array( $_POST[ 'email' ] )) > 0 ) {
    $_SESSION[ 'errors' ][] = [
       'title' => 'This Email already exists',
       'disc' => 'Use another Email or use <a href="' . HOST . 'lost-password"> password recovery</a>'
      ];
  }

  if ( empty( $_SESSION[ 'errors' ] ) ) {

    $user = R::dispense( 'users' );
    $user->email = $_POST[ 'email' ];
    $user->role = 'user';
    $user->password =  password_hash( $_POST[ 'password' ], PASSWORD_DEFAULT );
    $result = R::store( $user );

    if( is_int( $result ) ) {
      $_SESSION[ 'success' ][] = [ 'title' => 'You are succesfuly registred' ];

      // Auto login user after registration 
      $_SESSION[ 'logged_user'] =  $user ;
      $_SESSION[ 'login' ] = 1;
      $_SESSION[ 'role' ] = $user->role ;

      header( 'Location: ' . HOST . 'profile-edit');

      exit();

    } else {
      $_SESSION[ 'errors' ][] = [ 'title' => 'Something was wrong'];
    }

  }

}

ob_start();

include ROOT . 'templates/login-page/form-registration.tpl';

$content = ob_get_contents();
ob_end_clean();

include ROOT . "templates/_page-parts/_head.tpl";
include ROOT . "templates/login-page/login.tpl";
include ROOT . "templates/_page-parts/_foot.tpl";

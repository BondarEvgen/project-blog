<?php

$pageTitle = "Enter page";
$pageClass = "authorization-page";

if( isset( $_POST[ 'login' ] ) ) {
  if( trim( $_POST[ 'email' ] == '' ) ) {
    $_SESSION[ 'errors' ][] = ['title' => 'Enter Email please', 'disc' => 'This is require fild'];
  }

  if( trim( $_POST[ 'password' ] == '') ) {
    $_SESSION[ 'errors' ][] = [ 'title' => 'Enter Password please'];
  }

  if( empty( $_SESSION[ 'errors' ] ) ) {
    $user = R::findOne( 'users', 'email = ?', array( $_POST[ 'email' ] ) );

      if( $user ){
        if( password_verify( $_POST[ 'password' ], $user->password ) ) {
          
        $_SESSION[ 'logged_user'] =  $user ;
        $_SESSION[ 'login' ] = 1;
        $_SESSION[ 'role' ] = $user->role ;

        $_SESSION[ 'success' ][] = [ 'title' => 'We happy to see you again'];

        header( 'Location: ' . HOST . 'profile');

        exit();


        }
        else {
          $_SESSION[ 'errors' ][] = [ 'title' => 'Wrong Password' ];
        }
      }
      else {
        $_SESSION[ 'errors' ][] = [ 'title' => 'No such user registered' ];
      }

  }
}

ob_start();

include ROOT . 'templates/login-page/form-login.tpl';

$content = ob_get_contents();
ob_end_clean();

include ROOT . "templates/_page-parts/_head.tpl";
include ROOT . "templates/login-page/login.tpl";
include ROOT . "templates/_page-parts/_foot.tpl";

<?php

$pageTitle = "Set new password";
$pageClass = "authorization-page";

if( isset( $_GET[ 'email' ] ) ) {

  $user = R::findOne( 'users', 'email = ?', array( $_GET[ 'email'] ) );

  if( $user->email == $_GET[ 'email' ]){
    if( $user->recovery_code == $_GET[ 'code' ] && $user->recovery_code != '' && $user->recovery_code != NULL ) {

      if( isset( $_POST[ 'lost-password' ] ) ) {

        $user->password = password_hash( $_POST[ 'password' ], PASSWORD_DEFAULT );
        $user->recovery_code = '';
        $result = R::store( $user );
        if( $result ) {
         $newPasswordReady = true;
         $_SESSION[ 'success' ][] = [ 'title' => 'New password was set successfully' ];
        }
      }
    
    }
    else {
      $_SESSION[ 'errors' ][] = [ 'title' => 'Recovery code mismatch' ];
    }
  }
  else {
    $_SESSION[ 'errors' ][] = [ 'title' => 'No such user find' ];
  } 
}

if ( !empty( $_SESSION[ 'errors' ] ) ) {
  header( 'Location: ' . HOST . 'lost-password' );
  die();
}

ob_start();

include ROOT . 'templates/login-page/form-set-new-password.tpl';

$content = ob_get_contents();
ob_end_clean();

include ROOT . "templates/_page-parts/_head.tpl";
include ROOT . "templates/login-page/login.tpl";
include ROOT . "templates/_page-parts/_foot.tpl";
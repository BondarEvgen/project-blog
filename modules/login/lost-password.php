<?php

$pageTitle = "Password recovery";
$pageClass = "authorization-page";

if( isset( $_POST[ 'lost-password' ] ) ) {
 
  $_POST[ 'email' ] = trim( $_POST[ 'email' ] );

  if( $_POST[ 'email' ] == ''  ) {
    $_SESSION[ 'errors' ][] = ['title' => 'Enter Email please', 'disc' => 'This is require fild'];
  } 
  else if ( !filter_var( $_POST[ 'email' ], FILTER_VALIDATE_EMAIL ) ) {
    $_SESSION[ 'errors' ][] = ['title' => 'Enter correct Email please'];
  }

  if( empty( $_SESSION[ 'errors' ] ) ) {
    $user = R::findOne( 'users', 'email = ?', array( trim( $_POST[ 'email' ] ) ) );

      if( $user ){

        function rundom_str ($num = 30) {

           return  substr( str_shuffle( '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ' ), 0, $num );
        }

        $recovery_code = rundom_str();
        $user->recovery_code = $recovery_code;
        R::store( $user);

        // Send email to user

        $recovery_message = "<p>Password recovery code: <b>$recovery_code</b></p>";
        $recovery_message .= "<p>To reset your password, follow link below and set a new password</p>";

        $recovery_link = HOST . "set-new-password?email={$_POST[ 'email' ]}&code={$recovery_code}";
        $recovery_message .= '<p><a href="' . $recovery_link . '">Set new password</a></p>';

        $headers = "MIME-Version: 1.0" . PHP_EOL .
                    "Content-Type: text/html; charset=utf-8" . PHP_EOL .
                    "From: " . "=?utf-8?B?" . base64_encode( SITE_NAME ) . "?=" . "<" . SITE_EMAIL . ">" . PHP_EOL .
                    "Reply-To: ". SITE_EMAIL . PHP_EOL;

       $result_mail = mail( $_POST[ 'email' ], 'Access recovery', $recovery_message, $headers);

       if( $result_mail ){
        $_SESSION[ 'success' ][] = ['title' => 'Recovery letter was sent', 'disc' => 'Check your email please'];
       } 
       else {
        $_SESSION[ 'errors' ][] = [ 'title' => 'Some thing went wrong', 'disc' => 'Repeat procedure password recovery'];
       }

      }
      else {
        $_SESSION[ 'errors' ][] = [ 'title' => 'No such user registered' ];
      }
  }
}

ob_start();

include ROOT . 'templates/login-page/form-lost-password.tpl';

$content = ob_get_contents();
ob_end_clean();

include ROOT . "templates/_page-parts/_head.tpl";
include ROOT . "templates/login-page/login.tpl";
include ROOT . "templates/_page-parts/_foot.tpl";
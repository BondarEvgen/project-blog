<?php



if( isset( $_SESSION[ 'login' ] ) && $_SESSION[ 'login' ] === 1 ) {
  if ( $_SESSION[ 'role' ] === 'user' || $_SESSION[ 'role' ] === 'admin' ) {

    if( isset( $uriGet ) ) {

      if( $_SESSION[ 'role' ] === 'admin' ) {

        $user = R::load( 'users', $uriGet );

        if($user['id'] == 0 ) {
          $userNotFound = true;
        }
      }

      if( $_SESSION[ 'role' ] === 'user' ) {
        $user = R::load( 'users', $_SESSION[ 'logged_user' ][ 'id' ] );
      }
    } 
    else {
      $user = R::load( 'users', $_SESSION[ 'logged_user' ][ 'id' ] );
    }

     if( isset( $_POST[ 'updateProfile' ] ) ){

      if( trim( $_POST[ 'name' ] ) === '' ) {
        $_SESSION[ 'errors' ][] = [ 'title' => 'Enter Name please', 'disc' => 'This is required fild' ];
      }
      if( trim( $_POST[ 'surname' ] ) === '') {
        $_SESSION[ 'errors' ][] = [ 'title' => 'Enter Surname please', 'disc' => 'This is required fild' ];
      }
      if( trim( $_POST[ 'email' ] ) === '') {
        $_SESSION[ 'errors' ][] = [ 'title' => 'Enter Email please', 'disc' => 'This is required fild' ];
      }
      
    
      if( empty( $_SESSION[ 'errors' ] ) ) {

        $user->name = htmlentities( $_POST[ 'name' ] );
        $user->surname = htmlentities( $_POST[ 'surname' ] );
        $user->email = htmlentities( $_POST[ 'email' ] );
        $user->country = htmlentities( $_POST[ 'country' ] );
        $user->city = htmlentities( $_POST[ 'city' ] );

        if( isset( $_FILES[ 'avatar' ][ 'name' ] ) && $_FILES[ 'avatar' ]['tmp_name'] !== '' ){


          $avatarFileName = saveUploadedImg('avatar', [ 160, 160 ], 12, 'avatars', [ 160, 160 ], [ 48, 48]);
  
          if ( $avatarFileName ){
            if (file_exists( ROOT . 'usercontent/avatars/' . $user->avatar ) && !empty( $user->avatar )){
              unlink ( ROOT . 'usercontent/avatars/' . $user->avatar);
            }
            if (file_exists( ROOT . 'usercontent/avatars/avatars-small/' . $user->avatar_small ) && !empty( $user->avatar_small )){
              unlink ( ROOT . 'usercontent/avatars/avatars-small/' . $user->avatar_small);
            }
          }
  
          $user->avatar = $avatarFileName[ 0 ];
          $user->avatarSmall = $avatarFileName[ 1 ];

        }


        if( isset( $_POST[ 'deleteAvatar' ] ) && $_POST[ 'deleteAvatar' ] === 'on' ){

          $avatarFolderLocation = ROOT . 'usercontent/avatars/';
          $avatarFolderLocationSmall = ROOT . 'usercontent/avatars/avatars-small/';

          unlink( $avatarFolderLocation . $user->avatar );
          unlink( $avatarFolderLocationSmall . $user->avatarSmall);
         
          $user->avatar = '';
          $user->avatarSmall = '';

        }

        R::store( $user );

        $_SESSION[ 'logged_user' ]= $user;

        // header( 'Location: ' . HOST . 'profile');
        // exit();
      }
    }
  }
}
else {
  // header( 'Location: '. HOST .'login' );
  exit();
}

$pageTitle = "Profile-edit";

include ROOT . "templates/_page-parts/_head.tpl";
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/profile/profile-edit.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_page-parts/_foot.tpl";

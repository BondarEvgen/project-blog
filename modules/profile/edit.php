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
          
          $fileName = $_FILES[ 'avatar' ][ 'name' ];
          $fileTmpLoc = $_FILES[ 'avatar' ][ 'tmp_name'];
          $fileSize = $_FILES[ 'avatar'][ 'size' ];
          $fileErrorMsg = $_FILES[ 'avatar' ][ 'error' ];
          $kaboom = explode('.', $fileName );
          $fileExt = end( $kaboom );
          
          list( $width, $height) = getimagesize( $fileTmpLoc );

          if( $width < 160 || $height < 160 ) {
            $_SESSION[ 'errors' ][] = [ 'title' => 'This image is too small' ];
          }

          if( $fileSize > 4194304 ) {
            $_SESSION[ 'errors' ][] = [ 'title' => 'File must not exceed 4 mb' ];
          }

          if ( !preg_match( "/\.(gif|jpg|png|jpeg)$/i", $fileName ) ) {
            $errors[] = 'Your image file was not jpg, jpeg, gif or png type';
          } else if ($fileErrorMsg == 1) {
            $errors[] = 'An unknown error occurred';
          }

          if( empty( $_SESSION[ 'errors' ] ) ) {

            $avatar = $user->avatar;
            $avatarFolderLocation = ROOT . 'usercontent/avatars/';
            $avatarFolderLocationSmall = ROOT . 'usercontent/avatars/avatars-small/';

            if( !empty( $avatar ) ) {
              $picUrl = $avatarFolderLocation . $avatar;

              // file_exists( $picUrl) ? unlink( $pickUrl ) : '';
              if( file_exists( $picUrl ) ){
                unlink( $picUrl );
              }

              $picUrlSmall = $avatarFolderLocationSmall . '48-' . $avatar;

              // file_exists( $picUrlSmall) ? unlink( $pickUrlSmall ) : '';

              if( file_exists( $picUrlSmall ) ){
                unlink( $picUrlSmall );
              }
              
            }
            $db_file_name = rand(10000000, 99999999) . "." . $fileExt;
            $uploadFile = $avatarFolderLocation . $db_file_name;
            $uploadFileSmall = $avatarFolderLocationSmall . '48-' . $db_file_name;
            
            
            // 1.обрезать фото до 160 х 160
            // 1.обрезать фото до 48 х 48

            $moveResult = resize_and_crop( $fileTmpLoc, $uploadFile, 160, 160 );
            $moveResult = resize_and_crop( $fileTmpLoc, $uploadFileSmall, 48, 48 );

            if ( $moveResult != true ) {
              $_SESSION[ 'errors' ][] = [ 'title' =>'File upload failed' ];
            }
          
            // сохранить файл

            $user->avatar = $db_file_name;
            $user->avatarSmall = '48-' . $db_file_name;

          }
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

<?php 

if ( isset( $_POST[ 'title' ] ) ){

  if( trim( $_POST[ 'title' ] == '' ) ) {
    $_SESSION[ 'errors' ][] = ['title' => 'Enter Title please', 'disc' => 'This is require fild'];
  }
  
  if( trim( $_POST[ 'content' ] == '' ) ) {
    $_SESSION[ 'errors' ][] = ['title' => 'Fill post content please'];
  }
  
  if ( empty( $_SESSION['errors'] ) ) {
  
    $post = R::dispense( 'posts' );
    $post->title = $_POST[ 'title' ];
    $post->content = $_POST[ 'content' ];
    $post->cover = '';
    $post->coverSmall = '';
    $post->timestamp = time();

    if( isset( $_FILES[ 'cover' ][ 'name' ] ) && $_FILES[ 'cover' ]['tmp_name'] !== '' ){
          
      $fileName = $_FILES[ 'cover' ][ 'name' ];
      $fileTmpLoc = $_FILES[ 'cover' ][ 'tmp_name'];
      $fileSize = $_FILES[ 'cover'][ 'size' ];
      $fileErrorMsg = $_FILES[ 'cover' ][ 'error' ];
      $kaboom = explode('.', $fileName );
      $fileExt = end( $kaboom );
      
      list( $width, $height) = getimagesize( $fileTmpLoc );

      if( $width < 600 || $height < 300 ) {
        $_SESSION[ 'errors' ][] = [ 'title' => 'This image is too small', 'disc' => 'upload an image with a width of 600 pixels or more'];
      }

      if( $fileSize > 12582912 ) {
        $_SESSION[ 'errors' ][] = [ 'title' => 'File must not exceed 12 mb' ];
      }

      if ( !preg_match( "/\.(gif|jpg|png|jpeg)$/i", $fileName ) ) {
        $errors[] = 'Your image file was not jpg, jpeg, gif or png type';
      } else if ($fileErrorMsg == 1) {
        $errors[] = 'An unknown error occurred';
      }

      if( empty( $_SESSION[ 'errors' ] ) ) {

        
        $coverFolderLocation = ROOT . 'usercontent/blog/';
        $coverFolderLocationSmall = ROOT . 'usercontent/blog/blog-small/';

       
        $db_file_name = rand(10000000, 99999999) . "." . $fileExt;
        $uploadFile1110 = $coverFolderLocation . $db_file_name;
        $uploadFileSmall290 = $coverFolderLocationSmall . '290-' . $db_file_name;
        
        
        // 1.обрезать фото до 1110 х 460
        // 1.обрезать фото до 290 х 230

        $moveResult = resize_and_crop( $fileTmpLoc, $uploadFile1110, 1110, 460 );
        $moveResult = resize_and_crop( $fileTmpLoc, $uploadFileSmall290, 290, 230 );

        if ( $moveResult != true ) {
          $_SESSION[ 'errors' ][] = [ 'title' =>'File upload failed' ];
        }
      
        // сохранить файл

        $post->cover = $db_file_name;
        $post->coverSmall = '290-' . $db_file_name;

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


    R::store( $post );

    $_SESSION[ 'success' ][] = ['title' => 'Post successfully added'];
  
    header('Location: ' . HOST . 'admin/blog');
  
    exit();
  }
}


ob_start();

include ROOT . 'admin/templates/blog/post-new.tpl';

$content = ob_get_contents();

ob_end_clean();

include ROOT . 'admin/templates/template.tpl';
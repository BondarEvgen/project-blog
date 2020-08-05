<?php


// require HOST . 'libs/resize-and-crop.php';


if( isset( $_FILES[ 'upload' ][ 'name' ] ) && $_FILES[ 'upload' ]['tmp_name'] !== '' ){
          
          $fileName = $_FILES[ 'upload' ][ 'name' ];
          $fileTmpLoc = $_FILES[ 'upload' ][ 'tmp_name'];
          $fileSize = $_FILES[ 'upload'][ 'size' ];
          $fileErrorMsg = $_FILES[ 'upload' ][ 'error' ];
          $kaboom = explode('.', $fileName );
          $fileExt = end( $kaboom );
          
          list( $width, $height) = getimagesize( $fileTmpLoc );
    
          if( $width < 1 || $height < 1 ) {
            $message = 'This image is too small';
            
          }
    
          if( $fileSize > 12582912 ) {
            $message = 'File must not exceed 12 mb';
            
          }
    
          if ( !preg_match( "/\.(gif|jpg|png|jpeg)$/i", $fileName ) ) {
            $errors[] = 'Your image file was not jpg, jpeg, gif or png type';
          } else if ($fileErrorMsg == 1) {
            $errors[] = 'An unknown error occurred';
          }
    
          if( empty( $_SESSION[ 'errors' ] ) ) {
    
            
            $uploadFolderLocation = ROOT . 'usercontent/editor-upload/';
            
    
           
            $db_file_name = rand(10000000, 99999999) . "." . $fileExt;
            $uploadFile920= $uploadFolderLocation . $db_file_name;
           
            
            
            // 1.обрезать фото до 1110 х 460
            // 1.обрезать фото до 290 х 230

            if($width > 920 || $height > 920 ){
             $moveResult = resize( $fileTmpLoc, $uploadFile920, 920);
            }
    
           
           
    
            if ( $moveResult != true ) {
              $message = 'File upload failed' ;
            }
          
            // сохранить файл
    
            $url = HOST . 'usercontent/editor-upload/'. $db_file_name;
           
    
          }
        }
    

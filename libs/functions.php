<?php


function getModuleNameForAdmin (){

  $uri = $_SERVER[ 'REQUEST_URI' ]; // admin/blog?id=2

  $uriArr = explode( '?', $uri ); // [ 'admin/blog','id=2' ]

  $uri = $uriArr[ 0 ];  // 'admin/blog'

  $uri = rtrim( $uri, '/' ); // cut / in the end if present 'admin/blog'

  $uri = substr( $uri, 1 ); // cut / in the beginning if present 'admin/blog'

  $uri = filter_var( $uri, FILTER_SANITIZE_URL ); 

  $modulNammerArray = explode( '/', $uri ); // [ 'admin','blog' ]

  $uriModule = isset( $modulNammerArray[ 1 ] ) ? $modulNammerArray[ 1 ] : '';

  return $uriModule;

}

function getModuleName (){

  $uri = $_SERVER[ 'REQUEST_URI' ];

  $uri = rtrim( $uri, '/');
  
  $uri = filter_var( $uri, FILTER_SANITIZE_URL);
  
  $uri = substr( $uri , 1 );
  
  $uri = explode( '?', $uri);
  
  // $uriGet = isset( $uri[ 1 ] ) ? $uri[ 1 ] : null;
  
  $uriArray = explode( '/', $uri[0]);
  $uriModule = $uriArray[ 0 ];

  return $uriModule;

}

function getUriGet (){

  $uri = $_SERVER[ 'REQUEST_URI' ];

  $uri = rtrim( $uri, '/');
  
  $uri = filter_var( $uri, FILTER_SANITIZE_URL);
  
  $uri = substr( $uri , 1 );
  
  $uri = explode( '?', $uri);

  $uri = $uri[ 0 ];

  $uriArray = explode( '/', $uri);
  
  $uriGet = isset( $uriArray[ 1 ] ) ? $uriArray[ 1 ] : null;
  return $uriGet;
  
}

function pagination( $results_per_page, $type)
{
    // 18 постов
    // по 6 постов на страницу
    // Итого 3 страницы

    $number_of_results = R::count($type); // 18
    $number_of_pages = ceil($number_of_results / $results_per_page); // 20 / 6 = 4

    if ( !isset( $_GET['page'] ) || $_GET[ 'page' ] < 1 || $_GET[ 'page' ] == 0 ) {

      $page_number = 1;

  } else if ( $_GET['page'] > $number_of_pages) {
    
      $page_number = $number_of_pages;

  } else {

    $page_number = $_GET[ 'page' ];

  }

    $starting_limit_number = ($page_number - 1) * $results_per_page;
    $sql_pages_limit = "LIMIT {$starting_limit_number}, $results_per_page";

    // return $sql_pages_limit;

    $result['number_of_pages'] = $number_of_pages; // 3
    $result['page_number'] = $page_number; // 2
    $result['sql_pages_limit'] = $sql_pages_limit; // LIMIT 6, 6

    return $result;
}

// function saveUploadImg( string, [], integer, integer, string, [],[])

function saveUploadedImg ( $inputFileName, $minSize, $maxFileSize, $folderName, $fullSize, $smallSize){
          
    $fileName = $_FILES[ $inputFileName ][ 'name' ];
    $fileTmpLoc = $_FILES[ $inputFileName ][ 'tmp_name'];
    $fileSize = $_FILES[ $inputFileName ][ 'size' ];
    $fileErrorMsg = $_FILES[ $inputFileName ][ 'error' ];
    $kaboom = explode('.', $fileName );
    $fileExt = end( $kaboom );
    
    list( $width, $height) = getimagesize( $fileTmpLoc );

    if( $width < $minSize[ 0 ] || $height < $minSize[ 1 ] ) {
      $_SESSION[ 'errors' ][] = [ 'title' => 'This image is too small', 'disc' => 'upload an image with a width of 600 pixels or more'];
    }

    if( $fileSize > ( $maxFileSize * 1024 * 1024 ) ) {
      $_SESSION[ 'errors' ][] = [ 'title' => 'File must not exceed 12 mb' ];
    }

    if ( !preg_match( "/\.(gif|jpg|png|jpeg)$/i", $fileName ) ) {
      $errors[] = 'Your image file was not jpg, jpeg, gif or png type';
    } else if ($fileErrorMsg == 1) {
      $errors[] = 'An unknown error occurred';
    }

    if( empty( $_SESSION[ 'errors' ] ) ) {

      
      $imgFolderLocation = ROOT . 'usercontent/'. $folderName .'/';
      $imgFolderLocationSmall = ROOT . 'usercontent/'. $folderName .'/'. $folderName .'-small/';

     
      $db_file_name = rand(10000000, 99999999) . "." . $fileExt;
      $filePathFullSize = $imgFolderLocation . $db_file_name;
      $filePathSmallSize = $imgFolderLocationSmall . $smallSize[ 0 ] . '-' . $db_file_name;
      
      
      // 1.обрезать фото до 1110 х 460
      // 1.обрезать фото до 290 х 230

      $moveResult = resize_and_crop( $fileTmpLoc, $filePathFullSize, $fullSize[ 0 ], $fullSize[ 1 ] );
      $moveResult = resize_and_crop( $fileTmpLoc, $filePathSmallSize, $smallSize[ 0 ], $smallSize[ 1 ] );

      if ( $moveResult != true ) {
        $_SESSION[ 'errors' ][] = [ 'title' =>'File upload failed' ];
        return false;
      }

      return [ $db_file_name, $smallSize[ 0 ] . '-' . $db_file_name ];
      // return 'lalal';

    }
   
  
}


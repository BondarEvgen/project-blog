<?php
require_once './../config.php';
require './../db.php';
require ROOT . 'libs/resize-and-crop.php';
require ROOT . 'libs/functions.php';


// ERRORS AND SUCCES ARRAYS

$_SESSION[ 'errors' ] = array();
$_SESSION[ 'success' ] = array();

session_start();

if( !( isset( $_SESSION[ 'role' ] )  && $_SESSION[ 'role' ] === 'admin' ) ){
  header( 'Location: ' . HOST .'login' );
}

// echo '<pre>';
// print_r( $_SERVER[ 'REQUEST_URI' ] );
// echo '</pre>';

// RQUEST TRIMMING
$uriModule = getModuleNameForAdmin();




// ROUTER
switch ( $uriModule ) {
  case '': 
    require( ROOT . "admin/modules/admin/index.php");
    break;

// ::::::::::::::::::: BLOG ::::::::::::::::://
  case 'blog': 
    require( ROOT . "admin/modules/blog/index.php");
    break;

  case 'post-new': 
    require( ROOT . "admin/modules/blog/post-new.php");
    break;

  case 'post-edit': 
    require( ROOT . "admin/modules/blog/post-edit.php");
    break;

  case 'post-delete': 
    require( ROOT . "admin/modules/blog/post-delete.php");
    break;
  
// ::::::::::::::::::: CATEGORY ::::::::::::::::://
  case 'category': 
    require( ROOT . "admin/modules/category/category.php");
    break;

  case 'category-new': 
    require( ROOT . "admin/modules/category/category-new.php");
    break;

  case 'category-edit': 
    require( ROOT . "admin/modules/category/category-edit.php");
    break;

  case 'category-delete': 
    require( ROOT . "admin/modules/category/category-delete.php");
    break;

  default:
    require( ROOT . "admin/modules/admin/index.php");
    break;
}

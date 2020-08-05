<?php
require_once './config.php';
require './db.php';
require ROOT . 'libs/resize-and-crop.php';
require ROOT . 'libs/functions.php';


// ERRORS AND SUCCES ARRAYS

$_SESSION[ 'errors'] = array();
$_SESSION[ 'success'] = array();

session_start();

// RQUEST TRIMMING


$uriModule = getModuleName();
$uriGet = getUriGet();



// ROUTER
switch ( $uriModule ) {
  case '': 
    require( ROOT . "modules/main/index.php");
    break;

// ::::::::::::::::::: USERS ::::::::::::::::://

  case 'login':
    require( ROOT . "modules/login/login.php");
    break;

  case 'logout':
    require( ROOT . "modules/login/logout.php");
    break;

  case 'lost-password':
    require( ROOT . "modules/login/lost-password.php");
    break;

  case 'registration':
    require( ROOT . "modules/login/registration.php");
    break;

  case 'set-new-password':
    require( ROOT . "modules/login/set-new-password.php");
    break;

  case 'profile':
    require( ROOT . "modules/profile/profile.php");
    break;

  case 'profile-edit':
    require( ROOT . "modules/profile/edit.php");
    break;

//:::::::::::::::::::: OTHERS ::::::::::::::::::://

  case 'blog':
    require( ROOT . "modules/blog/index.php");
    break;
  case 'about':
    require( ROOT . "modules/about/index.php");
    break;
  case 'contacts':
    require( ROOT . "modules/contacts/index.php");
    break;

  default:
    require( ROOT . "modules/main/index.php");
    break;
  
}

<?php


// DB SETTINGS
define( 'DB_HOST', 'localhost' );
define( 'DB_NAME', 'project-blog' );
define( 'DB_USER', 'root' );
define( 'DB_PASSWORD', 'root' );


if( isset( $_SERVER[ 'HTTPS' ] ) && $_SERVER[ 'HTTPS' ] === 'on' ){
  $protocol = 'https://';
}
 else {
  $protocol = 'http://';
};

define( 'HOST', $protocol . $_SERVER['HTTP_HOST'] . '/' );
define( 'ROOT', dirname(__FILE__) . '/');

// Additional settings

define( 'SITE_EMAIL', 'info@project.com' );
define( 'SITE_NAME', 'Digital Nomad' );
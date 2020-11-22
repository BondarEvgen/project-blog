<?php 

$cat = R::load( 'category', $_GET[ 'id' ] );



if( isset( $_POST[ 'delete-submit' ] ) ){
  // echo 'LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL';
  R::trash( $cat);
  $_SESSION[ 'success' ][]=[ 'title' => 'Category was successfuly deleted' ];

  header( 'Location: ' . HOST . 'admin/category' );
  exit();
}



ob_start();

include ROOT . 'admin/templates/category/category-delete.tpl';

 $content = ob_get_contents();

ob_clean();

include ROOT . 'admin/templates/template.tpl';

<?php 

if ( isset( $_POST[ 'submit' ] ) ) {
  if( trim($_POST[ 'title' ]) == '' ) {
    $_SESSION[ 'errors' ][] = ['title' => 'Enter Title please', 'disc' => 'This is require fild'];
  }

  if( empty( $_SESSION[ 'errors' ] ) ) {
    $cat = R::load( 'category', $_GET[ 'id' ] );
    $cat->title = $_POST[ 'title' ];
    R::store( $cat );
    $_SESSION[ 'success' ][]= ['title'=> 'Category was successfuly added'];
  }
}

$cat = R::load( 'category', $_GET[ 'id' ] );

ob_start();

include ROOT . 'admin/templates/category/category-edit.tpl';

 $content = ob_get_contents();

ob_clean();

include ROOT . 'admin/templates/template.tpl';

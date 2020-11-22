<?php

$post = R::load('posts', $_GET['id']);

if (isset($_POST[ 'delete-submit' ])) {
 
  // print_r( $_POST );
  // print_r($post);
  //   die();

  if( !empty($post['cover']) && !empty($post['cover_small']) ){

    
    $coverFolderLocation = ROOT . 'usercontent/blog/';
    $coverFolderLocationSmall = ROOT . 'usercontent/blog/blog-small/';

    unlink( $coverFolderLocation . $post->cover );
    unlink( $coverFolderLocationSmall . $post->cover_small);
    
    $post->cover = '';
    $post->cover_small = '';
  
  }

  R::trash($post);

  $_SESSION[ 'success' ][] = [ 'title' => 'Post was successfully deleted' ];
  
  header('Location: ' . HOST . 'admin/blog');

  exit();

}

ob_start();

include ROOT . 'admin/templates/blog/post-delete.tpl';

$content = ob_get_contents();

ob_end_clean();

include ROOT . 'admin/templates/template.tpl';
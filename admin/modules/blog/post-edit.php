<?php

if (isset($_POST[ 'postEditSubmit' ])) {

  
  if( trim( $_POST[ 'title' ] == '' ) ) {
    $_SESSION[ 'errors' ][] = ['title' => 'Enter Title please', 'disc' => 'This is require fild'];
  }
  
  if( trim( $_POST[ 'content' ] == '' ) ) {
    $_SESSION[ 'errors' ][] = ['title' => 'Fill post content please'];
  }

  if ( empty( $_SESSION['errors'] ) ) {
  
    $post = R::load('posts', $_GET[ 'id' ]);
    $post->title = $_POST[ 'title' ];
    $post->content = $_POST[ 'content' ];
    $post->editTime = time();
    
    if( isset( $_FILES[ 'cover' ][ 'name' ] ) && $_FILES[ 'cover' ]['tmp_name'] !== '' ){

    $coverFileName = saveUploadedImg('cover', [ 600, 300 ], 12, 'blog', [ 1110, 460 ], [ 290, 230]);

    if ( $coverFileName ){
      if (file_exists( ROOT . 'usercontent/blog/' . $post->cover ) && !empty( $post->cover )){
        unlink ( ROOT . 'usercontent/blog/' . $post->cover);
      }
      if (file_exists( ROOT . 'usercontent/blog/blog-small/' . $post->cover_small ) && !empty( $post->cover_small )){
        unlink ( ROOT . 'usercontent/blog/blog-small/' . $post->cover_small);
      }
    }

      $post->cover = $coverFileName[ 0 ];
      $post->coverSmall = $coverFileName[ 1 ];
    }

    if( isset( $_POST[ 'delete-cover' ] ) && $_POST[ 'delete-cover' ] === 'on' ){

     
      $coverFolderLocation = ROOT . 'usercontent/blog/';
      $coverFolderLocationSmall = ROOT . 'usercontent/blog/blog-small/';
  
      unlink( $coverFolderLocation . $post->cover );
      unlink( $coverFolderLocationSmall . $post->cover_small);
      
      $post->cover = '';
      $post->cover_small = '';
    
    }


    R::store( $post );

    $_SESSION[ 'success' ][] = [ 'title' => 'Post was successfully updated' ];
  
    // header('Location: ' . HOST . 'admin/blog');
  
    // exit();
  }
  // print_r($_POST);
  // die();
  
}

$post = R::load('posts', $_GET[ 'id' ]);



ob_start();

include ROOT . 'admin/templates/blog/post-edit.tpl';

$content = ob_get_contents();

ob_end_clean();

include ROOT . 'admin/templates/template.tpl';


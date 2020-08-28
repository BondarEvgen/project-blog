<?php


if( isset( $uriGet ) ){

  $pageTitle = "Single post";

  $post = R::load( 'posts', $uriGet);
  ob_start();

  include ROOT . 'templates/blog/single-post.tpl';

  $content = ob_get_contents();
  ob_end_clean();

}
else {

  $pageTitle = "All posts";

  $pagination = pagination( 1, 'posts');

  $posts = R::find('posts', 'ORDER BY id DESC ' . $pagination['sql_pages_limit']);

  ob_start();

  include ROOT . 'templates/blog/all-posts.tpl';

  $content = ob_get_contents();
  ob_end_clean();

}



include ROOT . "templates/_page-parts/_head.tpl";
include ROOT . "templates/_parts/_header.tpl";

include ROOT . "templates/blog/index.tpl";

include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_page-parts/_foot.tpl";
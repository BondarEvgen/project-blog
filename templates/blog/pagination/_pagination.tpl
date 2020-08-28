


<?php 

include ROOT . 'templates/blog/pagination/_button-prev.tpl';

if ( $pagination[ 'number_of_pages'] <= 6 || $pagination[ 'page_number' ] <= 6 ){

  include ROOT . 'templates/blog/pagination/_pagination-loop-start.tpl';
 
} elseif ( $pagination[ 'page_number' ] > ( $pagination[ 'number_of_pages'] - 2 ) ) {

  include ROOT . 'templates/blog/pagination/_pagination-loop-end.tpl';
   
} else {

  include ROOT . 'templates/blog/pagination/_pages-more-then-6.tpl';
    
}

include ROOT . 'templates/blog/pagination/_button-next.tpl';
 
?>


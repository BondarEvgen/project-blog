
<?php for( $i = 1; $i <= 6; $i++):?>
    <div class="section-pagination__item">

      <a 
        class="pagination-button <?php echo ( $i == $pagination[ 'page_number' ])? 'active': '' ;?> "
        href="<?= HOST?>blog?page=<?= $i?>"
      >
      <?= $i?>
      </a>
     
    </div>
  <?php endfor;?>

  <?php if( $pagination[ 'number_of_pages'] > 6 ):?>

    <div class="section-pagination__item">
      <a 
        class="pagination-button <?php echo ( $pagination[ 'page_number' ] == 1)? 'active': '' ;?> "
        href="<?= HOST?>blog?page=<?php echo ( $pagination['page_number'] + 3 );?>"
      >
      ...
      </a> 
    </div>
  
  <?php endif;?>

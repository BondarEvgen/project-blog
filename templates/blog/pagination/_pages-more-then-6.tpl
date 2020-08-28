
<div class="section-pagination__item">
  <a 
    class="pagination-button <?php echo ( $pagination[ 'page_number' ] == 1)? 'active': '' ;?> "
    href="<?= HOST?>blog?page=1"
  >
  1
  </a> 
</div>

<div class="section-pagination__item">
  <a 
    class="pagination-button <?php echo ( $pagination[ 'page_number' ] == 1)? 'active': '' ;?> "
    href="<?= HOST?>blog?page=<?php echo ( $pagination['page_number'] - 3 );?>"
  >
  ...
  </a> 
</div>

<div class="section-pagination__item">
  <a 
    class="pagination-button "
    href="<?= HOST?>blog?page=<?php echo ($pagination[ 'page_number' ] - 2)?>"
  >
  <?php echo ($pagination[ 'page_number' ] - 2)?>
  </a> 
</div>

<div class="section-pagination__item">
  <a 
    class="pagination-button "
    href="<?= HOST?>blog?page=<?php echo ($pagination[ 'page_number' ] - 1)?>"
  >
  <?php echo ($pagination[ 'page_number' ] - 1)?>
  </a> 
</div>

<div class="section-pagination__item">
  <a 
    class="pagination-button active "
    href="<?= HOST?>blog?page=<?php echo $pagination[ 'page_number' ]?>"
  >
  <?php echo $pagination[ 'page_number' ]?>
  </a> 
</div>

<div class="section-pagination__item">
  <a 
    class="pagination-button"
    href="<?= HOST?>blog?page=<?php echo ($pagination[ 'page_number' ] + 1)?>"
  >
  <?php echo ($pagination[ 'page_number' ] + 1)?>
  </a> 
</div>

<div class="section-pagination__item">
  <a 
    class="pagination-button "
    href="<?= HOST?>blog?page=<?php echo ($pagination[ 'page_number' ] + 2)?>"
  >
  <?php echo ($pagination[ 'page_number' ] + 2)?>
  </a> 
</div>

<?php if( $pagination[ 'page_number' ] < ($pagination[ 'number_of_pages'] - 2) ):?>

  <div class="section-pagination__item">
    <a 
      class="pagination-button <?php echo ( $pagination[ 'page_number' ] == 1)? 'active': '' ;?> "
      href="<?= HOST?>blog?page=<?php echo ( $pagination['page_number'] + 3 );?>"
    >
    ...
    </a> 
  </div>

<?php endif;?>
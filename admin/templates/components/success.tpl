<?php
  if ( !empty( $_SESSION[ 'success' ] ) ):
    foreach( $_SESSION[ 'success' ] as $item):
      if( isset( $item[ 'disc']) && $item[ 'disc'] != ''):
?>
<div class="notifications notifications__title--with-message mb-10">
    <div class="notifications__title notifications__title--success"><?php echo $item[ 'title' ];?></div>
    <div class="notifications__message"> 
      <p><?php echo $item[ 'disc' ];?></p>
      
    </div>
  </div>
<?php 
  else:
?>
 <div class="notifications mb-10">
    <div class="notifications__title notifications__title--success"><?php echo $item[ 'title' ];?></div>
  </div>

<?php 
    endif;
  endforeach;
  $_SESSION[ 'success' ] = array();
endif;
?>
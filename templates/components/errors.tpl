<?php
  if ( !empty( $_SESSION[ 'errors' ] ) ):
    foreach( $_SESSION[ 'errors' ] as $error):
      if( isset( $error[ 'disc']) && $error[ 'disc'] != ''):
?>
<div class="notifications notifications__title--with-message mb-10">
    <div class="notifications__title notifications__title--error"><?php echo $error[ 'title' ];?></div>
    <div class="notifications__message"> 
      <p><?php echo $error[ 'disc' ];?></p>
      
    </div>
  </div>
<?php 
  else:
?>
 <div class="notifications mb-10">
    <div class="notifications__title notifications__title--error"><?php echo $error[ 'title' ];?></div>
  </div>

<?php 
    endif;
  endforeach;
  $_SESSION[ 'errors' ] = array();
endif;
?>
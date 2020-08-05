<?php if ( isset( $_SESSION[ 'login' ] ) && $_SESSION[ 'login' ] === 1 ):?>
  <?php if (	$_SESSION[ 'logged_user' ][ 'role' ] === 'user' ):?>
    <?php if (	$_SESSION[ 'logged_user' ][ 'id' ] === $user->id ):?>
      <a class="secondary-button" href="<?= HOST?>profile-edit">Edit</a>
    <?php endif;?>
  <?php endif;?>

  <?php if (	$_SESSION[ 'logged_user' ][ 'role' ] === 'admin' ):?>
    <a class="secondary-button" href="<?= HOST?>profile-edit\<?= $user->id?>">Edit</a>
  <?php endif;?>
<?php endif;?>
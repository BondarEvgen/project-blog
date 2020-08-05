<form
 class="authorization-form" 
 method="POST" 
 action="<?php echo HOST;?>set-new-password?email=<?php print_r( $_GET[ 'email' ] )?>&code=<?php print_r( $_GET[ 'code' ] )?>"
 >
  <div class="authorization-form__heading">
    <h2 class="heading">Set new password </h2>
  </div>

<?php include ROOT . 'templates/components/success.tpl'?>

<?php include ROOT . 'templates/components/errors.tpl'?>


<?php if( !isset($newPasswordReady) ):?>
  <div class="authorization-form__input">
    <input class="input"  name="password" type="password" placeholder="password" />
  </div>
  <div class="authorization-form__button">
    <button class="primary-button" name="lost-password" type="submit" value="lost-password" >Set password</button>
  </div>
<?php endif;?>

  <div class="authorization-form__links">
    <a href="<?php echo HOST;?>login">Enter the site</a>
    <a href="<?php echo HOST; ?>registration">Sing up</a>
  </div>
  
</form>
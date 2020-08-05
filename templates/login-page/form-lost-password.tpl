<form class="authorization-form" method="POST" action="<?php echo HOST;?>lost-password">
  <div class="authorization-form__heading">
    <h2 class="heading">Password recovery </h2>
  </div>

<?php include ROOT . 'templates/components/success.tpl'?>

<?php include ROOT . 'templates/components/errors.tpl'?>

  <div class="authorization-form__input">
    <input class="input"  name="email" type="text" placeholder="Email" />
  </div>
  <div class="authorization-form__button">
    <button class="primary-button" name="lost-password" type="submit" value="lost-password" >Restore password</button>
  </div>
  <div class="authorization-form__links">
    <a href="<?php echo HOST;?>login">Enter the site</a>
    <a href="<?php echo HOST; ?>registration">Sing up</a>
  </div>
  
</form>
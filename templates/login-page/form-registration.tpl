<form class="authorization-form" method="POST" action="<?php echo HOST;?>registration">
  <div class="authorization-form__heading">
    <h2 class="heading">Registration </h2>
  </div>

<?php include ROOT . 'templates/components/success.tpl'?>

<?php include ROOT . 'templates/components/errors.tpl'?>

  <div class="authorization-form__input">
    <input 
      class="input"
      name="email" 
      type="text" 
      placeholder="Email"
      value="<?php echo isset($_POST[ 'email' ]) ? $_POST[ 'email' ] : '';?>"
    />
  </div>
  <div class="authorization-form__input">
    <input 
      class="input" 
      name="password" 
      type="password" 
      placeholder="Пароль"
      value="<?php echo isset($_POST[ 'password' ]) ? $_POST[ 'password' ] : '';?>"
    />
  </div>
  <div class="authorization-form__button">
    <button class="primary-button" name="registration" type="submit" value="registration" >Sing up</button>
  </div>
  <div class="authorization-form__links">
    <a href="<?php echo HOST;?>login">Enter the site</a>
  </div>
</form>
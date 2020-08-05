<form class="authorization-form" method="POST" action="<?php echo HOST; ?>login">
  <div class="authorization-form__heading">
    <h2 class="heading">Enter the site </h2>
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
    />
  </div>
  <div class="authorization-form__button">
    <button class="primary-button" name ="login" value="login" type="submit">Enter the site</button>
  </div>
  <div class="authorization-form__links">
    <a href="<?php echo HOST; ?>lost-password">Forgot password</a>
    <a href="<?php echo HOST; ?>registration">Sing up</a>
  </div>
</form>
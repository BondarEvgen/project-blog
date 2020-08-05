
<?php 
if (isset( $_SESSION[ 'login' ] ) && $_SESSION[ 'login' ] === 1 ):
	if ($_SESSION[ 'logged_user' ][ 'role' ] === 'user' || $_SESSION[ 'logged_user' ][ 'role' ] === 'admin' ): ?>
	
<div class="admin-panel">
		<div class="admin-panel__block-list">

			<?php if ( $_SESSION[ 'logged_user' ][ 'role' ] === 'admin'):?>

				<a class="admin-panel__link" href="#">
					<img src="<?php echo HOST?>static/img/admin-panel/target.svg" alt="Go to control panel">
					<div class="span">Control panel</div>
				</a>

			<?php endif;?>


			<a class="admin-panel__link" href="<?php echo HOST?>profile">
				<img src="<?php echo HOST?>static/img/admin-panel/user.svg" alt=" Profilу">
				<div class="span">Profile</div>
			</a>

			<?php if ( $_SESSION[ 'logged_user' ][ 'role' ] === 'admin'):?>

				<a class="admin-panel__link" href="#">
					<div class="admin-panel__message" data-number="8">
						<img src="<?php echo HOST?>static/img/admin-panel/mail.svg" alt=" Сообщение">
					</div>
					<div class="span">Сообщение</div>
				</a>
				<a class="admin-panel__link" href="#">
					<div class="admin-panel__comments" data-number="15">
						<img src="<?php echo HOST?>static/img/admin-panel/message-square.svg" alt="Комментарии">
					</div>
					<div class="span">Комментарии</div>
				</a>
				<a class="admin-panel__link" href="#">
					<img src="<?php echo HOST?>static/img/admin-panel/edit-3.svg" alt="Редактировать эту страницу">
					<div class="span">Редактировать</div>
				</a>

			<?php endif;?>

		</div>
		<a href="<?php echo HOST;?>logout" class="admin-panel__block-button">Log out</a>
	</div>

<?php endif; 
else: ?>

<div class="admin-panel">
	<div class="admin-panel__block-list"></div>	
	<a href="<?php echo HOST;?>login" class="admin-panel__block-button">Log in</a>

</div>


<?php endif; ?>





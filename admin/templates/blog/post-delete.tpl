		<div class="admin-page__content-form">
			<form class="admin-form" method="POST" action="<?= HOST?>admin/post-delete?id=<?=$post[ 'id' ]?>" enctype="multipart/form-data">
<?php include ROOT . 'admin/templates/components/success.tpl'?>

<?php include ROOT . 'admin/templates/components/errors.tpl'?>
				<div class="admin-form__item">
					<h2 class="heading">Удалить пост </h2>
				</div>
        <div class="admin-form__item">
          <p><strong>Вы действительно хотите удалить пост?</strong></p>
          <p><strong>ID : </strong><?= $post[ 'id' ]?> </p>
          <p><strong>Название : </strong><?= $post[ 'title' ]?></p>
				</div>
		

						<?php  if( !empty( $user->avatar ) ):?>

									{* <label class="checkbox__item mt-20">
										<input class="checkbox__btn" type="checkbox" name="deleteAvatar" />
										<span class="checkbox__label">Delete</span>
									</label> *}
									
						<?php endif;?>

				<div class="admin-form__item buttons">
					<button name="delete-submit"  class="primary-button primary-button--red" type="submit"> Удалить </button>
						<a class="secondary-button" href="<?=HOST?>admin/blog">Отмена</a>
				</div>
				</div>
				<div class="admin-form__item"></div>
				<div class="admin-form__item"></div>
			</form>
		</div>
	<!-- build:js1 js/jquery.js -->

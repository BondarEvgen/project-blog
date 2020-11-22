	

	
		<div class="admin-page__content-form">
			<form class="admin-form" method="POST" action="<?= HOST?>admin/category-delete?id=<?=$cat[ 'id' ]?>" enctype="multipart/form-data">
<?php include ROOT . 'admin/templates/components/success.tpl'?>

<?php include ROOT . 'admin/templates/components/errors.tpl'?>
				<div class="admin-form__item">
					<h2 class="heading">Delete category </h2>
				</div>
        <div class="admin-form__item">
          <p><strong>Are you sure you want to delete the category?</strong></p>
          <p><strong>Name : </strong><?= $cat[ 'title' ]?></p>
				</div>
				
		
				<div class="admin-form__item buttons">
					<button name="delete-submit"  class="primary-button primary-button--red" type="submit"> Delete </button>
						<a class="secondary-button" href="<?=HOST?>admin/category">Cansel</a>
				</div>
				</div>
				<div class="admin-form__item"></div>
				<div class="admin-form__item"></div>
			</form>
		</div>
	<!-- build:js1 js/jquery.js -->

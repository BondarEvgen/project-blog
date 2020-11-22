		<div class="admin-page__content-form">
			<form class="admin-form" method="POST" action="<?= HOST?>admin/category-edit?id=<?= $cat[ 'id' ]?>" enctype="multipart/form-data">
<?php include ROOT . 'admin/templates/components/success.tpl'?>

<?php include ROOT . 'admin/templates/components/errors.tpl'?>
				<div class="admin-form__item">
					<h2 class="heading">Edit category </h2>
				</div>
				<div class="admin-form__item">
					<label class="input__label">Enter category title
						<input
						 name="title" 
						 class="input input--width-label" 
						 type="text" 
						 placeholder="Category name" 
						 value="<?= $cat['title']?>" />
					</label>
				</div>	
		
				<div class="admin-form__item buttons">
					<button name="submit"  class="primary-button" type="submit">Save</button>
						<a class="secondary-button" href="<?= HOST?>admin/category">Cansel</a>
				</div>
				</div>
				<div class="admin-form__item"></div>
				<div class="admin-form__item"></div>
			</form>
		</div>
	


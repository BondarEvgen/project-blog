	
<script src="<?= HOST?>libs/ckeditor/ckeditor.js"></script>
	
	<div class="admin-page__content">
		<div class="admin-page__content-form">
			<form class="admin-form" method="POST" action="<?= HOST?>admin/post-new" enctype="multipart/form-data">
<?php include ROOT . 'admin/templates/components/success.tpl'?>

<?php include ROOT . 'admin/templates/components/errors.tpl'?>
				<div class="admin-form__item">
					<h2 class="heading">Добавить пост </h2>
				</div>
				<div class="admin-form__item">
					<label class="input__label">Введите название записи 
						<input name="title" class="input input--width-label" type="text" placeholder="Заголовок поста" />
					</label>
				</div>
				<div class="admin-form__item">
					<label class="select-label">Выберите категорию <select class="select">
							<option value="notes1">Заметки путешественника</option>
							<option value="notes2">Заметки программиста</option>
							<option value="notes3">Заметки спортсмена</option>
						</select>
					</label>
				</div>
				<div class="admin-form__item">
					<label class="textarea__label mb-10" for="content" >Содержимое поста</label> 
						<textarea 
							name="content" 
							class="textarea textarea--width-label" 
							placeholder="Введите текст"
							id="editor"
						>
						</textarea>
					
				</div>
				<div class="admin-form__item">
					<div class="block-upload">
						<div class="block-upload__description">
							<div class="block-upload__title">Обложка поста:</div>
							<p>Изображение jpg или png, рекомендуемая ширина 290px и больше, высота от 230px и более. Вес до 12Мб.</p>
							<div class="block-upload__file-wrapper">
									<input name="cover" class="file-button" type="file"/>
								<div class="block-upload__file-name">some-picture.jpg</div>
							</div>
						</div>
						<div class="block-upload__img">
							<img src="<?= HOST?>static/img/block-upload/block-upload.jpg" alt="Загрузка картинки" />
							
						</div>
					</div>

						<?php  if( !empty( $user->avatar ) ):?>

									{* <label class="checkbox__item mt-20">
										<input class="checkbox__btn" type="checkbox" name="deleteAvatar" />
										<span class="checkbox__label">Delete</span>
									</label> *}
									
						<?php endif;?>

				</div>
				<div class="admin-form__item buttons">
					<button name="submit"  class="primary-button" type="submit">Опубликовать</button>
						<a class="secondary-button" href="#">Отмена</a>
				</div>
				<div class="admin-form__item"></div>
				<div class="admin-form__item"></div>
			</form>
		</div>
	</div><!-- build:js1 js/jquery.js -->

	<script>
		CKEDITOR.replace( 'editor',{
			filebrowserUploadMethod: 'form',
			filebrowserUploadUrl: '<?= HOST?>libs/ck-upload/upload.php'
		} );
	</script>
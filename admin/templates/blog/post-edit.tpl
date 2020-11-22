<script src="<?= HOST?>libs/ckeditor/ckeditor.js"></script>
	
	
		<div class="admin-page__content-form">
			<form class="admin-form" method="POST" action="<?= HOST?>admin/post-edit?id=<?=$post[ 'id' ]?>" enctype="multipart/form-data">
<?php include ROOT . 'admin/templates/components/success.tpl'?>

<?php include ROOT . 'admin/templates/components/errors.tpl'?>
				<div class="admin-form__item">
					<h2 class="heading">Редактировать пост </h2>
				</div>

				<div class="admin-form__item">
					<label class="input__label">Введите название записи 
						<input
						 name="title" 
						 class="input input--width-label" 
						 type="text" 
						 placeholder="Заголовок поста"
						 value="<?php echo $post['title']?>"
						  />
					</label>
				</div>
				<div class="admin-form__item">
					<label class="select-label">Выберите категорию 
						<select class="select">
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
						<?php echo $post['content']?>
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

						<?php  if( !empty( $post->cover_small ) ):?>

							<div class="block-upload__img mb-10">
								<img src="<?= HOST?>usercontent/blog/blog-small/<?=$post[ 'cover_small' ]?>" alt="Загрузка картинки" />
								
								<!--<div class="block-downloads__delete">
									<button class="delete-button" type="reset">Delete</button>
								</div> -->
							</div>

							<label class="checkbox__item">
								<input type="checkbox" class="checkbox__btn" name="delete-cover">
								<span class="checkbox__label">Delete</span>
							</label>

						<?php endif;?>
							
					</div>

				</div>
				<div class="admin-form__item buttons">
					<button name="postEditSubmit"  class="primary-button" type="submit">Опубликовать</button>
						<a class="secondary-button" href="<?=HOST?>admin/blog">Отмена</a>
				</div>
				<div class="admin-form__item"></div>
				<div class="admin-form__item"></div>
			</form>
		</div>
	<!-- build:js1 js/jquery.js -->

	<script>
		CKEDITOR.replace( 'editor',{
			filebrowserUploadMethod: 'form',
			filebrowserUploadUrl: '<?= HOST?>libs/ck-upload/upload.php'
		} );
	</script>
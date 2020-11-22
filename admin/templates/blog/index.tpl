	
		<div class="admin-page__content-form">
			<div class="admin-form" style="width: 900px;">
<?php include ROOT . 'admin/templates/components/success.tpl'?>

<?php include ROOT . 'admin/templates/components/errors.tpl'?>
				<div class="admin-form__item d-flex justify-content-between mb-20">
					<h2 class="heading">Blog - all posts</h2><a class="secondary-button" href="<?= HOST?>admin/post-new">Add post</a>
				</div>
				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>Название</th>
							<th></th>
						</tr>
					</thead>
					<tbody>

					<?php foreach ($posts as $post):?>

						<tr>
							<td><?=$post[ 'id' ]?></td>
							<td><a href="<?php echo HOST . 'admin';?>/post-edit?id=<?=$post[ 'id' ]?>"><?php echo $post[ 'title' ];?></a></td>
							<td>
								<a  href="<?php echo HOST . 'admin';?>/post-delete?id=<?=$post[ 'id' ]?>" class="icon-delete"></a>
							</td>
						</tr>

					<?php endforeach;?>
					
					</tbody>
				</table>

				 
				<div class="admin-form__item pt-40">
					<div class="section-pagination">
						<div class="section-pagination__item">
							<a class="pagination-button" href="<?= HOST?>admin/blog?page=<?php echo ( $pagination['page_number'] - 1 )?>">назад</a>
						</div>

						<?php for( $i=1; $i <= $pagination[ 'number_of_pages' ]; $i++):?>

							<div class="section-pagination__item">
							<?php if( $i == $pagination[ 'page_number' ] ):?>

								<a class="pagination-button active" href="<?= HOST?>admin/blog?page=<?= $i?>"><?= $i?></a>

							<?php else:?>

								<a class="pagination-button " href="<?= HOST?>admin/blog?page=<?= $i?>"><?= $i?></a>

							<?php endif;?>
							</div>

						<?php endfor;?>
						
						<div class="section-pagination__item">
							<a class="pagination-button" href="<?= HOST?>admin/blog?page=<?php echo ( $pagination['page_number'] + 1 )?>">вперед</a>
						</div>
					</div>
				</div>
			</div>
		</div>
<!-- build:js1 js/jquery.js -->
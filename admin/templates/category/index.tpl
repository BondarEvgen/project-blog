	
		<div class="admin-page__content-form">
			<div class="admin-form" style="width: 900px;">
<?php include ROOT . 'admin/templates/components/success.tpl'?>

<?php include ROOT . 'admin/templates/components/errors.tpl'?>
				<div class="admin-form__item d-flex justify-content-between mb-20">
					<h2 class="heading">Category - all categories</h2><a class="secondary-button" href="<?= HOST?>admin/category-new">Add category</a>
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
					<?php foreach( $cats as $cat):?>
						<tr>
							<td><?php echo $cat[ 'id' ];?></td>
							<td><a href="<?= HOST?>admin/category-edit?id=<?= $cat[ 'id' ]?>"><?php echo $cat[ 'title' ];?></a></td>
							<td>
								<a  href="<?= HOST?>admin/category-delete?id=<?php echo $cat[ 'id' ];?>" class="icon-delete"></a>
							</td>
						</tr>
					<?php endforeach;?>
					
					</tbody>
				</table>

			</div>
		</div>
<!-- build:js1 js/jquery.js -->
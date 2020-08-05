<main class="page-blog">
		<div class="container">
			<div class="page-blog__header">
				<h2 class="heading">Блог </h2>
			</div>
			<div class="page-blog__posts">
			
        <?php foreach( $posts as $post ):?>

          <div class="card-post">
            <div class="card-post__img">
              <a href="<?=HOST?>blog/<?=$post[ 'id' ]?>">
                <img src="<?= HOST?>usercontent/blog/blog-small/<?php echo !empty($post[ 'cover_small' ]) ? $post[ 'cover_small' ] : 'No-image-found.png';?>"
                     alt="<?=$post[ 'title' ]?>" 
                />
              </a>
            </div>
            <h4 class="card-post__title"><a href="#"><?=$post[ 'title' ]?></a></h4>
          </div>

        <?php endforeach;?>
				
			</div>
			<div class="page-blog__pagination">
				<div class="section-pagination">
					<div class="section-pagination__item">
						<a class="pagination-button" href="<?= HOST?>blog?page=<?php echo ($pagination['page_number'] - 1);?>">назад</a>
					</div>

						<?php for( $i = 1; $i <= $pagination[ 'number_of_pages' ]; $i++):?>

						<div class="section-pagination__item">

							<?php if( $i == $pagination[ 'page_number' ]):?>
									<a class="pagination-button active" href="<?= HOST?>blog?page=<?= $i?>"><?= $i?></a>
							<?php else:?>
									<a class="pagination-button " href="<?= HOST?>blog?page=<?= $i?>"><?= $i?></a>
							<?php endif;?>
	
						</div>

						<?php endfor;?>
				
					<div class="section-pagination__item">
						<a class="pagination-button" href="<?= HOST?>blog?page=<?php echo ($pagination['page_number'] + 1);?>">вперед</a>
					</div>
				</div>
			</div>
		</div>
	</main>
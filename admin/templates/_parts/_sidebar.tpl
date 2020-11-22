	<div class="admin-page__left-panel">
		<div class="control-panel">
			<div class="control-panel__container">
				<div class="control-panel__title-wrapper">
					<h2 class="control-panel__title">Digital Nomad</h2>
					<p class="control-panel__subtitle">Control panel</p>
				</div>
				<ul class="control-panel__list">
				<?php
				// .................... Blog ....................
				?>
					<li class="control-panel__list-item">
						<a class="control-panel__list-link control-panel__list-link--active" href="#">
							<div class="control-panel__list-img-wrapper">
                <img class="control-panel__list-img" 
										 src="<?= HOST?>static/img/control-panel/book.svg" 
										 alt="icon" />
							</div>Blog
						</a>
						<ul class="control-panel__list">
							<li class="control-panel__list-item">
								<?php if( $uriModule === 'blog' ):?>

									<a class="control-panel__list-link control-panel__inner-link control-panel__inner-link--active"
										href="<?= HOST?>admin/blog">
										<div class="control-panel__list-img-wrapper">
											<img class="control-panel__list-img" 
													src="<?= HOST?>static/img/control-panel/corner.svg"
													alt="icon" />
										</div>All posts
									</a>

								<?php else:?>

									<a class="control-panel__list-link control-panel__inner-link "
										href="<?= HOST?>admin/blog">
										<div class="control-panel__list-img-wrapper">
											<img class="control-panel__list-img" 
													src="<?= HOST?>static/img/control-panel/corner.svg" 
													alt="icon" />
										</div>All posts
									</a>

								<?php endif;?>
								</li>
								<li class="control-panel__list-item">
								<?php if( $uriModule === 'post-new' ):?>

									<a class="control-panel__list-link control-panel__inner-link control-panel__inner-link--active"
										href="<?= HOST?>admin/post-new">
										<div class="control-panel__list-img-wrapper">
											<img class="control-panel__list-img" 
													src="<?= HOST?>static/img/control-panel/corner.svg" 
													alt="icon" />
										</div> Add post
									</a>

								<?php else:?>

									<a class="control-panel__list-link control-panel__inner-link "
											href="<?= HOST?>admin/post-new">
										<div class="control-panel__list-img-wrapper">
											<img class="control-panel__list-img" 
													src="<?= HOST?>static/img/control-panel/corner.svg"
													alt="icon" />
										</div> Add post
									</a>

								<?php endif;?>
								</li>
								<li class="control-panel__list-item">
								<?php if( $uriModule === 'post-edit' ):?>

									<a class="control-panel__list-link control-panel__inner-link control-panel__inner-link--active"
										href="<?= HOST?>admin/post-edit">
										<div class="control-panel__list-img-wrapper">
											<img class="control-panel__list-img" 
													src="<?= HOST?>static/img/control-panel/corner.svg"
													alt="icon" />
										</div>Edit post
									</a>

								<?php else:?>

									<a class="control-panel__list-link control-panel__inner-link "
										href="<?= HOST?>admin/post-edit">
										<div class="control-panel__list-img-wrapper">
											<img class="control-panel__list-img" 
													src="<?= HOST?>static/img/control-panel/corner.svg" 
													alt="icon" />
										</div>Edit post
									</a>

								<?php endif;?>
								</li>
							</ul>
						</li>
					
						<?php
				// .................... /Blog ....................
				?>

					<?php
				// .................... Category ....................
				?>

					<li class="control-panel__list-item">
						<a class="control-panel__list-link control-panel__list-link--active" href="#">
							<div class="control-panel__list-img-wrapper">
                <img class="control-panel__list-img" 
										 src="<?= HOST?>static/img/control-panel/book.svg" 
										 alt="icon" />
							</div>Category
						</a>
						<ul class="control-panel__list">
							<li class="control-panel__list-item">
								<?php if( $uriModule === 'blog' ):?>

									<a class="control-panel__list-link control-panel__inner-link control-panel__inner-link--active"
										href="<?= HOST?>admin/category">
										<div class="control-panel__list-img-wrapper">
											<img class="control-panel__list-img" 
													src="<?= HOST?>static/img/control-panel/corner.svg"
													alt="icon" />
										</div>All category
									</a>

								<?php else:?>

									<a class="control-panel__list-link control-panel__inner-link "
										href="<?= HOST?>admin/category">
										<div class="control-panel__list-img-wrapper">
											<img class="control-panel__list-img" 
													src="<?= HOST?>static/img/control-panel/corner.svg" 
													alt="icon" />
										</div>All category
									</a>

								<?php endif;?>
								</li>
								<li class="control-panel__list-item">
								<?php if( $uriModule === 'post-new' ):?>

									<a class="control-panel__list-link control-panel__inner-link control-panel__inner-link--active"
										href="<?= HOST?>admin/category-new">
										<div class="control-panel__list-img-wrapper">
											<img class="control-panel__list-img" 
													src="<?= HOST?>static/img/control-panel/corner.svg" 
													alt="icon" />
										</div> Add category
									</a>

								<?php else:?>

									<a class="control-panel__list-link control-panel__inner-link "
											href="<?= HOST?>admin/category-new">
										<div class="control-panel__list-img-wrapper">
											<img class="control-panel__list-img" 
													src="<?= HOST?>static/img/control-panel/corner.svg"
													alt="icon" />
										</div> Add category
									</a>

								<?php endif;?>
								</li>
								<li class="control-panel__list-item">
								<?php if( $uriModule === 'post-edit' ):?>

									<a class="control-panel__list-link control-panel__inner-link control-panel__inner-link--active"
										href="<?= HOST?>admin/category-edit">
										<div class="control-panel__list-img-wrapper">
											<img class="control-panel__list-img" 
													src="<?= HOST?>static/img/control-panel/corner.svg"
													alt="icon" />
										</div>Edit category
									</a>

								<?php else:?>

									<a class="control-panel__list-link control-panel__inner-link "
										href="<?= HOST?>admin/category-edit">
										<div class="control-panel__list-img-wrapper">
											<img class="control-panel__list-img" 
													src="<?= HOST?>static/img/control-panel/corner.svg" 
													alt="icon" />
										</div>Edit category
									</a>

								<?php endif;?>
								</li>
							</ul>
						</li>

					<?php
				// .................... /Category ....................
				?>


					<li class="control-panel__list-item">
						<a class="control-panel__list-link" href="#">
							<div class="control-panel__list-img-wrapper">
                <img class="control-panel__list-img" 
										 src="<?= HOST?>static/img/control-panel/portfolio.svg" 
										 alt="icon" />
							</div>Portfolio
						</a>
					</li>
					<li class="control-panel__list-item">
						<a class="control-panel__list-link" href="#">
							<div class="control-panel__list-img-wrapper">
                <img class="control-panel__list-img" 
										 src="<?= HOST?>static/img/control-panel/file.svg" 
										 alt="icon" />
							</div>Pages
						</a>
					</li>
					<li class="control-panel__list-item">
						<a class="control-panel__list-link" href="#">
							<div class="control-panel__list-img-wrapper">
                <img class="control-panel__list-img" 
										 src="<?= HOST?>static/img/control-panel/mail.svg" 
										 alt="icon" />
								<div class="control-panel__list-img-badge">8</div>
							</div>Messages
						</a>
					</li>
					<li class="control-panel__list-item">
						<a class="control-panel__list-link" href="#">
							<div class="control-panel__list-img-wrapper">
                <img class="control-panel__list-img" 
										 src="<?= HOST?>static/img/control-panel/message.svg" 
										 alt="icon" />
								<div class="control-panel__list-img-badge">15</div>
							</div>Comments
						</a>
					</li>
					<li class="control-panel__list-item">
						<a class="control-panel__list-link" href="#">
							<div class="control-panel__list-img-wrapper">
                <img class="control-panel__list-img" 
										 src="<?= HOST?>static/img/control-panel/users.svg" 
										 alt="icon" />
							</div>Users
						</a>
					</li>
					<li class="control-panel__list-item">
						<a class="control-panel__list-link" href="#">
							<div class="control-panel__list-img-wrapper">
                <img class="control-panel__list-img" 
										 src="<?= HOST?>static/img/control-panel/settings.svg" 
										 alt="icon" />
							</div>Settings
						</a>
					</li>
				</ul>
			</div>
			<ul class="control-panel__list">
				<li class="control-panel__list-item">
					<a class="control-panel__list-link" href="#">
						<div class="control-panel__list-img-wrapper">
							<img class="control-panel__list-img" 
									 src="<?= HOST?>static/img/control-panel/user.svg" 
									 alt="icon" />
						</div>My profile
					</a>
				</li>
				<li class="control-panel__list-item">
					<a class="control-panel__list-link" href="#">
						<div class="control-panel__list-img-wrapper">
              <img class="control-panel__list-img" 
									 src="<?= HOST?>static/img/control-panel/log-out.svg" 
									 alt="icon" />
						</div>Exit
					</a>
				</li>
			</ul>
		</div>
	</div>
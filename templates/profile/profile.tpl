
<?php if( isset( $userNotLoggedIn ) ): ?>

	<div class="section">
			<div class="container">
				<div class="section__title">
					<h2 class="heading mb-35">User profile</h2>
					<p> For see your profile 
						<a href="<?= HOST?>login"> Enter</a> or
						<a href="<?= HOST?>registration">Register</a>
					</p>
				</div>
			</div>
		</div>
	</div>	

<?php endif;?>


<?php if( isset( $user ) && $user[ 'id' ] != 0 ): ?>

<main class="page-profile">
		<div class="section">
			<div class="container">
				<div class="section__title">
					<h2 class="heading">User profile</h2>
				</div>
				<div class="section__body">
					<div class="row justify-content-center">
						<div class="col-md-6">
							<?php include ROOT . 'templates/components/success.tpl'?>
						</div>
					</div>

					

							<?php if ( $user->name === NULL || $user->name === '' ):?>
								<div class="row justify-content-center">
									<div class="col-md-6">
										<div class="enter-or-reg">
											<div class="enter-or-reg__text">
												Empty profile
											</div>
										</div>
									</div>
								</div>

							<?php else: ?>

							<div class="row justify-content-center">
								<div class="col-md-2">

									<?php if( !empty( $user->avatar ) ):?>
										<div class="avatar-big"><img src="<?= HOST?>usercontent/avatars/<?= $user->avatar?>" alt="Аватарка" /></div>
									<?php else:?>
										<div class="avatar-big"><img src="<?= HOST?>usercontent/avatars/no-name.png" alt="Аватарка" /></div>
									<? endif;?>
									
								</div>
								<div class="col-md-4">
									<div class="definition-list mb-20">
									<dl class="definition">
										<dt class="definition__term">name and surname</dt>
										<dd class="definition__description"><?= $user->name?> <?= $user->surname?></dd>
									</dl>

							<?php endif;?>

								<?php if ( ( $user->country !== NULL && $user->country !== '' ) || ( $user->city !== NULL && $user->city !== '' ) ): ?>
								
									<dl class="definition">
										<dt class="definition__term">Country, city</dt>
										<dd class="definition__description">

										<?php
											if( $user->country !== NULL && $user->country !== '' ){
												echo $user->country;
											}
									
											if ( ($user->country !== NULL && $user->country !== '' ) && ( $user->city !== NULL && $user->city !== '' ) ){
												echo ', '; 
											}
									
											if( $user->city !== NULL && $user->city !== '' ){
												echo $user->city;
											}
										?>
										</dd>
									</dl>

								<?php endif;?>
							</div>

	
							<?php if( $user->name === NULL || $user->name === '' ):?>

								<div class="row justify-content-center mt-20">

								<?php include ROOT . 'templates/profile/parts.tpl'?>

								</div>

							<?php else:

 								include ROOT . 'templates/profile/parts.tpl';

 							endif;?>

						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="section bg-grey">
			<div class="container">
				<div class="section__title">
					<h2 class="heading">User coments </h2>
				</div>
				<div class="section__body">
					<div class="row justify-content-center">
						<div class="col-md-10">
							<div class="comment">
								<div class="comment__avatar"><a href="#">
										<div class="avatar-small"><img src="<?php echo HOST?>static/img/avatars/avatart-rect.jpg" alt="Аватарка" /></div>
									</a>
								</div>
								<div class="comment__data">
									<div class="comment__user-info">
										<div class="comment__username">Джон До</div>
										<div class="comment__date"><img src="<?php echo HOST?>static/img/favicons/clock.svg" alt="Дата публикации" />05 мая 2017 года 15:45</div>
									</div>
									<div class="comment__text">
										<p>Замечательный парк, обязательно отправлюсь туда этим летом.</p>
									</div>
								</div>
							</div>
							<div class="comment">
								<div class="comment__avatar"><a href="#">
										<div class="avatar-small"><img src="<?php echo HOST?>static/img/avatars/avatart-rect.jpg" alt="Аватарка" /></div>
									</a>
								</div>
								<div class="comment__data">
									<div class="comment__user-info">
										<div class="comment__username">Джон До</div>
										<div class="comment__date"><img src="<?php echo HOST?>static/img/favicons/clock.svg" alt="Дата публикации" />05 мая 2017 года 15:45</div>
									</div>
									<div class="comment__text">
										<p>Замечательный парк, обязательно отправлюсь туда этим летом.</p>
									</div>
								</div>
							</div>
							<div class="comment">
								<div class="comment__avatar"><a href="#">
										<div class="avatar-small"><img src="<?php echo HOST?>static/img/avatars/avatart-rect.jpg" alt="Аватарка" /></div>
									</a>
								</div>
								<div class="comment__data">
									<div class="comment__user-info">
										<div class="comment__username">Джон До</div>
										<div class="comment__date"><img src="<?php echo HOST?>static/img/favicons/clock.svg" alt="Дата публикации" />05 мая 2017 года 15:45</div>
									</div>
									<div class="comment__text">
										<p>Замечательный парк, обязательно отправлюсь туда этим летом.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

<?php elseif( !isset( $userNotLoggedIn ) ): ?>

	<div class="section">
			<div class="container">
				<div class="section__title">
					<h2 class="heading mb-35">User not found</h2>
					<p>
						<a href="<?= HOST?>">Back to the main page</a>
					</p>
				</div>
			</div>
		</div>
	</div>	



<?php endif; ?>


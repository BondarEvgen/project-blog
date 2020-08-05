
<?php if(isset( $user ) && $user[ 'id' ] != 0): ?>

<main class="page-profile">
	<div class="section">
		<div class="section__title">
			<div class="container">
				<h2 class="heading">Edit profile </h2>
			</div>
		</div>
	 
		<div class="section__body">
			<form action="<?php echo HOST;?>profile-edit/<?= $user->id?>" enctype="multipart/form-data" method="POST">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-md-8">

						<?php include ROOT . 'templates/components/success.tpl'?>

						<?php include ROOT . 'templates/components/errors.tpl'?>

							<div class="form-group">
								<label class="input__label">Enter your name
									<input
										name="name" 
										class="input input--width-label" 
										type="text" 
										placeholder="Name" 
										value="<?php echo isset($_POST['name']) ? $_POST['name'] : $user->name;?>"
									/>
								</label>
							</div>
							<div class="form-group">
								<label class="input__label">Enter your surname
									<input
										name="surname" 
										class="input input--width-label" 
										type="text" 
										placeholder="Surname" 
										value="<?php echo isset($_POST['surname']) ? $_POST['surname'] : $user->surname;?>"
									/>
								</label>
							</div>
							<div class="form-group">
								<label class="input__label">Enter your email 
									<input
										name="email" 
										class="input input--width-label" 
										type="text" 
										placeholder="Email"
										value="<?php echo isset($_POST['email']) ? $_POST['email'] : $user->email;?>"
									/>
								</label>
							</div>
						</div>
					</div>
					<div class="row justify-content-center pt-40 pb-40">
						<div class="col-2">
							<div class="avatar-big">

								<?php if( !empty( $user->avatar ) ):?>
										<div class="avatar-big"><img src="<?= HOST?>usercontent/avatars/<?= $user->avatar?>" alt="Аватарка" /></div>
								<?php else:?>
										<div class="avatar-big"><img src="<?= HOST?>usercontent/avatars/no-name.png" alt="Аватарка" /></div>
								<? endif;?>

							</div>
						</div>
						<div class="col-6">
							<div class="block-upload">
								<div class="block-upload__description">
									<div class="block-upload__title">Foto</div>
									<p>Image is jpg or png, recommended width is 160px or more, height is 160px or more. Weight up to 4Mb.</p>
									<div class="block-upload__file-wrapper">
										<input name="avatar" class="file-button" type="file"/>
									</div>
								</div>
							</div>

								<?php if( !empty( $user->avatar ) ):?>

									<label class="checkbox__item mt-20">
										<input class="checkbox__btn" type="checkbox" name="deleteAvatar" />
										<span class="checkbox__label">Delete</span>
									</label>
									
								<?php endif;?>
								
						</div>
					</div>
					<div class="row justify-content-center">
						<div class="col-md-8">
							<div class="form-group">
								<label class="input__label">Enter your country
									<input
										name="country" 
										class="input input--width-label" 
										type="text" 
										placeholder="Country"
										value="<?php echo isset($_POST['country']) ? $_POST['country'] : $user->country;?>" 
									/>
								</label>
							</div>
							<div class="form-group">
								<label class="input__label">Enter your сity
									<input
										name="city" 
										class="input input--width-label" 
										type="text" 
										placeholder="City"
										value="<?php echo isset($_POST['city']) ? $_POST['city'] : $user->city;?>"
									/>
								</label>
							</div>
							<div class="form-group form-group--buttons-left">
								<button class="primary-button" name="updateProfile" type="submit">Save</button>
								<a class="secondary-button" href="<?php echo HOST;?>profile">Cancel</a>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</main>

<?php elseif( isset( $userNotFound ) ): ?>

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
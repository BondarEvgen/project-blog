
<!-- sticky-footer-content -->
<div class="sticky-footer-content">

<?php
	include ROOT . "templates/_parts/_admin-panel.tpl";
?>

<?php if ( isset( $pageClass )  && $pageClass === 'main-page'):?>

<header class="section-header section-header--white ">
	
<?php else: ?>

<header class="section-header ">

<?php endif;?>

		<div class="section-header__content">
			<h2 class="section-header__content-title">Digital Nomad</h2>
			<p class="section-header__content-subtitle">IT specialist page</p>
			<nav class="nav">
				<ul class="nav__list">
					<li class="nav__list-item"><a class="nav__list-item-link" href="about.html">About me</a></li>
					<li class="nav__list-item"><a class="nav__list-item-link" href="portfolio.html">Portfolio</a></li>
					<li class="nav__list-item"><a class="nav__list-item-link" href="<?= HOST?>blog">The blog</a></li>
					<li class="nav__list-item"><a class="nav__list-item-link" href="contacts.html">Contacts</a></li>
				</ul>
			</nav>
		</div>
	</header>
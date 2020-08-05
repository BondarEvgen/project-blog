<?php


ob_start();
// echo '<h1>Hi from about.tpl</h1>';
include ROOT . 'templates/about/about.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";

// echo "about/index.php";
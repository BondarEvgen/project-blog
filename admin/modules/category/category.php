<?php 

$cats = R::find('category', 'ORDER BY id DESC');

ob_start();

include ROOT . 'admin/templates/category/index.tpl';

 $content = ob_get_contents();

ob_clean();

include ROOT . 'admin/templates/template.tpl';


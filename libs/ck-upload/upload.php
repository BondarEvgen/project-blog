<?php

require './../../config.php';
require './../resize.php';
require './../functions.php';
// Required: anonymous function reference number as explained above.
$funcNum = $_GET['CKEditorFuncNum'] ;

require 'image-upload.php';

// Usually you will only assign something here if the file could not be uploaded.
$message = 'The uploaded file has been renamed';

echo "<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction($funcNum, '$url', '$message');</script>";


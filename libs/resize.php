<?php 

function resize($source_image_path, $resized_image_path, $resaize)
{


    if (!file_exists($source_image_path)) {
        return false;
    }

    if (!getimagesize($source_image_path)) {
        return false;
    }

    $source_path = $source_image_path;

    /*
 * Add file validation code here
 */

    list($source_width, $source_height, $source_type) = getimagesize($source_path);

    switch ($source_type) {
        case IMAGETYPE_GIF:
            $source_gdim = imagecreatefromgif($source_path);
            break;
        case IMAGETYPE_JPEG:
            $source_gdim = imagecreatefromjpeg($source_path);
            break;
        case IMAGETYPE_PNG:
            $source_gdim = imagecreatefrompng($source_path);
            break;
    }

     if( $source_width > $source_height ) {
        $result_width = $resaize;
        $result_height = $resaize / $source_width * $source_height;
     }

     
     if( $source_height > $source_width ) {
        $result_height = $resaize;
        $result_width = $resaize / $source_height * $source_width;
    }

 
    /*
 * Resize the image into a temporary GD image
 */

    $temp_gdim = imagecreatetruecolor( $result_width, $result_height );
    imagecopyresampled(
        $temp_gdim,
        $source_gdim,
        0,
        0,
        0,
        0,
        $result_width,
        $result_height,
        $source_width,
        $source_height
    );

  


    imagejpeg( $temp_gdim, $resized_image_path, 90 );
    imagedestroy( $source_gdim );
    imagedestroy( $temp_gdim );
    return true;
}



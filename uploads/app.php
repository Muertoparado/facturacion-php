<?php

function autoload($class){
    $directories=[
        dirname(__DIR__).'/scripts/user/',
        dirname(__DIR__).'/scripts/products'
    ];
    foreach($directories as $directory){
        $file=$directory;
        if(file_exists($file)){
            require($file);
            return;
        }
    }
   
}
spl_autoload_register('autoload')


?>
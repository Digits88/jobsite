<?php
require_once 'xataface/public-api.php';
require_once 'xataface/snippets/functions.inc.php';
df_init(__FILE__, 'xataface')->display();


foreach($_POST as $key=>$value){

	echo "\n";
    echo $key, ' => ', $value, "<br/>";
}

?>
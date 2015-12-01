<?php
/**
 * Created by PhpStorm.
 * User: rudolphm
 * Date: 26/11/2015
 * Time: 5:05 PM
 */


/*
require_once 'config.inc.php';
import('xataface/Dataface/SkinTool.php');
$skinTool =& Dataface_SkinTool::getInstance();  // The =& is important to obtain reference to skin tool instance.
$skinTool->display(array(), 'Dataface_Logo.html'); // Actually displays the Foo.html template
*/
require_once 'xataface/public-api.php';
require_once 'xataface/snippets/functions.inc.php';
df_init(__FILE__, 'xataface')->display();

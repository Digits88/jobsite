<?php
require_once 'xataface/snippets/functions.inc.php';
class tables_dashboard {
    function getPermissions(&$record){
        if ( getUser() ){
            return Dataface_PermissionsTool::ALL();
        }
        return null;
    }
}
?>
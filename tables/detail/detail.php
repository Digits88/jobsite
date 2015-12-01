<?php
class tables_detail{
	function getPermissions(&$record){
		$app =& Dataface_Application::getInstance();
        $auth =& Dataface_AuthenticationTool::getInstance();
        $user =& $auth->getLoggedInUser();
		$query =& $app->getQuery();

		if ( $query['-action'] == 'new' and !isset($user) /* and (!$record || !$record->val('registrantid'))*/ ){
			return Dataface_PermissionsTool::READ_EDIT();
		} else {


			if ( $user and isAdmin($user->val('role'))){
				return Dataface_PermissionsTool::ALL();
			} else {
				return Dataface_PermissionsTool::NO_ACCESS();
			}
		}
	}

    function block__before_new_record_form(){
        echo <<<END
    <div class="jumbotron">
		<h1>HGI Job Database Registration Form</h1>
		<p>To register in the job database, simply fill in the blanks below.</p>
		<p></p>
		<p></p>
		<div>
END;

    }

    function block__custom_stylesheets(){

        echo <<<END
		<link rel="stylesheet" type="text/css" href="styles.css" >
END;

    }

    /**
     * Trigger that is called after new records are inserted.  We will use it to
     * forward to the correct page.
     */
    function after_action_new(){
        $auth =& Dataface_AuthenticationTool::getInstance();
        $user =& $auth->getLoggedInUser();

        if ( !$user ){
            // The user is not logged in so we forward to a success page.
            header('Location: success.php');
            exit;

        }
    }

/*
    function userid__default(){
    $auth =& Dataface_AuthenticationTool::getInstance();
    $user =& $auth->getLoggedInUser();
    if ( $user ){
        $userid =& Dataface_AuthenticationTool::getInstance()->getLoggedInUser()->val('userid');
        return $userid;
    }
    return '';
}
*/

/*
function beforeSave(&$record){
	$userid = Dataface_AuthenticationTool::getInstance()->getLoggedInUser()->val('userid');
	print_r($userid);
	//print_r($record)
	$record->setValue('userid', $userid);
	
}
*/
/*
function beforeInsert(&$record){
	$userid = Dataface_AuthenticationTool::getInstance()->getLoggedInUser()->val('userid');
	print_r($userid);
	//print_r($record)
	$record->setValue('userid', $userid);
	
}
*/

}
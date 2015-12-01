<?php

/**
 * Created by PhpStorm.
 * User: rudolphm
 * Date: 30/11/2015
 * Time: 7:28 AM
 */
class actions_viewdata
{
    function handle(&$params){
        //echo "Hello World from the controller class!!";

        //to do interesting stuff here we get info from the Dataface_Application object

        $app =& Dataface_Application::getInstance();  // reference to Dataface_Application object
        $auth =& Dataface_AuthenticationTool::getInstance(); // reference to Dataface_Authentication object

        //if ( !isset($_POST['--bid-amount']) ) {
        //$request =& $app->getQuery();  // Request vars:  e.g. [-table]=>'Students', [-action]=>'hello'


        $records =& df_get_records('detail', $query);
        $user =& $auth->getLoggedInUser();  // Dataface_Record object of currently logged in user.

        $current_tablename =& $request['-table'];

        $current_record =& $app->getRecord();  // Currently selected record (Dataface_Record object)
        $results =& $app->getResultSet();  // Current found set (Dataface_QueryTool object).

        // Iterating through the results
        $it =& $results->iterator();
        while ($it->hasNext() ){
            $record =& $it->next(); // $record is a Dataface_Record object
            print_r($record->strvals());
            unset($record);  // necessary so that PHP doesn't just keep overwriting the same object.
        }

        // Perform a custom SQL Query:
        //$res = mysql_query("select * from foo inner join bar on foo.x=bar.y", $app->db());
        // .. etc ...

        // Obtain parameters from the actions.ini file for this action:
        $template_name = $params['action']['template'];  // The value of the template parameter

        //df_display(array(), $template_name);  // this form allows you to change the template to use by modifying the actions.ini file.

        df_display(array(), 'JobWorld.html');
    }
}
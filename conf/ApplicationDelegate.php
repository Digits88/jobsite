<?php


class conf_ApplicationDelegate {
   function getPermissions(&$record){
      // $record is a Dataface_Record object
        $auth =& Dataface_AuthenticationTool::getInstance();
        $user =& $auth->getLoggedInUser();
        if ( $user ) return Dataface_PermissionsTool::ALL();
      return Dataface_PermissionsTool::NO_ACCESS();
   }

   
   function beforeHandleRequest(){
    $app =& Dataface_Application::getInstance();
    $query =& $app->getQuery();
    $auth =& Dataface_AuthenticationTool::getInstance();
    $user =& $auth->getLoggedInUser();
    
    if ( $query['-table'] == 'dashboard' and ($query['-action'] == 'browse' or $query['-action'] == 'list') ){
        $query['-action'] = 'dashboard';
    }

       if(!isAdmin($user)){
       Dataface_Application::getInstance()
           ->addHeadContent(
               sprintf('<link rel="stylesheet" type="text/css" href="%s"/>',
                   htmlspecialchars(DATAFACE_SITE_URL.'/styles.css')
               )
           );
       Dataface_Application::getInstance()
                  ->addHeadContent(
                      sprintf('<link rel="stylesheet" type="text/css" href="%s"/>',
                          htmlspecialchars(DATAFACE_SITE_URL.'/jobsite.css')
                      )
                  );
       }

       Dataface_Application::getInstance()
           ->addHeadContent(
               sprintf('<link rel="stylesheet" type="text/css" href="%s"/>',
                   htmlspecialchars(DATAFACE_SITE_URL.'/css/bootstrap.css')
               )
           );

       /*
    if ( $user and !$user->val('detailid') ){
        // details haven't been updated yet
        if ( !($query['-table'] == 'detail' and $query['-action'] == 'new' )){
            // We aren't on the new record form of profiles - so
            // let's redirect there
            header(DATAFACE_SITE_HREF.'?-action=new&-table=detail&--msg='.urlencode('Please fill in your profile to continue.'));
            exit;
        }
    }
    */
}

    function getPreferences(){
        $app =& Dataface_Application::getInstance();
        $auth =& Dataface_AuthenticationTool::getInstance();
        $user =& $auth->getLoggedInUser();
        if ( $user && isAdmin($user->val('role')) ){
            return array();

        } else {

            return array(
                'show_result_stats'=>0,
                'show_jump_menu'=>0,
                'show_result_controller'=>0,
                'show_table_tabs'=>0,
                'show_actions_menu'=>0,
                'show_tables_menu'=>0,
                'show_search'=>0,
                'show_record_actions'=>0,
                'show_recent_records_menu'=>0,
                'show_record_tabs'=>0,
                'show_record_tree'=>0,
                'show_bread_crumbs'=>0);

        }

    }

    function getNavItem($key, $label){
        if (!isAdmin() ){
            switch ($key){
                case 'help':
                case 'detail':
                    // non-admin users can see these
                    throw new Exception("Use default rendering");
            }
            // Non-admin users can't see any other table.
            return null;

        } else {

            //Admin users can see everything..
            $query =& Dataface_Application::getInstance()->getQuery();
            switch ($key){
                case 'help':
                    // reports is not a table so we need to return custom properties.
                    return array(
                        'href' => DATAFACE_SITE_HREF.'?-action=help',
                        'label' => $label,
                        'selected' => ($query['-action'] == 'help')
                    );

            }


            // For other actions we need to make sure that they aren't selected
            // if the current action is reports because we want the 'reports'
            // tab to be selected only in that case.
            return array(
                'selected' => ($query['-table'] == $key and $query['-action'] != 'help')
            );
        }
    }

}

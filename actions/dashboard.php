<?php
class actions_dashboard {
    function handle(&$params){
        $details = df_get_records_array('detail', array());
        //$malecount = df_query("SELECT * , COUNT( detail.gender ) FROM detail WHERE detail.gender='male'");

        //$recentdetails = df_get_records_array('detail', array());
        $app =& Dataface_Application::getInstance();
        //$recentdetails = mysql_query("select * from detail WHERE detail.registration_date<= NOW() + INTERVAL 72 HOUR", $app->db());
        $recentdetails = mysql_query("select * from detail ", $app->db());

        $resultm = mysql_query("SELECT COUNT(gender) as c from detail WHERE gender = 'male'", $app->db());
        $resultf = mysql_query("SELECT COUNT(gender) as c from detail WHERE gender = 'female'", $app->db());
        $resultprg = mysql_query("SELECT COUNT(skills) as c from detail WHERE skills = 'programming'", $app->db());
        $resultntwk = mysql_query("SELECT COUNT(skills) as c from detail WHERE skills = 'networking'", $app->db());
        $resultadmin = mysql_query("SELECT COUNT(skills) as c from detail WHERE skills = 'sysadmin'", $app->db());


        $malecount = mysql_fetch_object($resultm)->c;
        $femalecount = mysql_fetch_object($resultf)->c;
        $prgcount = mysql_fetch_object($resultprg)->c;
        $ntwkcount = mysql_fetch_object($resultntwk)->c;
        $admincount = mysql_fetch_object($resultadmin)->c;

        //mysql_result($malecount,0,0);

        //$template_name = $params['action']['template'];
        // The value of the template parameter

        Dataface_Application::getInstance()
                   ->addHeadContent(
                       sprintf('<link rel="stylesheet" type="text/css" href="%s"/>',
                           htmlspecialchars(DATAFACE_SITE_URL.'/dashboard.css')
                       )
                   );

        df_display(array('detail'=>$details,'malecount'=>$malecount,'femalecount'=>$femalecount, 'prgcount'=>$prgcount,'ntwkcount'=>$ntwkcount,'admincount'=>$admincount), 'dashboard.html');





    }
}

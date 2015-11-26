<?php
class actions_dashboard {
    function handle(&$params){
        $details = df_get_records_array('detail', array());
        df_display(array('detail'=>$details), 'dashboard.html');
    }
}
?>
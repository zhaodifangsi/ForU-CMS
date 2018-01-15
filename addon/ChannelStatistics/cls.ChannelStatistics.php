<?php
include_once LIB_PATH.'cls.addon.php';

class ChannelStatistics extends Addon{

  public function statistics() {
    echo '<div class="am-cf am-padding"> <div class="am-fl am-cf"><strong>频道统计</strong></div> </div>';
    echo $this->getChannel();
  }

  public function getChannel($c_parent=0) {
    $str = '';
    if($this->config('channel','c_navigation')) {
      $where = 'AND c_navigation=1';
    } else {
      $where = '';
    }
    $res = $GLOBALS['db']->getAll("SELECT id,c_name,c_ifsub FROM channel WHERE c_parent = $c_parent $where ORDER BY id ASC");
    if($c_parent == 0) $str .= '<ul class="am-avg-sm-1 am-avg-md-4 am-margin am-padding am-text-center admin-content-list">';
    foreach ($res as $key => $val) {
      $count = $GLOBALS['db']->getOne("SELECT COUNT(id) FROM detail WHERE d_parent = ".$val['id']);
      if($key%4==0 && $key!=0 && $c_parent==0){
        $str .= '</ul><ul class="am-avg-sm-1 am-avg-md-4 am-margin am-padding am-text-center admin-content-list">';
      }
      if($c_parent == 0)
        $str .= '<li>';
      else
        $str .= '<dd>';
      if($val['c_ifsub']){
        $str .= $val['c_name'].':'.$count.'<small>'.$this->getChannel($val['id']).'</small>';
      } else {
        $str .= $val['c_name'].':'.$count;
      }
      if($c_parent == 0)
        $str .= '</li>';
      else
        $str .= '</dd>';
    }
    if($c_parent == 0) $str .= '</ul>';
    return $str;
  }

}
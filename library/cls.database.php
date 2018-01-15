<?php
class Database {
  private $db;
  private $file_path;
  public function __construct() {
    $this->db = $GLOBALS['db'];
    $this->file_path = '../' . SQL_DIR . '/';
    mk_dir($this->file_path);
  }
  public function tables() {
    $tbl = $this->db->getAll("SHOW TABLES");
    return get_easy_array($tbl,'Tables_in_' . DATA_NAME);
  }
  public function cols($tbl) {
    $res = $this->db->getAll("SHOW COLUMNS FROM `$tbl`");
    return $res;
  }
  public function backup() {
    //检查备份目录是否可写
    is_writeable($this->file_path) || alert_back($GLOBALS['lang']['class']['database']['is_writeable']);
    $mysql = "-- ----------\n";
    $arr_tbl = $this->tables();
    foreach ($arr_tbl as $value) {
      $this->lock($value);
      $rs_table = $this->db->getAll("SHOW CREATE TABLE `$value`");
      $sql = $rs_table[0];
      $mysql .= $sql['Create Table'] . ";\n-- ----------\n";
      $rs = $this->db->getAll("SELECT * FROM `$value`");
      if (!empty($rs)) {
        foreach ($rs as $k=>$val) {
          if (!empty($val)) {
            $keys = array_keys($val);
            $keys = array_map('addslashes', $keys);
            $keys = "`" . implode("`,`",$keys) . "`";
            $vals = array_values($val);
            $vals = array_map('addslashes', $vals);
            $vals = str_replace(array("\r\n", "\r", "\n","\t"), "", $vals);
            $vals = "'" . implode("','",$vals) . "'";
            $mysql .= $k==0 ? "INSERT INTO `$value` ($keys) VALUES ($vals)" : ",($vals)";
          }
        }
      }
      if (!empty($rs)) {
        $mysql .= ";\n-- ----------\n";
      }
    }
    $this->unlock();
    $filename = $this->file_path . DATA_NAME .'.'. date('Ymjgi') . ".sql"; //存放路径，默认存放到项目最外层
    $fp = fopen($filename, 'w');
    fputs($fp, $mysql);
    fclose($fp);
    alert_back($GLOBALS['lang']['class']['database']['backup']);
  }
  public function restore($file_name) {
    $file_name .= !strpos($file_name, '.sql') ? '.sql' : '';
    //设置超时时间为0，表示一直执行。当php在safe mode模式下无效，此时可能会导致导入超时，此时需要分段导入
    set_time_limit(0);
    $fp = @fopen($this->file_path . $file_name, "r");
    if ($fp === false) {
      die($GLOBALS['lang']['class']['database']['file']."$file_name");
    }

    $arr_tbl = $this->tables();
    if ($arr_tbl) {
      echo $GLOBALS['lang']['class']['database']['clearing'];
      foreach ($arr_tbl as $val) {
        $this->db->query("DROP TABLE IF EXISTS $val");
      }
      echo $GLOBALS['lang']['class']['database']['cleared'];
    }

    echo $GLOBALS['lang']['class']['database']['importing'];
    // 导入数据库的MySQL命令
    $sql=fread($fp,filesize($this->file_path.$file_name));
    fclose($fp);
    $sql=explode("-- ----------",$sql);
    foreach ($sql as $val) {
      $this->db->query($val);
    }
    echo $GLOBALS['lang']['class']['database']['imported'];
    alert_back($GLOBALS['lang']['class']['database']['imported']);
  }
  public function repair() {
    $arr_tbl = $this->tables();
    foreach ($arr_tbl as $val) {
      $this->lock($val);
    }
    $tbls = implode('`,`', $arr_tbl);
    $list = $this->db->query("REPAIR TABLE `{$tbls}`");
    $this->unlock();
    if ($list) {
      alert_back($GLOBALS['lang']['class']['database']['repaired']);
    } else {
      alert_back($GLOBALS['lang']['class']['database']['repair_failed']);
    }
  }
  public function optimize() {
    $arr_tbl = $this->tables();
    foreach ($arr_tbl as $val) {
      $this->lock($val);
    }
    $tbls = implode('`,`', $arr_tbl);
    $list = $this->db->query("OPTIMIZE TABLE `{$tbls}`");
    $this->unlock();
    if ($list) {
      alert_back($GLOBALS['lang']['class']['database']['optimized']);
    } else {
      alert_back($GLOBALS['lang']['class']['database']['optimize_failed']);
    }
  }
  public function init() {
    $arr_tbl = $this->tables();
    foreach ($arr_tbl as $val) {
      if(in_array($val, array(DATA_PREFIX.'role',DATA_PREFIX.'system',DATA_PREFIX.'template'))!==false) continue;
      $this->lock($val);
      $this->db->truncate($val);
    }
    $this->unlock();
    // 添加超级管理员
    $this->db->query("INSERT INTO `user` (`id`,`u_rid`,`u_enable`,`u_name`,`u_psw`,`u_picture`,`u_cash`,`u_point`,`u_level`,`u_tname`,`u_email`,`u_mobile`,`u_question`,`u_answer`,`u_date`,`u_code`,`last_login`,`u_isadmin`) VALUES ('1','1','1','admin','21232f297a57a5a743894a0e4a801fc3','','0','0','0','administrator','','','','','0','','0','1')");
    alert_back($GLOBALS['lang']['class']['database']['init']);
  }
  private function lock($tablename, $op = "WRITE") {
    return $this->db->query("LOCK TABLES `" . $tablename . "` " . $op );
  }
  private function unlock() {
    return $this->db->query("UNLOCK TABLES");
  }
  public function __destruct() {
    unset($this->db);
    unset($this->file_path);
  }
}
?>

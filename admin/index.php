<?php
include '../library/inc.php';

switch ($act) {
  case 'caf':
    alert_back('清理了 ' . clear_all_files() . ' 个文件');
  break;

  case 'welcome':
    header('location:cms_welcome.php');
  break;

  case 'logout':
    userLogout();
    header('location:cms_login.php');
  break;

  case 'baiduSend':
    // 生成数组数据
    $y = date("Y");
    $m = date("m");
    $d = date("d");
    $days = mktime(0,0,0,$m,$d,$y);
    $daye = mktime(23,59,59,$m,$d,$y);
    getDetailBaiduSend($days,$daye);
  break;

  default:
    header('location:cms_login.php');
  break;
}

function getDetailBaiduSend($s,$e) {
  $res = $GLOBALS['db']->getAll("SELECT id FROM detail WHERE d_date<" . $e . " AND d_date>=" . $s);
  if (!empty($res)) {
    $urls = array();
    foreach ($res as $val) {
      $urls[] = $GLOBALS['cms']['s_domain'] . '/' . d_url($val['id']) . ',';
    }
    // 百度推送
    $api = BAIDU_API;
    $ch = curl_init();
    $options =  array(
      CURLOPT_URL => $api,
      CURLOPT_POST => true,
      CURLOPT_RETURNTRANSFER => true,
      CURLOPT_POSTFIELDS => implode("\n", $urls),
      CURLOPT_HTTPHEADER => array('Content-Type: text/plain'),
    );
    curl_setopt_array($ch, $options);
    $result = curl_exec($ch);
    $j = json_decode($result,true);
    if (!empty($j['error'])) {
      alert_back('error:' . $j['error'] . ', message:' . $j['message']);
    } else {
      alert_back('剩余:' . $j['remain'] . '条，成功:' . $j['success'] . '条');
    }
  } else {
    alert_back('无新数据无需推送');
  }
}
?>
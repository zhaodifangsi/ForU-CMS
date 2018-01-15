<?php
include_once 'conf.php';
include_once '../library/inc.php';

if ($act == 'login') {
  $u_name = str_safe($_GET['name']);
  $u_psw = str_safe($_GET['pass']);
  $openid = str_safe($_GET['oid']);
  if ($row = $db->getRow("SELECT id,u_openid FROM user WHERE u_name = '$u_name' AND u_psw = '".md5($u_psw)."'")) {
    // 判断是否存在openid，如果存在就不再更新
    if (!$row['u_openid']) {
      $db->query("UPDATE user SET u_openid = '$openid' WHERE id = $row['id']");
    }
    $res['err'] = 0;
    $res['msg'] = 'success';
  } else {
    $res['err'] = 50010;
    $res['msg'] = 'Data error';
  }
}

elseif ($act == 'check') {
  $openid = str_safe($_GET['oid']);
  if ($db->getOne("SELECT id FROM user WHERE u_openid = '$openid '")) {
    $res['err'] = 0;
    $res['msg'] = 'success';
  } else {
    $res['err'] = 50010;
    $res['msg'] = 'Data error';
  }
}

elseif ($act == 'getUserInfo') {
  $openid = str_safe($_GET['openid']);
  if ($res['ex'] = $db->getRow("SELECT * FROM user WHERE u_openid = '$openid'")) {
    $res['err'] = 0;
    $res['msg'] = 'success';
  } else {
    $res['err'] = 50010;
    $res['msg'] = 'Data error';
  }
}

else {
  $res['err'] = 1;
  $res['msg'] = 'Illegal access';
}

die(json_encode($res));

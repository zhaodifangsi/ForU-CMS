<?php
include_once 'conf.php';
include_once '../library/inc.php';

$arr_succ = array('err'=>0,'msg'=>'success');
$arr_fail = array('err'=>50010,'msg'=>'Data error');

// 判断用户状态
if ($act == 'check') {
  $openid = str_safe($_GET['openid']);
  $res = $arr_succ;

  if ($openid && $res['ex'] = $db->getOne("SELECT id FROM user WHERE u_openid = '$openid'")) {
    // pass
  } else {
    $res = $arr_fail;
  }
}

elseif ($act == 'getMobileCode') {
  $openid = str_safe($_GET['openid']);
  $res = $arr_succ;

  if ($phoneNumbers = $db->getOne("SELECT u_mobile FROM user WHERE u_openid = '$openid'")) {
    $res['ex'] = str_code(6);
    // 发送短信
    /*
    include '../library/cls.alisms.php';
    $sms = new Alisms();
    $sms->send($phoneNumbers, $res['ex'], $signName, $templateParam);
    */
  } else {
    $res = $arr_fail;
  }
}

// 创建订单
// o_state{0:创建, 5:支付, 10:发货, 15:收货, 40:退货, 45:退款, 80:完成}
elseif ($act == 'setOrder') {
  include '../library/cls.wepay.php';

  $arr['u_id'] = str_safe($_GET['u_id']);
  $arr['g_id'] = str_safe($_GET['g_id']);
  $arr['o_sn'] = gmtime().str_code(6);
  $arr['o_prop'] = str_safe($_GET['o_prop']);
  $arr['o_qty'] = str_safe($_GET['o_qty']);
  $arr['o_cost'] = str_safe($_GET['o_price']);
  $arr['o_state'] = 0;
  $arr['o_date'] = gmtime();

  if ($db->autoExecute('order', $arr, 'INSERT')) {
    $res = $arr_succ;
    $res['ex'] = $db->getRow("SELECT * FROM order WHERE u_id = ".$arr['u_id']." ORDER BY id DESC");
    // 调用微信统一下单
    $wepay = new Wepay();
    $wepay->pay($arr['o_cost'],$db->getOne("SELECT u_openid FROM user WHERE id = ".$arr['u_id']),$res['ex']['id']);
  } else {
    $res = $arr_fail;
  }
}

// 获取用户收件信息
elseif ($act == 'getAddr') {
  $openid = str_safe($_GET['openid']);
  if ($row = $db->getRow("SELECT u.id,u.u_tname,u.u_mobile,ua.ua_location FROM user AS u LEFT JOIN user_address AS ua ON ua.u_id = u.id WHERE u.u_openid = '$openid'")) {
    $res = $arr_succ;
    $res['ex'] = $row;
  } else {
    $res = $arr_fail;
  }
}

// 用户地址新增
elseif ($act == 'addr') {
  $arr['u_tname'] = str_safe($_POST['addr_name']);
  $arr['u_mobile'] = str_safe($_POST['addr_mobile']);
  $openid = str_safe($_GET['openid']);
  // 数据更新
  if ($id = $db->getOne("SELECT id FROM user WHERE u_openid='$openid'")) {
    $db->autoExecute('user', $arr, 'UPDATE', "id = $id");
  }
  // 数据更新到地址表
  $arr = array();
  $arr['ua_location'] = str_safe($_POST['addr_address']);
  if ($aid = $db->getOne("SELECT id FROM user_address WHERE u_id=$id")) {
    $db->autoExecute('user_address', $arr, 'UPDATE', "id = $aid");
  } else {
    $arr['u_id'] = $id;
    $db->autoExecute('user_address', $arr, 'INSERT');
  }

  $res = $arr_succ;
}

// 用户登录
elseif ($act == 'login') {
  $openid = str_safe($_GET['openid']);
  $mobnum = str_safe($_GET['mobnum']);
  if ($arr = $db->getRow("SELECT id,u_mobile FROM user WHERE u_openid='$openid'")) {
    $res['ex'] = $arr['id'];
    if (empty($arr['u_mobile'])) {
      $db->query("UPDATE user SET u_mobile = '$mobnum'");
    }
  } else {
    $db->query("INSERT INTO user (u_openid,u_mobile) VALUES ('$openid','$mobnum')");
    $res['ex'] = $db->getOne("SELECT id FROM user WHERE u_openid='$openid'");
  }
  $res = $arr_succ;
}

// 获取用户信息
elseif ($act == 'getUserInfo') {
  $openid = str_safe($_GET['openid']);
  $res = $arr_succ;
  if ($res['ex'] = $db->getRow("SELECT * FROM user WHERE u_openid = '$openid'")) {
  } else {
    $res = $arr_fail;
  }
}

else {
  $res['err'] = 1;
  $res['msg'] = 'Illegal access';
}

die(json_encode(@$res));

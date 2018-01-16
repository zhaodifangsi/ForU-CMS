<?php
include '../../library/inc.php';
include '../config/wxwork.php';
include '../config/notice.php';
include '../library/cls.base.php';

$wxbase = new \Wxwork\Base();
$access_token = $wxbase->getAccessToken();

if ($act == 'send_notice') {
    $dept_ids = $_POST['dept_ids'];
    $user_ids = $_POST['user_ids'];
    // $subject = $_POST['subject'];
    $msg = $_POST['msg'];

    // 群发信息
    include '../library/cls.msg.php';
    $wxmsg = new \Wxwork\Msg();
    $json_user = '';
    if (!empty($user_ids)) {
        $json_user .= '"touser" : "'.$user_ids.'", ';
    }
    if (!empty($dept_ids)) {
        $json_user .= '"toparty" : "'.$dept_ids.'", ';
    }
    $data = '{'.$json_user.'"msgtype" : "text", "agentid" : '.AGENTID.', "text" : {"content" : "'.$msg.'"}, "safe":0 }';
    $res = $wxmsg->sendMsg($access_token, $data);

    if ($res->errcode==0) {
        $res->msg = '通知已发送完毕';
    }

    die(json_encode($res));
}

else {
    die('Illegal');
}

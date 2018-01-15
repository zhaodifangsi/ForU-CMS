<?php
include '../../config/wxwork.php';
include '../../library/inc.php';
include '../library/cls.base.php';

$wxbase = new \Wxwork\Base(CORPID, APPSCRET);
$access_token = $wxbase->getAccessToken();

if ($act == 'send_notice') {
    include '../library/cls.user.php';
    $wxuser = new \Wxwork\User(CORPID, APPSCRET);

    $dept_ids = $_POST['dept_ids'];
    $user_ids = $_POST['user_ids'];
    $subject = $_POST['subject'];
    $msg = $_POST['msg'];

    // 群发信息
    include '../library/cls.msg.php';
    $wxmsg = new \Wxwork\Msg();
    $data = '{"touser" : "'.$user_ids.'", "toparty" : "'.$dept_ids.'", "msgtype" : "text", "agentid" : '.AGENTID.', "text" : {"content" : "'.$msg.'"}, "safe":0 }';
    $res = $wxmsg->sendMsg($access_token, $data);

    if ($res['errcode']==0) {
        $res['msg'] = '通知已发送完毕';
    }
    die(json_encode($res));
}

else {
    die('Illegal');
}

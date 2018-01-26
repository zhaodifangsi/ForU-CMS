<?php
include 'config/wxwork.php';
include_once "library/crypt/cls.msgcrypt.php";

if (!empty($_GET['echostr'])) {
  $msg_signature = urldecode($_GET['msg_signature']);
  $timestamp = urldecode($_GET['timestamp']);
  $nonce = urldecode($_GET['nonce']);
  if ($_SERVER['REQUEST_METHOD'] === 'GET' && !empty($_GET['echostr'])) {
    $echostr = urldecode($_GET['echostr']);
    $replystr = '';

    // var_dump(TOKEN.'<br>'.AESKEY.'<br>'.CORPID.'<br>'.$echostr);exit;
    $wxcpt = new WXBizMsgCrypt(TOKEN, AESKEY, CORPID);
    $err_code = $wxcpt->VerifyURL($msg_signature, $timestamp, $nonce, $echostr, $replystr);
    if ($err_code == 0)
      die($replystr);
    else
      print("ERR: " . $err_code . "\n\n");
  }
  //如果是微信推送消息
  else if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // post请求的密文数据
    // $sReqData = HttpUtils.PostData();
    $sReqData = file_get_contents("php://input"); //必须通过输入流方式获取post数据, 数据头为{"Content-Type":"application/xml"}
    $xml       = new \DOMDocument();
    $xml->loadXML($sReqData);
    $ToUserName  = $xml->getElementsByTagName('ToUserName')->item(0)->nodeValue;//其实就是目标套件的suiteid
    $ToUserNameType = '';

    $sassInfo = array();//存储当前推送回调这个套件的信息, 用来实例化
    foreach($this->suite_id as $k => $v){
      if($v['suite_id'] == $ToUserName){
        $sassInfo = $v;
        $ToUserNameType = 'suiteid';
        break;
      }
    }

    //和上面的实例化对比就体现出来这个用suite_ticket替换corpid
    $this->wxcpt = new WXBizMsgCrypt($sassInfo['suite_token'], $sassInfo['suite_encoding_aes_key'], $ToUserName);
    $err_code = -1;
    $sMsg     = "";  // 解析之后的明文
    $err_code = $this->wxcpt->DecryptMsg($msg_sig, $time_stamp, $nonce, $sReqData, $sMsg);//解密方法内部对$sMsg进行赋值
    if($err_code == 0){
        if ($ToUserNameType == 'sutieid') {
            $this->exceDec($sMsg);
        } else if ($ToUserNameType == 'corpid') {
            $this->exceDecInfo($sMsg);
        }

    }
  }
  //如果是从服务商网站发起的授权, 授权完成后是get请求指直接302到服务商网站,
  else if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($get['auth_code'])) {}
  //其他请求, 不处理
  else {
    LogException::write("otherrequest\n\n");
  }
}

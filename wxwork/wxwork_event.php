<?php
include 'config/wxwork.php';
include_once "library/crypt/cls.msgcrypt.php";

if (!empty($_GET['echostr'])) {
  $msg_signature = urldecode($_GET['msg_signature']);
  $timestamp = urldecode($_GET['timestamp']);
  $nonce = urldecode($_GET['nonce']);
  $echostr = urldecode($_GET['echostr']);
  $replystr = '';

  // var_dump(TOKEN.'<br>'.AESKEY.'<br>'.CORPID.'<br>'.$echostr);exit;
  $wxcpt = new WXBizMsgCrypt(TOKEN, AESKEY, CORPID);
  $err_code = $wxcpt->VerifyURL($msg_signature, $timestamp, $nonce, $echostr, $replystr);
  if ($err_code == 0) {
    die($replystr);
  } else {
    print("ERR: " . $err_code . "\n\n");
  }
}

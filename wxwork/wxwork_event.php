<?php
include '../config/wxwork.php';
include_once "library/crypt/cls.msgcrypt.php";

if (!empty($_GET['echostr'])) {
  $echostr = urldecode($_GET['echostr']);
  $msg_signature = urldecode($_GET['msg_signature']);
  $timestamp = urldecode($_GET['timestamp']);
  $nonce = urldecode($_GET['nonce']);

  $replystr = '';
  // var_dump(TOKEN.'<br>'.ENCODINGKEY.'<br>'.CORPID);exit;
  $wxcpt = new \Wxwork\WXBizMsgCrypt(TOKEN, ENCODINGKEY, CORPID);
  $err_code = $wxcpt->VerifyURL($msg_signature, $timestamp, $nonce, $echostr, $replystr);
  if ($err_code == 0) {
    die($replystr);
  } else {
    print("ERR: " . $err_code . "\n\n");
  }
}

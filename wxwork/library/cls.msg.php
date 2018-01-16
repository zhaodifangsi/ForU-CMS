<?php
namespace Wxwork;
class Msg extends Base {
  public function __construct() {}

  // 发送消息
  public function sendMsg($access_token, $data){
    $access_token = $this->getAccessToken();
    $url = "https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=$access_token";
    return json_decode(\https_post($url, $data));
  }
}

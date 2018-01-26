<?php
namespace Wxwork;
class Api extends Base {
  public function __construct() {}

  // 获取第三方应用凭证
  public function getSuiteToken(){
    $url = "https://qyapi.weixin.qq.com/cgi-bin/service/get_suite_token";
    $data = '{"suite_id":"'.SUITEID.'" , "suite_secret": "'.SUITESCRET.'", "suite_ticket": "ticket_value"}';
    return json_decode(\https_post($url, $data));
  }

  // 设置应用
  public function setApp(){
    $access_token = $this->getAccessToken();
    $url = "https://qyapi.weixin.qq.com/cgi-bin/agent/set?access_token=$access_token";
    return json_decode(\https_post($url));
  }

  // 获取应用列表
  public function getAppList(){
    $access_token = $this->getAccessToken();
    $url = "https://qyapi.weixin.qq.com/cgi-bin/agent/list?access_token=$access_token";
    return json_decode(\https_get($url));
  }
}

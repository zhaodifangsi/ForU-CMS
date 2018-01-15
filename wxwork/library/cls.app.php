<?php
namespace Wxwork;
class App extends Base {
  // 获取应用
  public function getApp($agent_id){
    $access_token = $this->getAccessToken();
    $url = "https://qyapi.weixin.qq.com/cgi-bin/agent/get?access_token=$access_token&agentid=$agent_id";
    return json_decode(\https_get($url));
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

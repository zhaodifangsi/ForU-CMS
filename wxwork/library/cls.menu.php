<?php
namespace Wxwork;
// 仅企业可调用
class Menu extends Base {

  // 创建菜单
  public function setMenu($agent_id, $data){
    $access_token = $this->getAccessToken();
    $url = "https://qyapi.weixin.qq.com/cgi-bin/menu/create?access_token=$access_token&agentid=$agent_id";
    return json_decode(\https_post($url, $data));
  }

  // 获取菜单
  public function getMenu($agent_id){
    $access_token = $this->getAccessToken();
    $url = "https://qyapi.weixin.qq.com/cgi-bin/menu/get?access_token=$access_token&agentid=$agent_id";
    return json_decode(\https_get($url));
  }

  //删除菜单
  public function delMenu($agent_id){
    $access_token = $this->getAccessToken();
    $url = "https://qyapi.weixin.qq.com/cgi-bin/menu/delete?access_token=$access_token&agentid=$agent_id";
    return json_decode(\https_get($url));
  }
}
